from django.shortcuts import render, HttpResponseRedirect, HttpResponse
from django.views.generic import *
from django.contrib.auth.decorators import login_required
from .models import *
from django.core.urlresolvers import reverse
from django.db.models.query import Q
from django.utils import timezone
# import datetime
from datetime import datetime, timedelta

from paypal.standard.models import ST_PP_COMPLETED
from paypal.standard.ipn.signals import valid_ipn_received
from django.conf import settings
# from datetime import *
from sermepa.forms import SermepaPaymentForm
from sermepa.models import SermepaIdTPV
from payments.models import Payment,MoneyToWallet,PaypalPaymentDetails,Wallet,WalletOrder
from paypal.standard.forms import PayPalPaymentsForm
from payments import choices as payment_choices
# from datetime import datetime
from decimal import Decimal
import userprofiles
import json
import pytz
from userprofiles.models import OrderNotification, ServiceRating, \
    CheckoutPromoCode
from orders.models import Order
from userprofiles.models import *
from carthandler.models import Cart as newcart
from paypalrestsdk import Payment
import logging

import time
utc=pytz.UTC
logging.basicConfig(level=logging.INFO)
class AddToCart(RedirectView):
    def post(self, request, *args, **kwargs):
        if not request.user.is_authenticated():
            return HttpResponse(json.dumps('user is not authenticated'), content_type="application/json")
        else:
            
            user = User.objects.get(id=request.user.id)
            lb_id = request.POST.get('lunchbox')
            times=request.POST.get('time')
            qty = int(request.POST.get('qty'))
            date= request.POST.get('date')
            date = time.strptime(date, "%b %d %Y")
            x_date=str(date.tm_year)+'-'+str(date.tm_mon)+'-'+str(date.tm_mday)
            
            a=Lunchbox.objects.filter(id=lb_id).update(useless_date=x_date,useless_time=times)
            lb = userprofiles.models.Lunchbox.objects.get(id=lb_id)
            try:
                basket = Basket.objects.get(user=user, lunchbox=lb, is_catering=False)
                basket.qty += qty
                basket.save()
            except Basket.DoesNotExist:
                Basket.objects.create(user=User.objects.get(id=request.user.id), lunchbox=lb, qty=qty).save()
            items_in_cart = len(Basket.objects.filter(user=User.objects.get(id=request.user.id)))
            return HttpResponse(json.dumps({'msg': 'success', 'items': items_in_cart}), content_type="application/json")


class AddToCateringCart(RedirectView):
    def post(self, request, *args, **kwargs):
        if not request.user.is_authenticated():
            return HttpResponse(json.dumps('user is not authenticated'), content_type="application/json")
        else:
            user = request.user
            lb_id = request.POST.get('lunchbox')
            qty = int(request.POST.get('qty'))
            lb = userprofiles.models.Lunchbox.objects.get(id=lb_id)
            try:
                basket = Basket.objects.get(user=user, lunchbox=lb, is_catering=True)
                basket.qty += qty
                basket.save()
            except Basket.DoesNotExist:
                Basket.objects.create(user=user, lunchbox=lb, qty=qty, is_catering=True).save()
            items_in_cart = len(Basket.objects.filter(user=user))
            return HttpResponse(json.dumps({'msg': 'success', 'items': items_in_cart}), content_type="application/json")

    def get(self, request, *args, **kwargs):
        if not request.user.is_authenticated():
            return HttpResponse(json.dumps('user is not authenticated'), content_type="application/json")
        else:
            user = User.objects.get(id=request.user.id)
            item_id = kwargs.get('item_id')
            lb = userprofiles.models.Lunchbox.objects.get(id=item_id)
            qty = 1 if lb.restaurant.min_order is None else lb.restaurant.min_order

            try:
                basket = Basket.objects.get(user=user, lunchbox=lb, is_catering=True)
                basket.qty += qty
                basket.save()
            except Basket.DoesNotExist:
                Basket.objects.create(user=User.objects.get(id=request.user.id), lunchbox=lb, qty=qty, is_catering=True).save()
            return HttpResponseRedirect('/catering_cart')


class RemoveFromCart(RedirectView):
    def get(self, request, *args, **kwargs):
        item_id = kwargs.get('item_id')
        Basket.objects.get(id=item_id).delete()
        return HttpResponseRedirect('/cart/')


class RemoveFromCateringCart(RedirectView):
    def get(self, request, *args, **kwargs):
        item_id = kwargs.get('item_id')
        Basket.objects.get(id=item_id).delete()
        return HttpResponseRedirect('/catering_cart/')


class UpdateOrderItemQty(RedirectView):
    def get(self, request, *args, **kwargs):
        new_qty = request.GET.get('new_qty')
        order_item_id = request.GET.get('order_item_id')

        order_item = Basket.objects.filter(id=order_item_id)

        if order_item:
            order_item[0].qty = new_qty
            order_item[0].save()

        return HttpResponseRedirect('/cart/')


class Cart(TemplateView):
    def get(self, request, *args, **kwargs):
        if not request.user.is_authenticated():
            return HttpResponseRedirect('/')
        if not request.user.profile.is_filled():
            return HttpResponseRedirect('/edit_user_profile/')
        items = Basket.objects.filter(user=request.user,
                                      is_catering=False,
                                      lunchbox__available_till__gte=
                                      # django.utils.timezone.now())
                                      datetime.datetime.now())
        #print 'cart',items
        user = User.objects.get(id=request.user.id)

        if not request.user.is_staff:
            company_form = userprofiles.forms.ProfileCompanyForm(initial={
                'first_name': user.first_name,
                'last_name': user.last_name,
                'company_name': user.profile.company.name,
                'company_street': user.profile.company.street,
                'company_zipcode': user.profile.company.zip_code,
                'company_phone': user.profile.company.phone,
            })

        total = 0.0
        total_with_discount = 0.0
        company_discount = 0.0
        for i in items:
            total += i.lunchbox.price * i.qty
            i.lunchbox.discount_price = self.get_discount_price(user.id, i.lunchbox.id, i.qty)
            company_discount += self.get_amount_with_discount(user.id, i.lunchbox.id, i.qty) * i.qty
        total = round(float(total), 2)
        company_discount = round(float(company_discount), 2)
        total_with_discount = round(float(total - company_discount), 2)
        return render(request, self.template_name, locals())

    @staticmethod
    def get_amount_with_discount(user_id, lunchbox_id, qty):
        lunchbox = userprofiles.models.Lunchbox.objects.get(id=lunchbox_id)
        try:
            user = User.objects.get(id=user_id)

            if user.profile.company:
                # current_time = datetime.now()
                # if current_time.hour > 12:
                #     date_from = current_time.replace(hour=12, minute=00, second=00, microsecond=00)
                # else:
                #     date_from = current_time - timedelta(days=1)
                #     date_from = date_from.replace(hour=12, minute=00, second=00, microsecond=00)

                current_time = timezone.now()
                delivery_date = current_time.replace(hour=13, minute=00,
                                                     second=0,
                                                     microsecond=0)

                company_orders = OrderItem.objects.filter(
                        Q(lunchbox=lunchbox),
                        Q(order__u_is_paid=True),
                        Q(order__user__profile__company__id=user.profile.company.id),
                        Q(delivery_date=delivery_date)
                )

                orders_qty = qty
                for c in company_orders:
                    orders_qty += c.qty

                if orders_qty:
                    discount = userprofiles.models.LunchboxDiscount.objects.filter(
                        Q(lunchbox=lunchbox) &
                        Q(qty__lte=orders_qty)
                    ).last()

                    if discount:
                        return lunchbox.price * discount.percent / 100
                    else:
                        return 0
                else:
                    return 0
            else:
                return False
        except User.DoesNotExist:
            discount = userprofiles.models.LunchboxDiscount.objects.filter(lunchbox=lunchbox).first()
            if discount:
                return lunchbox.price * discount.percent / 100
            else:
                return False

    @staticmethod
    def get_discount_price(user_id, lunchbox_id, qty):
        lunchbox = userprofiles.models.Lunchbox.objects.get(id=lunchbox_id)
        try:
            user = User.objects.get(id=user_id)

            if user.profile.company:
                # current_time = datetime.now()
                # if current_time.hour > 12:
                #     date_from = current_time.replace(hour=12, minute=00, second=00, microsecond=00)
                # else:
                #     date_from = current_time - timedelta(days=1)
                #     date_from = date_from.replace(hour=12, minute=00, second=00, microsecond=00)
                #
                # company_orders = Order.objects.filter(
                #         Q(u_is_paid=True),
                #         Q(user__profile__company__id=user.profile.company.id),
                #         Q(date__gte=date_from),
                #         Q(date__lte=current_time)
                # )

                current_time = timezone.now()
                delivery_date = current_time.replace(hour=13, minute=00,
                                                     second=0,
                                                     microsecond=0)
                company_orders = OrderItem.objects.filter(
                        Q(lunchbox=lunchbox),
                        Q(order__u_is_paid=True),
                        Q(order__user__profile__company__id=user.profile.company.id),
                        Q(delivery_date=delivery_date)
                )

                orders_qty = qty
                for c in company_orders:
                    orders_qty += c.qty

                if orders_qty:
                    discount = userprofiles.models.LunchboxDiscount.objects.filter(
                        Q(lunchbox=lunchbox) &
                        Q(qty__lte=orders_qty)
                    ).last()

                    if discount:
                        return lunchbox.price - (lunchbox.price * discount.percent / 100)
                    else:
                        return lunchbox.price
                else:
                    return 0
            else:
                return False
        except User.DoesNotExist:
            discount = userprofiles.models.LunchboxDiscount.objects.filter(lunchbox=lunchbox).first()
            if discount:
                return lunchbox.price * discount.percent / 100
            else:
                return False


class CateringCart(TemplateView):
    def get(self, request, *args, **kwargs):
        if not request.user.is_authenticated():
            return HttpResponseRedirect('/')
        if not request.user.profile.is_filled():
            return HttpResponseRedirect('/edit_user_profile/')
        return render(request, self.template_name,
                      CateringCart.get_catering_context(request))

    @staticmethod
    def get_catering_context(request):
        user = User.objects.get(id=request.user.id)
        items = Basket.objects.filter(user=user, is_catering=True)
        catering_form = userprofiles.forms.ProfileCateringEmptyForm(initial={
            'c_first_name': user.profile.c_first_name,
            'c_last_name': user.profile.c_last_name,
            'c_address': user.profile.c_address,
            'c_zipcode': user.profile.c_zip_code,
            'c_phone': user.profile.phone
        })

        total = 0.0
        total_with_discount = 0.0
        company_discount = 0.0
        for i in items:
            total += i.lunchbox.price * i.qty
            i.lunchbox.discount_price = Cart.get_discount_price(user.id,
                                                                i.lunchbox.id,
                                                                i.qty)
            company_discount += Cart.get_amount_with_discount(user.id,
                                                              i.lunchbox.id,
                                                              i.qty) * i.qty
        company_discount = round(float(company_discount), 2)
        total = round(float(total), 2)
        total_with_discount = round(float(total - company_discount), 2)
        sermepa_form = SermepaPaymentForm()
        return {"user": user, "items": items, "catering_form": catering_form,
                "total": total, "company_discount": company_discount,
                "total_with_discount": total_with_discount,
                "sermepa_form": sermepa_form}


class GetPromoCodeDiscount(RedirectView):

    """View for get_promo_code_discount uri"""

    def post(self, request, *args, **kwargs):
        """If the provided code is valid, returns the discount"""
        data = {}
        code = request.POST.get('code')
        user = User.objects.get(id=request.user.id)
        code_exists = CheckoutPromoCode.objects.filter(promo_code=code)
        if code_exists and code_exists[0].is_valid(user):
            data['status'] = 'success'
            data['discount'] = code_exists[0].percent
        else:
            data['status'] = "error"
            data['msg'] = "The code that you entered is either invalid " \
                          "or expired."
        return HttpResponse(json.dumps(data), content_type="application/json")


class EnjoyYourLunchbox(TemplateView):
    template_name = "enjoy_your_box.html"
    
    def get(self, request, *args, **kwargs):
        paymentid=request.GET.get("paymentId")
        token = request.GET.get("token")
        payer_id = request.GET.get("PayerID")
        payment = Payment.find(paymentid)
        if payment.execute({"payer_id": payer_id}):  # return True or False
            print "\nn\n\nn\nValue is true\n\n\n\nn\n"
            try:
                paypal_payment = PaypalPaymentDetails.objects.get(paypal_paymentid=paymentid)
                paypal_payment.paypal_token = token
                paypal_payment.payer_id = payer_id
                paypal_payment.status = True
                paypal_payment.save()
                try:
                    order = Order.objects.get(uuid=paypal_payment.payuiid)
                    payment = order.payment

                    for item in order.orderitem_set.all():
                        OrderNotification.objects.create(order_item=item)

                    # Clear basket
                    newcart.objects.filter(user=order.user).delete()
                    try:
                        del request.session['cart']
                    except Exception as e:
                        pass
                    
                    order.u_is_paid = True
                    payment.status = payment_choices.SUCCESS
                    order.save()
                    payment.save()
                    # PAYMENT SUCCESS TEMPLATE
                    if payment.coupon:
                        payment.coupon.used_by.add(payment.order.user)
                    try:
                        wallet_order = WalletOrder.objects.get(order=order)
                        wallet_order.status = True
                        wallet_order.save()
                        Wallet.objects.filter(user=wallet_order.user).update(amount='0', lafiambera_credit='0')
                    except WalletOrder.DoesNotExist:
                        pass
                except Order.DoesNotExist:
                    moneytowallet = MoneyToWallet.objects.get(uuid=paypal_payment.payuiid)
                    payment = moneytowallet.walletpayment
                    moneytowallet.status=True
                    payment.status = payment_choices.SUCCESS
                    moneytowallet.save()
                    payment.save()
                    try:
                        wallet_amount = Wallet.objects.get(user=moneytowallet.user)
                        wallet_amount.amount += moneytowallet.amount
                        wallet_amount.lafiambera_credit += moneytowallet.lafiambera_credit
                        wallet_amount.save()
                    except Wallet.DoesNotExist:
                        Wallet.objects.create(user=moneytowallet.user,
                            amount = moneytowallet.amount,
                            lafiambera_credit = moneytowallet.lafiambera_credit)

                    return HttpResponseRedirect('/')
   
                print("Payment[%s] execute successfully" % (payment.id))
                return render(request, self.template_name)
            except PaypalPaymentDetails.DoesNotExist:
                return render(request, self.template_name)
        else:
            try:
                paypal_payment = PaypalPaymentDetails.objects.get(paypal_paymentid=paymentid, status=False)
                try:
                    paypal_payment = PaypalPaymentDetails.objects.get(paypal_paymentid=paymentid)
                    order = Order.objects.get(uuid=paypal_payment.payuiid)
                    payment1 = order.payment
                    payment1.status = payment_choices.ERROR
                    payment1.error_details = "Payment error with status: {0}" % (payment.error)
                    payment1.save()
                except Order.DoesNotExist:
                    moneytowallet = MoneyToWallet.objects.get(uiid=paypal_payment.payuiid)
                    payment1 = moneytowallet.walletpayment
                    payment1.status = payment_choices.ERROR
                    payment1.error_details = "Payment error with status: {0}" % (payment.error)
                    payment1.save()
                return render(request, self.template_name)
            except PaypalPaymentDetails.DoesNotExist:
                return render(request, self.template_name)
            




class RateService(RedirectView):
    def post(self, request, *args, **kwargs):
        if not request.user.is_authenticated():
            return HttpResponse(json.dumps({
                    'status': 'error',
                    'error_msg': _("The user is not authenticated.")
                }), content_type="application/json")
        else:
            rating = int(request.POST.get('rating'))
            paymentid = request.POST.get('paymentid')
            paypal_res = PaypalPaymentDetails.objects.get(paypal_paymentid=paymentid)
            try:
                
                order = Order.objects.get(uuid=paypal_res.payuiid)
            except Order.DoesNotExist:
                return HttpResponse(json.dumps({
                    'status': 'error',
                    'error_msg': _("The order doesn't exist.")
                }), content_type="application/json")

            ratings = ServiceRating.objects.filter(order__uuid=paypal_res.payuiid)
            if ratings:
                return HttpResponse(json.dumps({
                    'status': 'error',
                    'error_msg': _('The order has already been rated.')
                }), content_type="application/json")
            else:
                ServiceRating.objects.create(order=order, rating=rating)
                return HttpResponse(json.dumps({
                    'status': 'success'}), content_type="application/json")


class OrderPayment(TemplateView):

    def post(self, request, *args, **kwargs):
        payment_method = request.POST.get('payment_method')
        self.template_name = "{}.html".format(payment_method)
        data = json.loads(request.POST.get('orders'))
        is_catering = int(request.POST.get('is_catering', 0))
        user = User.objects.get(id=request.user.id)
        delivery_info = request.POST.get('delivery_info')
        #print 'data',data

        if delivery_info:
            profiles_catering_form = userprofiles.forms \
                .ProfileCateringEmptyForm(json.loads(delivery_info))

            if profiles_catering_form.is_valid():
                profile = user.profile
                profile.c_first_name = profiles_catering_form \
                    .cleaned_data.get('c_first_name')
                profile.c_last_name = profiles_catering_form \
                    .cleaned_data.get('c_last_name')
                profile.c_address = profiles_catering_form \
                    .cleaned_data.get('c_address')
                profile.c_zip_code = profiles_catering_form \
                    .cleaned_data.get('c_zipcode')
                profile.phone = profiles_catering_form \
                    .cleaned_data.get('c_phone')
                profile.save()
            else:
                context = CateringCart.get_catering_context(request)
                context["catering_form"] = profiles_catering_form
                return render(request, "catering_cart.html", context)

        if len(data.get('orders', 0)) > 0:
            # Creating order

            order = Order.objects.create(user=user)

            if is_catering:
                order.is_catering = True
            order.save()

            # Add items to our order
            for o in data['orders']:
                lunchbox = userprofiles.models.Lunchbox.objects.get(
                    id=int(o['lb']))
                qty = int(o['qty'])
                o['date']=str(o['date'])
                # o['date']=o['date'].replace(',','')
                # o['date']=str(o['date'].tm_year)+'-'+str(o['date'].tm_mon)+'-'+str(o['date'].tm_mday)
                if not is_catering:

                    delivery_date = datetime.datetime.strptime(o['date'], "%b %d %Y")
                    delivery_date = delivery_date.replace(hour=13)
                else:
                    delivery_date = time.strptime(o['date'],
                                                      "%b %d %Y %H:%M")
                aware_delivery_date = pytz.utc.localize(delivery_date)
                delivery_date = aware_delivery_date.astimezone(
                    pytz.timezone('CET'))

                OrderItem.objects.create(
                    order=order, lunchbox=lunchbox, qty=qty,
                    delivery_date=delivery_date)

            total = 0
            for i in order.orderitem_set.all():
                total += Cart.get_discount_price(
                    user_id=user.id, lunchbox_id=i.lunchbox.id,
                    qty=i.qty) * i.qty

            code_exists = False

            # Check if the code exists and is valid. Then apply the discount
            if data.get('promo_code'):
                code = data['promo_code']
                code_exists = CheckoutPromoCode.objects.filter(promo_code=code)
                if code_exists and code_exists[0].is_valid(user):
                    discount_percentage = code_exists[0].percent
                    total = total - (total * (discount_percentage / 100))

            # If the total is 0. Simulate the payment, otherwise select the
            # payment_choice and set the payment status to pending
            if total:
                payment_choice = payment_choices.PAYPAL if \
                    payment_method == "paypal" else payment_choices.REDSYS
                payment_status = payment_choices.PENDING
                Payment.objects.create(order=order,
                                       status=payment_status,
                                       payment_type=payment_choice,
                                       amount=total,
                                       coupon=code_exists[0] if code_exists
                                       else None)
                if payment_choice == payment_choices.PAYPAL:
                    # What you want the button to do.
                    paypal_dict = {
                        "business": settings.PAYPAL_EMAIL,
                        "item_name": "La Fiambrera - Order #" + str(order.id),
                        "currency_code": "EUR",
                        "amount": total,
                        "invoice": order.id,
                        "notify_url": settings.PAYPAL_NOTIFY_URL,
                        "return_url": settings.PAYMENT_RETURN_URL.format(
                            order.uuid),
                        "cancel_return": settings.PAYMENT_CANCEL_RETURN,
                    }
                    # Create the instance.
                    form = PayPalPaymentsForm(initial=paypal_dict)
                    context = {"form": form}
                    return render(request, self.template_name, context)
                else:
                    form = SermepaPaymentForm(amount=int(round(
                        total, 2) * 100), order_uuid=order.uuid)
                    return render(request, self.template_name,
                                  {'form': form, 'debug': settings.DEBUG})
            else:
                # The total amount is 0, so the payment is not really done just
                # simulated

                payment_choice = payment_choices.ZERO_VALUE
                payment_status = payment_choices.SUCCESS
                Payment.objects.create(order=order,
                                       status=payment_status,
                                       payment_type=payment_choice,
                                       amount=total,
                                       coupon=code_exists[0] if code_exists
                                       else None)
                if code_exists:
                    # The coupon is used
                    code_exists[0].used_by.add(user)
                return HttpResponseRedirect(
                    settings.PAYMENT_RETURN_URL.format(order.uuid))

        else:
            return HttpResponseRedirect('/cart/')


@login_required()
def restaurant_is_open(request):
    lunchbox_id = request.POST.get('lunchbox_id')
    delivery_date = request.POST.get('delivery_date')
    #print "lunch",lunchbox_id
    #print 'date',delivery_date

    if lunchbox_id:
        lunchbox = userprofiles.models.Lunchbox.objects.get(id=lunchbox_id)
        delivery_date = datetime.datetime.strptime(delivery_date, "%b %d %Y")
        if not lunchbox.restaurant.is_open(delivery_date):
            return HttpResponse(json.dumps({
                'status': 'error'}), content_type="application/json")
    else:
        items = Basket.objects.filter(
            user=request.user,
            is_catering=True,
            lunchbox__available_till__gte=datetime.now())
        delivery_date = datetime.strptime(delivery_date, "%b %d %Y %H:%M")
        closed_restaurants = []
        for item in items:
            if not item.lunchbox.restaurant.is_open(delivery_date):
                closed_restaurants.append(item.lunchbox.restaurant.name)
        if closed_restaurants:
            return HttpResponse(json.dumps({
                'status': 'error', 'closed_restaurants': closed_restaurants}),
                content_type="application/json")

    return HttpResponse(json.dumps({
        'status': 'success'}), content_type="application/json")


def ipn_handler(sender, **kwargs):
    ipn_obj = sender
    order = Order.objects.get(id=ipn_obj.invoice)
    payment = order.payment

    if ipn_obj.payment_status == ST_PP_COMPLETED:
        # Send notification to restaurant for each lunchbox ordered
        for item in order.orderitem_set.all():
            OrderNotification.objects.create(order_item=item)

        # Clear basket
        Basket.objects.filter(
            user=order.user, is_catering=order.is_catering).delete()
        order.u_is_paid = True
        payment.status = payment_choices.SUCCESS
        order.save()
        payment.save()
        # PAYMENT SUCCESS TEMPLATE
        if payment.coupon:
            payment.coupon.used_by.add(payment.order.user)
        return HttpResponseRedirect('/')

    else:
        payment.status = payment_choices.ERROR
        payment.error_details = "Payment error with status: {0}" % (
            ipn_obj.payment_status)
        payment.save()
        # PAYMENT ERROR TEMPLATE
        return HttpResponseRedirect('/')


valid_ipn_received.connect(ipn_handler)