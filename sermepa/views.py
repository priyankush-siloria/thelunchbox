# -*- coding: utf-8 -*-
from django.http import HttpResponse
import dateutil.parser
from django.views.decorators.csrf import csrf_exempt

from orders.models import Order, Basket
from carthandler.models import Cart
from userprofiles.models import OrderNotification
from payments import choices as payment_choices
from sermepa.forms import SermepaResponseForm
from sermepa.models import OPER_REFUND, SermepaResponse
from sermepa.utils import decode_parameters, redsys_check_response
from payments.models import MoneyToWallet
from mainapp.models import UserNotification

def payment_success(sender):
    """The payment is successful.
    Arguments:
    sender -- SermepaResponse object. The field Ds_MerchantData
              is the id associated to the order

    """
    try:
        order = Order.objects.get(uuid=sender.Ds_MerchantData)
        # Send notification to restaurant for each lunchbox ordered
        for item in order.orderitem_set.all():
            OrderNotification.objects.create(order_item=item)

        # Clear basket
        Cart.objects.filter(
            user=order.user).delete()

        order.u_is_paid = True
        payment = order.payment
        payment.sermepa_response = sender
        payment.status = payment_choices.SUCCESS
        # If the payment is success the coupon is set to used
        if payment.coupon:
            payment.coupon.used_by.add(payment.order.user)
        order.save()
        payment.save()
        UserNotification.objects.create(user=request.user,
            head_en="Order",
            head_es="Orden",
            msg_en="Thank you! Your order is placed succesfully.",
            msg_es='Gracias! Su pedido se ha realizado correctamente.'
            )
    except Order.DoesNotExist:
        moneytowallet = MoneyToWallet.objects.get(uuid=sender.Ds_MerchantData)
        payment = moneytowallet.walletpayment
        payment.sermepa_response = sender
        payment.status = payment_choices.SUCCESS
        moneytowallet.save()
        payment.save()
        UserNotification.objects.create(user=request.user,
            head_en="Wallet",
            head_es="Billetera",
            msg_en="You have successfully added {} La-Fiambrera credits in your account.".format(payment.amount),
            msg_es='Has agregado {} créditos de La-Fiambrera correctamente en tu cuenta.'.format(payment.amount)
            )


def payment_error(sender):
    """The payment is not successful
    sender -- SermepaResponse object. The field Ds_MerchantData
              is the id associated to the order

    """

    try:
        order = Order.objects.get(uuid=sender.MerchantData)
        payment = order.payment
        payment.sermepa_response = sender
        payment.status = payment_choices.ERROR
        order.save()
        payment.save()
    except Order.DoesNotExist:
        moneytowallet = MoneyToWallet.objects.get(uuid=sender.Ds_MerchantData)
        payment = moneytowallet.walletpayment
        payment.sermepa_response = sender
        payment.status = payment_choices.ERROR
        order.save()
        payment.save()

@csrf_exempt
def sermepa_ipn(request):
    form = SermepaResponseForm(request.POST)
    if form.is_valid():

        # Get parameters from decoded Ds_MerchantParameters object
        merchant_parameters = decode_parameters(form.cleaned_data['Ds_MerchantParameters'])
        sermepa_resp = SermepaResponse()

        if 'Ds_Date' in merchant_parameters:
            sermepa_resp.Ds_Date = dateutil.parser.parse((merchant_parameters['Ds_Date']).replace('%2F','/'), dayfirst=True)
        if 'Ds_Hour' in merchant_parameters:
            sermepa_resp.Ds_Hour = dateutil.parser.parse((merchant_parameters['Ds_Hour']).replace('%3A',':'))
        if 'Ds_Amount' in merchant_parameters:
            sermepa_resp.Ds_Amount = merchant_parameters['Ds_Amount']
        if 'Ds_Currency' in merchant_parameters:
            sermepa_resp.Ds_Currency = merchant_parameters['Ds_Currency']
        if 'Ds_Order' in merchant_parameters:
            sermepa_resp.Ds_Order = merchant_parameters['Ds_Order']
        if 'Ds_MerchantCode' in merchant_parameters:
            sermepa_resp.Ds_MerchantCode = merchant_parameters['Ds_MerchantCode']
        if 'Ds_Terminal' in merchant_parameters:
            sermepa_resp.Ds_Terminal = merchant_parameters['Ds_Terminal']
        if 'Ds_Response' in merchant_parameters:
            sermepa_resp.Ds_Response = merchant_parameters['Ds_Response']
        if 'Ds_TransactionType' in merchant_parameters:
            sermepa_resp.Ds_TransactionType = merchant_parameters['Ds_TransactionType']
        if 'Ds_SecurePayment' in merchant_parameters:
            sermepa_resp.Ds_SecurePayment = merchant_parameters['Ds_SecurePayment']
        if 'Ds_MerchantData' in merchant_parameters:
            sermepa_resp.Ds_MerchantData = merchant_parameters['Ds_MerchantData']
        if 'Ds_Card_Country' in merchant_parameters:
            sermepa_resp.Ds_Card_Country = merchant_parameters['Ds_Card_Country']
        if 'Ds_AuthorisationCode' in merchant_parameters:
            sermepa_resp.Ds_AuthorisationCode = merchant_parameters['Ds_AuthorisationCode']
        if 'Ds_ConsumerLanguage' in merchant_parameters:
            sermepa_resp.Ds_ConsumerLanguage = merchant_parameters['Ds_ConsumerLanguage']
        if 'Ds_Merchant_Identifier' in merchant_parameters:
            sermepa_resp.Ds_Merchant_Identifier = merchant_parameters['Ds_Merchant_Identifier']
        if 'Ds_ExpiryDate' in merchant_parameters:
            sermepa_resp.Ds_ExpiryDate = merchant_parameters['Ds_ExpiryDate']
        sermepa_resp.save()
        if int(sermepa_resp.Ds_Response) < 100:
            payment_success(sermepa_resp) #signal
        else:
            payment_error(sermepa_resp) #signal
    return HttpResponse()
