# -*- coding: utf-8 -*-

from __future__ import unicode_literals
from django.contrib import messages
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.shortcuts import render, HttpResponseRedirect,redirect
from django.contrib.auth import login, authenticate, logout
from django.utils import translation
from django.views.generic import *
from userprofiles.forms import *
from userprofiles.models import *
from orders.models import *
from django.utils.decorators import method_decorator
from userprofiles.decorator import check_user
from carthandler.models import *
from mainapp.models import Category,HomeContent,InviteRequest,UserNotification,ShareSelection,SelectionReference
from payments.models import WalletPayment,MoneyToWallet,Lafiambrera_Currency,Wallet
from payments.models import Payment as pay
from django.http import HttpResponse
from itertools import chain
from django.core.mail import EmailMessage
from .serializers import *
from django.utils import timezone
from django.utils.translation import ugettext as _
from sermepa.forms import SermepaPaymentForm
from sermepa.models import SermepaIdTPV
from payments.models import Payment,PaypalPaymentDetails,WalletOrder
from carthandler.models import Cart as newcart
from paypal.standard.forms import PayPalPaymentsForm
from paypal.standard.models import ST_PP_COMPLETED
from paypal.standard.ipn.signals import valid_ipn_received
from payments import choices as payment_choices
from paypalrestsdk import Payment
from django.template.loader import get_template
import paypalrestsdk
import logging
import json
import pytz
from datetime import datetime, timedelta
import hashlib
#Gmail Smtp mail detail
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from django.template.loader import render_to_string
from login_register.models import ForgetPassword
import random
utc=pytz.UTC



paypalrestsdk.configure({
	"mode": "sandbox",
	"client_id": "AZu86E47CTR5ShHZ2ekiQ3Ut_huo02TiMoFXDs1eq7GCe4kx8qbkGn61Nh62JZLXUqHsRU9DhxdjndZv",
	"client_secret": "EMm0Z-zy87PuqRfN_RBIuOfk2rGrWfWsvqRIspR4bSeoCAAZDbvq1a7WtbXSE2eA3TwhmjZ_IORlzQin"
	})

logging.basicConfig(level=logging.INFO)



def handler404(request):
    return render(request, 'mainapp/404.html', status=404)




class HomePage(TemplateView):
	form_class = AuthForm
	template_name = "mainapp/home_page.html"

	# def get_context_data(self, *args, **kwargs):
	# 	context = super(HomePage, self).get_context_data()
	# 	categories = Category.objects.all()
	# 	context['categories'] = categories
	# 	return context
	def get(self, request, *args, **kwargs):
		if request.user.is_authenticated():
			if request.user.profile.is_restaurant() or request.user.profile.is_employee() or request.user.is_staff:
				messages.error(request,'invalidforsite')
				return HttpResponseRedirect('/{}/dashboard/'.format(request.LANGUAGE_CODE))

		categories = Category.objects.all()	
		last_ten = Lunchbox.objects.all().order_by('-id')[:6]	
		homecontents = HomeContent.objects.all()
		lang_page_url=""
		return render(request, self.template_name,{"categories":categories,"last_ten":last_ten,"lang_page_url":lang_page_url})



class AddMoney(View):
	def get(self, request, *args, **kwargs):
		euro=request.GET.get('euro')
		euro=float(euro)
		all_value=Lafiambrera_Currency.objects.all()
		value=all_value[0].OneEuro
		value=float(value)
		total_points=euro*value
		
		return HttpResponse(total_points)
		


@method_decorator(check_user, name='dispatch')
class CategoryLunchbox(TemplateView):
	template_name = "mainapp/lunch-box-list.html"

	def get_context_data(self,*args,**kwargs):
		context=super(CategoryLunchbox,self).get_context_data()
		catggory=Category.objects.get(slug=kwargs['slug'])
		lunchboxes=catggory.lunchbox_set.all()
		context['lunchboxes'] = lunchboxes
		lang_page_url='lunchbox/'+kwargs['slug']
		context['lang_page_url']=lang_page_url
		context['catggory']=catggory
		return context

@method_decorator(check_user, name='dispatch')
class IndividualLunchbox(TemplateView):
	template_name = "mainapp/individul_lunchbox.html"


	def get_context_data(self,*args,**kwargs):
		
		context=super(IndividualLunchbox,self).get_context_data()
		catggory=Category.objects.get(slug=kwargs['slug'])
		lunchbox1=catggory.lunchbox_set.filter(id=kwargs['pk'])
		lunchbox2=catggory.lunchbox_set.exclude(id=kwargs['pk']).order_by('id')

		lunchbox_detail1=list(chain(lunchbox1, lunchbox2))
		page = self.request.GET.get('page', 1)
		lunchbox_detail = Paginator(lunchbox_detail1, 1)
		try:
			lunchbox_detail = lunchbox_detail.page(page)
		except PageNotAnInteger:
			lunchbox_detail = lunchbox_detail.page(1)
		except EmptyPage:
			lunchbox_detail = lunchbox_detail.page(lunchbox_detail.num_pages)
		context['lunchbox_detail'] = lunchbox_detail
		return context


@method_decorator(check_user, name='dispatch')
class SingleBox(TemplateView):
	template_name = "mainapp/single_box.html"


	def get_context_data(self,*args,**kwargs):
		
		context=super(SingleBox,self).get_context_data()

		lunchbox1=Lunchbox.objects.filter(id=kwargs['pk'])
		context['lunchbox_detail'] = lunchbox1
		return context



class RestaurantProfileLunchboxes(TemplateView):
	template_name = "mainapp/present_boxes.html"
	archive_template_name = "mainapp/archived_boxes.html"

	def get(self, request, *args, **kwargs):
		if request.user.is_authenticated():
			if request.user.profile.is_restaurant() or request.user.profile.is_employee() or request.user.is_staff:
				messages.error(request,'invalidforsite')
				return HttpResponseRedirect('/{}/dashboard/'.format(request.LANGUAGE_CODE))
		res=Restaurant.objects.get(id=kwargs.get('restaurant_id'))
		if  int(kwargs.get('type')) == 1:
			lunchbox=res.lunchbox_set.filter(available_till__gt=datetime.now())
			page = self.request.GET.get('page', 1)
			lunchbox_detail = Paginator(lunchbox, 1)
			try:
				lunchbox_detail = lunchbox_detail.page(page)
			except PageNotAnInteger:
				lunchbox_detail = lunchbox_detail.page(1)
			except EmptyPage:
				lunchbox_detail = lunchbox_detail.page(lunchbox_detail.num_pages)
			return render(request, self.template_name,locals())	
		else:
			lunchbox=res.lunchbox_set.filter(available_till__lt=datetime.now())
			page = self.request.GET.get('page', 1)
			lunchbox_detail = Paginator(lunchbox, 1)
			try:
				lunchbox_detail = lunchbox_detail.page(page)
			except PageNotAnInteger:
				lunchbox_detail = lunchbox_detail.page(1)
			except EmptyPage:
				lunchbox_detail = lunchbox_detail.page(lunchbox_detail.num_pages)
			return render(request, self.archive_template_name,locals())
		

		
		

@method_decorator(check_user, name='dispatch')
class RestaurantLunchbox(TemplateView):
	template_name = "mainapp/individul_lunchbox_restaurant.html"

	def get_context_data(self,*args,**kwargs):
		
		context=super(RestaurantLunchbox,self).get_context_data()
		restaurant=""
		try:
			restaurant=Restaurant.objects.get(id=kwargs['restaurant_id'])
		except Restaurant.DoesNotExist:
			restaurant=""
		
		lunchbox_detail1 = Lunchbox.objects.filter(restaurant=restaurant)

		page = self.request.GET.get('page', 1)
		lunchbox_detail = Paginator(lunchbox_detail1, 1)
		try:
			lunchbox_detail = lunchbox_detail.page(page)
		except PageNotAnInteger:
			lunchbox_detail = lunchbox_detail.page(1)
		except EmptyPage:
			lunchbox_detail = lunchbox_detail.page(lunchbox_detail.num_pages)
		context['lunchbox_detail'] = lunchbox_detail
		context['restaurant'] = restaurant
		return context


class AllLunchbox(TemplateView):
	template_name = "mainapp/all_lunchbox.html"

	def get(self,request):
		if request.user.is_authenticated():
			if request.user.profile.is_restaurant() or request.user.profile.is_employee() or request.user.is_staff:
				messages.error(request,'invalidforsite')
				return HttpResponseRedirect('/{}/dashboard/'.format(request.LANGUAGE_CODE))
		lunchboxes1 = Lunchbox.objects.all()	
		page = self.request.GET.get('page', 1)
		lunchboxes = Paginator(lunchboxes1, 9)
		try:
			lunchboxes = lunchboxes.page(page)
		except PageNotAnInteger:
			lunchboxes = lunchboxes.page(1)
		except EmptyPage:
			lunchboxes = lunchboxes.page(lunchboxes.num_pages)
		lang_page_url="all"
		return render(request, self.template_name,{"lunchboxes":lunchboxes,"lang_page_url":lang_page_url})




class Checkout(TemplateView):
	template_name = "mainapp/checkout.html"

	def get(self,request):
		if request.user.is_authenticated():
			if request.user.profile.is_restaurant() or request.user.profile.is_employee() or request.user.is_staff:
				messages.error(request,'invalidforsite')
				return HttpResponseRedirect('/{}/dashboard/'.format(request.LANGUAGE_CODE))
			else:
				try:
					customer = Customer.objects.get(user__id=request.user.id)
					if not request.user.email or not customer.address or not customer.street or not customer.city \
						or not customer.zip_code or not request.user.profile.phone:
						messages.error(request, _('Please complete your profile first before checkout.'))
					else:
						pass
				except Customer.DoesNotExist:
					messages.error(request, _('Please complete your profile first before checkout.'))
		my_param=request.GET.get('token')
		if request.GET.get('token'):
			messages.error(request,'cancelorder')
		try:
			sub_total=0.0
			if request.user.is_authenticated():
				user=User.objects.get(id=request.user.id)
				customer=Customer.objects.get(user=user)
				wallet = Wallet.objects.filter(user=request.user.id)
				cart_values = Cart.objects.filter(user__username=request.user.id)
			else:
				user1 = User.objects.get(username=request.user.id)
				
				cart_values = Cart.objects.filter(user=user1)
				for val in cart_values:
					sub_total=sub_total+val.finalamount()
			return render(request, self.template_name,locals())
		except Exception as r:
			return render(request, self.template_name,locals())

class Logout(View):
	def get(self,request):
		if 'user_type' in request.session:
			del request.session['user_type']
		
		if 'user_name' in request.session:
			del request.session['user_name']

		if 'cart' in request.session:
			del request.session['cart']
		if 'user_id' in request.session:
			del request.session['user_id']
		logout(request)
		return redirect("/")


class CheckLoginView(TemplateView):
	template_name="mainapp/checkout.html"

	def get(self, request, *args, **kwargs):
		return render(request, self.template_name)

	def post(self, request, *args, **kwargs):
		response={}
		ema=self.request.POST.get('email')
		password=self.request.POST.get('password')
		user_name=None

		find_user = User.objects.filter(email=ema)
		for users in find_user:
			try:
				profile = Profile.objects.get(user__id=users.id,accounts_status=1)
				user_name=profile.user.username
			except Profile.DoesNotExist:
				pass
		if not user_name:
			messages.error(request, _('Invalid Email or Password'))
			return HttpResponseRedirect('/checkout/')
		user = authenticate(username=user_name, password=password)
		if user:
			lng = user.profile.lang
			translation.activate(lng)
			request.session[translation.LANGUAGE_SESSION_KEY] = lng
			login(request, user)
			request.session['user_id']=user.id
			request.session['user_name']=user.username
			user_id = request.session['user_id']
			user_name=request.session['user_name']
			group_name=user.groups.all()
			request.session['user_type']=group_name[0].name
			if request.session['user_type'] == 'Restaurant':
				try:
					res = Restaurant.objects.get(user__id=request.user.id)
				except Restaurant.DoesNotExist:
					messages.error(request, _('Sorry! Some error occur. Contact with admin to solve this. Thankyou.'))
					return HttpResponseRedirect('/checkout/')
				
				request.session['restaurant_id']=res.id
			if 'cart' not in request.session:
				user_exist_in_cart=Cart.objects.filter(user__id=user.id)
				if user_exist_in_cart:
					request.session['cart']=user.username
			cus_id=Customer.objects.filter(user_id=user.id)
			rest_id=Restaurant.objects.filter(user_id=user.id)
			if cus_id:
				return HttpResponseRedirect('/checkout/')

			elif rest_id:
				return HttpResponseRedirect('/checkout/')
			else:
				messages.error(request, _('Invalid Email or Password'))
				return HttpResponseRedirect('/checkout/')
			return HttpResponseRedirect('/checkout/')

		else:
			messages.error(request, _('Invalid Email or Password'))
			return HttpResponseRedirect('/checkout/')


class CheckoutCal(View):

	def get(self, request, *args, **kwargs):
		lunchbox_id=self.request.GET.get('lunchbox_id')
		lunchbox_price=self.request.GET.get('lunchbox_price')
		lunchbox_action=self.request.GET.get('lunchbox_action')
		user=User.objects.get(username=request.session['cart'])
		cart = Cart.objects.get(user=user, lunchbox_id=lunchbox_id) 
		if lunchbox_action == 'add':
			cart.total_price = cart.total_price + float(lunchbox_price)
			cart.qty = cart.qty + 1
			cart.save()
		else:
			cart.total_price = cart.total_price - float(lunchbox_price)
			cart.qty = cart.qty - 1
			cart.save()
		cart_values = Cart.objects.filter(user=user)
		sub_total=0.0
		sub_total_amount=0.0
		for val in cart_values:
			sub_total=sub_total+val.finalamount()
			sub_total_amount=round(sub_total_amount+val.total_price, 2)
		response_data={}
		response_data['qty'] = cart.qty
		response_data['price'] = cart.total_price
		response_data['sub_total'] = sub_total
		response_data['qty_discount'] = cart.qtydiscount()
		lb = Lunchbox.objects.get(id=int(cart.lunchbox_id))
		vat_amount = round((lb.price * lb.vat)/100, 2)
		t_vat_amount = round(cart.qty*vat_amount, 2)
		response_data['vat'] = t_vat_amount
		response_data['sub_total_amount'] = sub_total_amount
		final_amount=round(sub_total+t_vat_amount, 2)
		response_data['final_amount'] = final_amount
		return HttpResponse(json.dumps(response_data), content_type='application/json')




class CheckPromoCodeDiscount(TemplateView):
	template_name="mainapp/checkout.html"
	def get(self, request, *args, **kwargs):
		return render(request, self.template_name)

	def post(self, request, *args, **kwargs):
		"""If the provided code is valid, returns the discount"""
		data = {}
		code = request.POST.get('code')
		if not request.user.is_authenticated():
			data['status'] = "error"
			data['msg'] = _("Not valid user. Please Login First.")
		else:	
			user = User.objects.get(id=request.user.id)
			code_exists = CheckoutPromoCode.objects.filter(promo_code=code)
			if code_exists and code_exists[0].is_valid(user):
				total=0.0
				t_vat=0.0
				data['status'] = 'success'
				discount_percentage = code_exists[0].percent
				cart_values = Cart.objects.filter(user=user)
				for val in cart_values:
					total=total+val.finalamount()
					lb = Lunchbox.objects.get(id=val.lunchbox_id)
					lb_vat = round((lb.price*lb.vat)/100, 2)
					qty_vat = round(val.qty*lb_vat, 2)
					t_vat = round(t_vat+qty_vat, 2)
				data['discount'] = round(total * (discount_percentage / 100), 2)
				total_without_vat = round(total - (total * (discount_percentage / 100)), 2)
				total_with_vat =  round(total_without_vat + t_vat, 2)
				data['total'] = total_with_vat
				data['vat'] = t_vat
			else:
				data['status'] = "error"
				data['msg'] = _("The code that you entered is either invalid " \
							"or expired.")
		return HttpResponse(json.dumps(data), content_type="application/json")



class CheckoutData(TemplateView):
	template_name="mainapp/checkout.html"

	def post(self, request, *args, **kwargs):
		msg = ""
		status = ""
		user = User.objects.get(id=request.user.id)
		if request.user.is_authenticated() and not request.user.profile.is_restaurant() and not request.user.profile.is_employee() and not request.user.is_staff:
			try:
				customer = Customer.objects.get(user=user)
				if not user.email or not customer.address or not customer.building_num or not customer.city \
					or not customer.zip_code or not request.user.profile.phone:
					status = "incomplete"
					msg = _("Please Complete your profile.")
			except Customer.DoesNotExist:
				status = "incomplete"
				msg = _("Please Complete your profile.")
		else:
			status = "unautorized"
			msg = _("Only registered customer is allowed to checkout.")
		delivery_date = request.POST.get("delivery_date")
		time_in_str=request.POST.get("delivery_time")
		#new delevery time
		delivery_time = datetime.strptime(time_in_str,"%H:%M").time()

		timeNow = datetime.now().time()
		max_time = datetime.strptime("12:00 PM","%I:%M %p").time()
		date_1 = datetime.strptime(delivery_date, "%Y-%m-%d").date()
		dateNow = datetime.now().date()
		if date_1 == dateNow:
			if timeNow > max_time:
				status = "timeup"
				msg = _("Oooops! You are late. No more orders for today. Please select later date.")
				delivery_date = date_1 + timedelta(days=1)
		Cart.objects.filter(user=user).update(delivery_date=delivery_date,delivery_time=delivery_time)

		cart = Cart.objects.filter(user=user) 
		print "cart=",cart
		for obj in cart:
			lunchbox = Lunchbox.objects.get(id=obj.lunchbox_id)
			if not lunchbox.restaurant.is_open(date_1):
				status = "closed"
				msg = _("{} is closed on selected delivery date. Please select a later date or remove {} from your cart list.").format(lunchbox.restaurant,lunchbox.name)

		response_data={}
		serializer = ReturnSerializer(cart, many=True)
		response_data = (serializer.data)
		print "response=",response_data
		response_data.append({
		'status' : status,
		'msg' : msg
		})
		return HttpResponse(json.dumps(response_data), content_type='application/json')


class OrderPayment(TemplateView):

	def post(self, request, *args, **kwargs):
		module_type = request.POST.get('module_type')
		payment_method = request.POST.get('payment_method')

		self.template_name = "{}.html".format(payment_method)
		if int(module_type) ==0:
			#For Add Money to wallet
			total1 = request.POST.get('a_final_amount')
			moneytowallet_id = request.POST.get('wallet_user')
			total = float(total1)

			try:
				user=User.objects.get(id=request.user.id);
				moneytowallet = MoneyToWallet.objects.get(id=moneytowallet_id, user=user, status=False)
				if total:
					payment_choice = payment_choices.PAYPAL if \
						payment_method == "paypal" else payment_choices.REDSYS
					payment_status = payment_choices.PENDING
					payorder = WalletPayment.objects.create(moneytowallet=moneytowallet,
										status=payment_status,
										payment_type=payment_choice,
										amount=total)
					if payment_choice == payment_choices.PAYPAL:
						# What you want the button to do.
						payment = Payment({
							"intent": "sale",
							"payer": {
								"payment_method": "paypal"},
							"redirect_urls": {
								"return_url": "{}{}/payment/confirmation/".format(settings.BASE_URL,request.LANGUAGE_CODE),
								"cancel_url": "{}{}".format(settings.BASE_URL,request.LANGUAGE_CODE)},
							"transactions": [{
								"item_list": {
									"items": [{
										"name":"La Fiambrera - Order"+ str(moneytowallet.id),
										"sku": "wallet",
										"price": total,
										"currency": "EUR",
										"quantity": 1}]},
								"amount": {
									"total": total,
									"currency": "EUR"},
								
								"description": "This is the payment transaction description."}]})
						if payment.create():
							PaypalPaymentDetails.objects.create(payfor="MoneyToWallet",
								payuiid=moneytowallet.uuid,
								paypal_paymentid=payment.id
								)
							print("Payment[%s] created successfully" % (payment.id))
							for link in payment.links:
								print "\n\n\n",link,"\n\n\n"
								if link.rel == "approval_url":
									approval_url = str(link.href)
									print("Redirect for approval: %s" % (approval_url))
									return HttpResponseRedirect(approval_url)

								else:
									print "some error occur"
							messages.error(request, _('Some error occur in your transaction'))
							HttpResponseRedirect('/')
					else:
						
						total=total*100

						form = SermepaPaymentForm(amount=int(total), order_uuid=moneytowallet.uuid)
						return render(request, self.template_name,
									  {'form': form, 'debug': settings.DEBUG})
				else:
					# The total amount is 0, so the payment is not really done just
					# simulated

					payment_choice = payment_choices.ZERO_VALUE
					payment_status = payment_choices.SUCCESS
					pay.objects.create(moneytowallet=moneytowallet,
										status=payment_status,
										payment_type=payment_choice,
										amount=total)
					return HttpResponseRedirect(
						settings.PAYMENT_RETURN_URL.format(moneytowallet.uuid))
			except Exception as r:
				messages.error(request, _('Some error occur in your transaction'))
				return HttpResponseRedirect('/')
		elif int(module_type) ==3:

			total = request.POST.get('remaining_order')
			total = float(total)
			order_id = request.POST.get('order_id_wallet')
			order = Order.objects.get(id=order_id)
			user = User.objects.get(id=request.user.id)
			payment_choice = payment_choices.PAYPAL if \
					payment_method == "paypal" else payment_choices.REDSYS
			if payment_choice == payment_choices.PAYPAL:
				# What you want the button to do.
				payment = Payment({
					"intent": "sale",
					"payer": {
						"payment_method": "paypal"},
					"redirect_urls": {
						"return_url": "{}{}/payment/confirmation/".format(settings.BASE_URL,request.LANGUAGE_CODE),
						"cancel_url": "{}{}/checkout/".format(settings.BASE_URL,request.LANGUAGE_CODE)},
					"transactions": [{
						"item_list": {
							"items": [{
								"name":"La Fiambrera - Order"+ str(order.id),
								"sku": "lunchbox",
								"price": total,
								"currency": "EUR",
								"quantity": 1}]},
						"amount": {
							"total": total,
							"currency": "EUR"},
						
						"description": "This is the payment transaction description."}]})
				if payment.create():
					PaypalPaymentDetails.objects.create(payfor="Both",
						payuiid=order.uuid,
						paypal_paymentid=payment.id
						)
					print("Payment[%s] created successfully" % (payment.id))
					for link in payment.links:
						if link.rel == "approval_url":
							approval_url = str(link.href)
							print("Redirect for approval: %s" % (approval_url))
							return HttpResponseRedirect(approval_url)

						else:
							print "Some error Occur"
					messages.error(request, _('Some error occur in your transaction'))
					return HttpResponseRedirect("/")

						

			else:
				total=total*100
				form = SermepaPaymentForm(amount=int(total), order_uuid=order.uuid)
				return render(request, self.template_name,
							  {'form': form, 'debug': settings.DEBUG})
		else:
			#Direct Payment from account

			total1 = request.POST.get('l_final_amount')
			comment = request.POST.get('comments_check')
			vat1 = request.POST.get('vat')
			if vat1:
				vat=float(vat1)
			else:
				vat=0.0
			print "\n\n vat 1=",vat1
			print "\n\n vat 1=",vat
			data = json.loads(request.POST.get('orders'))
			user = User.objects.get(id=request.user.id)
			total = float(total1)
			code = request.POST.get('code')
			if len(data) > 0:
				order = Order.objects.create(user=user, vat=vat)

				Comment.objects.create(order=order, comment=comment)
				# Add items to our order
				for o in data:

					lunchbox = Lunchbox.objects.get(id=int(o['lunchbox_id']))
					qty = int(o['qty'])
					o['delivery_date']=str(o['delivery_date'])
					# o['date']=o['date'].replace(',','')
					# o['date']=str(o['date'].tm_year)+'-'+str(o['date'].tm_mon)+'-'+str(o['date'].tm_mday)

					delivery_date = datetime.strptime(o['delivery_date'], "%Y-%m-%d %H:%M:%S")
					aware_delivery_date = pytz.utc.localize(delivery_date)
					delivery_date = aware_delivery_date.astimezone(pytz.timezone('CET'))

					OrderItem.objects.create(
						order=order, lunchbox=lunchbox, qty=qty,
						delivery_date=delivery_date)

				code_exists = False

				# Check if the code exists and is valid. Then apply the discount
				if code:
					code_exists = CheckoutPromoCode.objects.get(promo_code=code)

				# If the total is 0. Simulate the payment, otherwise select the
				# payment_choice and set the payment status to pending
				if total:
					payment_choice = payment_choices.PAYPAL if \
						payment_method == "paypal" else payment_choices.REDSYS
					payment_status = payment_choices.PENDING
					payorder = pay.objects.create(order=order,
										status=payment_status,
										payment_type=payment_choice,
										amount=total,
										coupon=code_exists if code_exists
										else None)
					if payment_choice == payment_choices.PAYPAL:
						# What you want the button to do.
						payment = Payment({
							"intent": "sale",
							"payer": {
								"payment_method": "paypal"},
							"redirect_urls": {
								"return_url": "{}{}/payment/confirmation/".format(settings.BASE_URL,request.LANGUAGE_CODE),
								"cancel_url": "{}{}/checkout/".format(settings.BASE_URL,request.LANGUAGE_CODE)},
							"transactions": [{
								"item_list": {
									"items": [{
										"name":"La Fiambrera - Order"+ str(order.id),
										"sku": "lunchbox",
										"price": total,
										"currency": "EUR",
										"quantity": 1}]},
								"amount": {
									"total": total,
									"currency": "EUR"},
								
								"description": "This is the payment transaction description."}]})
						if payment.create():
							PaypalPaymentDetails.objects.create(payfor="Order",
								payuiid=order.uuid,
								paypal_paymentid=payment.id
								)
							print("Payment[%s] created successfully" % (payment.id))
							for link in payment.links:
								if link.rel == "approval_url":
									approval_url = str(link.href)
									print("Redirect for approval: %s" % (approval_url))
									return HttpResponseRedirect(approval_url)

								else:
									print "Some error Occur"
							messages.error(request, _('Some error occur in your transaction'))		
							return HttpResponseRedirect("/")

								

					else:
						# print "\n\n\n\namount is =",int(round(total, 2) * 100),"\n\n\n"
						total=total*100
						form = SermepaPaymentForm(amount=int(total), order_uuid=order.uuid)
						return render(request, self.template_name,
									  {'form': form, 'debug': settings.DEBUG})
				else:
					# The total amount is 0, so the payment is not really done just
					# simulated

					payment_choice = payment_choices.ZERO_VALUE
					payment_status = payment_choices.SUCCESS
					pay.objects.create(order=order,
										status=payment_status,
										payment_type=payment_choice,
										amount=total,
										coupon=code_exists if code_exists
										else None)
					if code_exists:
						# The coupon is used
						code_exists[0].used_by.add(user)
					return HttpResponseRedirect(
						settings.PAYMENT_RETURN_URL.format(order.uuid))

			else:
				return HttpResponseRedirect('/checkout/')


class RateService(RedirectView):
	def get(self, request, *args, **kwargs):
		rating = int(request.GET.get('rating'))
		paymentid = request.GET.get('paymentid')
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



class PayWallet(TemplateView):
	template_name="mainapp/checkout.html"
	def post(self, request, *args, **kwargs): 
		try:
			total = request.POST.get('total_amount')
			total = float(total)
			data = json.loads(request.POST.get('orders'))
			code = request.POST.get('code')
			vat = request.POST.get('vat')
			user_id = request.user.id
			user = User.objects.get(id=user_id)
			wallet_money = Wallet.objects.get(user=user)
			order = Order.objects.create(user=user,vat=float(vat))
			wallet_order = WalletOrder.objects.create(user=user,
						order=order,
						wallet=wallet_money)

			for o in data:
				lunchbox = Lunchbox.objects.get(id=int(o['lunchbox_id']))
				qty = int(o['qty'])
				o['delivery_date']=str(o['delivery_date'])
				# o['date']=o['date'].replace(',','')
				# o['date']=str(o['date'].tm_year)+'-'+str(o['date'].tm_mon)+'-'+str(o['date'].tm_mday)

				delivery_date = datetime.strptime(o['delivery_date'], "%Y-%m-%d %H:%M:%S")
				aware_delivery_date = pytz.utc.localize(delivery_date)
				delivery_date = aware_delivery_date.astimezone(pytz.timezone('CET'))

				OrderItem.objects.create(
					order=order, lunchbox=lunchbox, qty=qty,
					delivery_date=delivery_date)

			code_exists = False

			# Check if the code exists and is valid. Then apply the discount
			if code:
				code_exists = CheckoutPromoCode.objects.get(promo_code=code)

			# If the total is 0. Simulate the payment, otherwise select the
			# payment_choice and set the payment status to pending
			if total:
				payment_choice = payment_choices.WALLET
				payment_status = payment_choices.PENDING
				payorder = pay.objects.create(order=order,
									status=payment_status,
									payment_type=payment_choice,
									amount=total,
									coupon=code_exists if code_exists
									else None)
			if wallet_money.amount >= float(total):
				lafia_currency = Lafiambrera_Currency.objects.all()
				total_pay = total * float(lafia_currency[0].OneEuro)
				wallet_money.amount -= total
				wallet_money.lafiambera_credit -= total_pay
				wallet_money.save()

				for item in order.orderitem_set.all():
					OrderNotification.objects.create(order_item=item)
				
				# Clear basket
				Cart.objects.filter(user=order.user).delete()
				del request.session['cart']
				order.u_is_paid = True
				payorder.status = payment_choices.SUCCESS
				wallet_order.paymentgateway=0
				wallet_order.status = True
				order.save()
				payorder.save()
				wallet_order.save()
				# PAYMENT SUCCESS TEMPLATE
				if payorder.coupon:
					payorder.coupon.used_by.add(payment.order.user)
					# coupans=CheckoutPromoCode.objects.get(id=payorder.coupon.id)
					# coupans.qty -=1
					# coupans.save()
				return HttpResponse(json.dumps({
					'status': 'paid',
					'msg': _('Thank You, Your order is placed.'),
					'order_id':str(order.id) 
				}), content_type="application/json")

			else:

				remaining_amount = total - wallet_money.amount
				wallet_order.paymentgateway = remaining_amount
				wallet_order.save()
				return HttpResponse(json.dumps({
					'status': 'unpaid',
					'msg': _('Your total bill is '+str(total)+' .You have only '+str(wallet_money.amount)+' left in your amount. For remaining amount choose another method.'),
					'remain':str(remaining_amount),
					'order_id': str(order.id)
				}), content_type="application/json")

		except Exception as e:
			return HttpResponse(json.dumps({
					'status': 'error',
					'msg': str(e),#_('Sorry, Some error occur. Please try again....!!!!!'),
					'error_msg': str(e)
				}), content_type="application/json")

class Search(TemplateView):
	template_name = "mainapp/search.html"
	def post(self, request, *args, **kwargs):
		if request.user.is_authenticated():
			if request.user.profile.is_restaurant() or request.user.profile.is_employee() or request.user.is_staff:
				messages.error(request,'invalidforsite')
				return HttpResponseRedirect('/{}/dashboard/'.format(request.LANGUAGE_CODE)) 
		search_param = request.POST.get('search_data')
		restaurants = Restaurant.objects.filter(name__icontains=search_param)
		lunchboxes = Lunchbox.objects.filter(name__icontains=search_param)
		return render(request,self.template_name,locals())

class CustomerProfile(TemplateView):
	template_name = "profiles/customer.html"
	def get(self, request, *args, **kwargs): 
		account=kwargs.get("id")
		print "\n\n\n",account,"\n\n\n"
		if request.user.is_authenticated():
			if request.user.profile.is_restaurant() or request.user.profile.is_employee() or request.user.is_staff:
				messages.error(request,'invalidforsite')
				return HttpResponseRedirect('/{}/dashboard/'.format(request.LANGUAGE_CODE))
		if request.user.is_authenticated() and request.user.profile.is_restaurant():
			user = User.objects.get(id=request.user.id)
			address_details = Restaurant.objects.get(user=user)
			profile=Profile.objects.get(user=user)
		elif request.user.is_authenticated() and not request.user.profile.is_restaurant() and not request.user.profile.is_employee() and not request.user.is_staff:
			user = User.objects.get(id=request.user.id)
			if account==1:
				if 'cart' in request.session:
					return HttpResponseRedirect('/checkout')
			try:
				address_details = Customer.objects.get(user=user)
			except Customer.DoesNotExist:
				address_details =""
			profile=Profile.objects.get(user=user)
		else:
			return HttpResponseRedirect('/')
		if int(account)==1:
			if 'cart' not in request.session:
				try:
					Cart.objects.get(user=request.user)
					return HttpResponseRedirect('/checkout')
				except Cart.DoesNotExist:
					return render(request,self.template_name,locals())
				except Cart.MultipleObjectsReturned:
					return HttpResponseRedirect('/checkout')
			else:
				return HttpResponseRedirect('/checkout')
		return render(request,self.template_name,locals())	
		
	def post(self, request, *args, **kwargs): 
		first_name = request.POST.get('first_name')
		last_name = request.POST.get('last_name')
		address = request.POST.get('address')
		email = request.POST.get('email')
		country = request.POST.get('country')
		city = request.POST.get('city')
		state = request.POST.get('state')
		zip_code = request.POST.get('zip_code')
		phone = request.POST.get('phone')
		door = request.POST.get('door_num')
		building = request.POST.get('building_num')
		check = request.POST.get('checkout')
		if request.user.is_authenticated() and not request.user.profile.is_restaurant() and not request.user.profile.is_employee() and not request.user.is_staff:
			user = User.objects.get(id=request.user.id)
			user.first_name=first_name
			user.last_name=last_name
			user.email=email
			if 'user_id' in request.session:
				user.username=email
			user.save()
			try:
				address_details = Customer.objects.get(user=user)
				address_details.name = "{} {}".format(first_name, last_name)
				address_details.address=address
				address_details.country=country
				address_details.city=city
				address_details.state=state
				address_details.street=building
				address_details.zip_code=zip_code
				address_details.door_num=door
				address_details.building_num=building
				address_details.save()
				
			except Customer.DoesNotExist:
				address_details=Customer.objects.create(user=user,
					name="{} {}".format(first_name, last_name),
					address=address,
					country=country,
					city=city,
					state=state,
					street=building,
					zip_code=zip_code,
					door_num=door,
					building_num=building)
				

			try:
				profile = Profile.objects.get(user=user)
				profile.phone=phone
				profile.customer=address_details
				profile.save()
			except Profile.DoesNotExist:
				Profile.objects.create(user=user,
					phone=phone,
					customer=address_details)
			if check!="checkout":
				edit_msg = _('Profile Updated Successfully')
		# elif request.user.is_authenticated() and request.user.profile.is_restaurant():
		# 	user = User.objects.get(id=request.user.id)
		# 	user.first_name=first_name
		# 	user.last_name=last_name
		# 	user.email=email
		# 	user.save()
		# 	address_details = Restaurant.objects.get(user=user)
		# 	address_details.address=address
		# 	address_details.country=country
		# 	address_details.city=city
		# 	address_details.state=state
		# 	address_details.street=building
		# 	address_details.save()
		# 	profile = Profile.objects.get(user=user)
		# 	profile.phone=phone
		# 	profile.save()
		# 	edit_msg = _('Profile Updated Successfully')
		else:
			messages.error(request, _('Please Log In First'))
			return HttpResponseRedirect('/')
		if check=="checkout":
			return HttpResponseRedirect('/checkout')
		else:
			return render(request,self.template_name,locals())

class RestaurantProfile(TemplateView):
	template_name = "profiles/restaurant.html"
	def get(self, request, *args, **kwargs): 
		if request.user.is_authenticated():
			if request.user.profile.is_restaurant() or request.user.profile.is_employee() or request.user.is_staff:
				messages.error(request,'invalidforsite')
				return HttpResponseRedirect('/{}/dashboard/'.format(request.LANGUAGE_CODE))
		try:
			restaurant = Restaurant.objects.get(id=kwargs.get('restaurant_id'));
			
			for i in restaurant.get_images():
				print i.image
			print restaurant
		except Restaurant.DoesNotExist:
			restaurant = []
			print restaurant
		return render(request,self.template_name,locals())


class UserOrders(TemplateView):
	template_name = "profiles/customer_order.html"

	def get(self, request, *args, **kwargs):
		if request.user.is_authenticated():
			if not request.user.profile.is_restaurant() or not request.user.profile.is_employee() or not request.user.is_staff:
				orders1 = OrderItem.objects.filter(order__user__id=request.user.id).order_by('-id')[:50]
				page = self.request.GET.get('page', 1)
				orders = Paginator(orders1, 5)
				try:
					orders = orders.page(page)
				except PageNotAnInteger:
					orders = orders.page(1)
				except EmptyPage:
					orders = orders.page(orders.num_pages)
				return render(request, self.template_name, locals())
			else:
				return HttpResponseRedirect('/{}/dashboard/order'.format(request.LANGUAGE_CODE))
		else:
			return HttpResponseRedirect('/')



class UserOrderDetail(TemplateView):
	template_name = "profiles/customer_order_detail.html"
	def get(self, request, *args, **kwargs):
		if request.user.is_authenticated():
			if request.user.profile.is_restaurant() or request.user.profile.is_employee() or request.user.is_staff:
				messages.error(request,'invalidforsite')
				return HttpResponseRedirect('/{}/dashboard/'.format(request.LANGUAGE_CODE))
		item_id = kwargs.get('id')
		order_list = self.get_all_orders(item_id)
		return render(request, self.template_name, locals())

	def get_all_orders(self, item_id):
		order_list = []
		delivery_datetimes = OrderItem.objects.filter(id=item_id)
		est = pytz.timezone('CET')
		delivery_dates = []
		for date in delivery_datetimes:
			date_cet = date.delivery_date.astimezone(est)
			date_cet = date_cet.replace(hour=0, minute=0)
			if date_cet not in delivery_dates:
				delivery_dates.append(date_cet)

		for dd in delivery_dates:
			user_orders = []
			tz_utc = pytz.timezone('UTC')
			delivery_date_start = dd.replace(hour=0, minute=0)\
				.astimezone(tz_utc)
			delivery_date_end = dd.replace(hour=23, minute=59)\
				.astimezone(tz_utc)

			u = OrderItem.objects.filter(id=item_id,
				order__is_archived=False,
				delivery_date__range=(delivery_date_start, delivery_date_end))\
				.values('lunchbox__restaurant').annotate(
				available=Count('lunchbox__restaurant'))

			for uo in u:
				qset = OrderItem.objects.filter(id=item_id)

				u_orders = qset

				user_orders.append({
					'restaurant': Restaurant.objects.get(id=uo['lunchbox__restaurant']),
					'user_orders': u_orders
				})
			order_list.append({
				'date': dd,
				'orders': user_orders
			})
		return order_list

class InviteFriend(TemplateView):
	template_name = "mainapp/invite.html"

	def get(self, request, *args, **kwargs):
		if request.user.is_authenticated():
			if request.user.profile.is_restaurant() or request.user.profile.is_employee() or request.user.is_staff:
				messages.error(request,'invalidforsite')
				return HttpResponseRedirect('/{}/dashboard/'.format(request.LANGUAGE_CODE))
		if request.user.is_authenticated():
			return render(request, self.template_name, {})
		else:
			messages.error(request, _('Please login first to use this feature.'))
			return HttpResponseRedirect('/')

class AcceptInvite(TemplateView):
	template_name = "mainapp/invite.html"
	def get(self, request, *args, **kwargs):
		key=kwargs.get('code')
		try:
			logout(request)
			invite = InviteRequest.objects.get(key=key)
			invite.status = True
			invite.save()
			request.session['uuid']=key
			return HttpResponseRedirect('/restaurant/registration/')
		except InviteRequest.DoesNotExist:
			messages.error(request, _('This link is expired.'))
			return HttpResponseRedirect('/')

class UserNotifications(TemplateView):
	template_name = "mainapp/user_notifications.html"
	def get(self, request, *args, **kwargs):
		if request.user.is_authenticated():
			if request.user.profile.is_restaurant() or request.user.profile.is_employee() or request.user.is_staff:
				messages.error(request,'invalidforsite')
				return HttpResponseRedirect('/{}/dashboard/'.format(request.LANGUAGE_CODE))
		notifications1 = UserNotification.objects.filter(user__id=request.user.id, unread=False)
		for i in notifications1:
			if i.cat==1:
				if datetime.now().date() > i.date.date():
					i.unread=True
					i.save()
		notifications = UserNotification.objects.filter(user__id=request.user.id, unread=False).order_by('-id')
		return render(request, self.template_name, locals())



class PaymentConfirmation(TemplateView):
	template_name = "mainapp/order_payment_confirm.html"
	template_name_wallet = "mainapp/wallet_payment_confirm.html"
	template_name_both = "mainapp/both_payment_confirm.html"
	
	def get(self, request, *args, **kwargs):
		paymentid=request.GET.get("paymentId")
		token = request.GET.get("token")
		payer_id = request.GET.get("PayerID")
		payment = Payment.find(paymentid)
		print "Start Payment execution"
		if payment.execute({"payer_id": payer_id}):  # return True or False
			
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
					UserNotification.objects.create(user=request.user,
							head_en="Order",
							head_es="Orden",
							msg_en="Thank you! Your order is placed succesfully.",
							msg_es='Gracias! Su pedido se ha realizado correctamente.'
							)
					# PAYMENT SUCCESS TEMPLATE
					if payment.coupon:
						payment.coupon.used_by.add(payment.order.user)
						# coupans=CheckoutPromoCode.objects.get(id=payment.coupon.id)
						# coupans.qty -=1
						# coupans.save()
					try:
						wallet_order = WalletOrder.objects.get(order=order)
						wallet_order.status = True
						wallet_order.save()
						Wallet.objects.filter(user=wallet_order.user).update(amount='0', lafiambera_credit='0')
						order_list = self.get_all_orders(order)
						items=OrderItem.objects.filter(order=order)
						for item in items:
							order_list1 = self.get_restaurant_orders(item.lunchbox.restaurant, order)
							# template = get_template("mail/dashboard_restaurant_orders.html")
							# logo=settings.BASE_URL
							# mail_content = template.render({"order_list":order_list1})
							# subject = "La Fiambrera - New Order Placed"
							# from_email = settings.EMAIL_HOST_USER
							# to_email = [item.lunchbox.restaurant.user.email]
							# email = EmailMessage(subject, mail_content, from_email, to_email)
							# email.content_subtype = 'html'
							# email.send()

							#----------------------------New Mail Details---------------------------

							fromaddr = settings.EMAIL_ADDRESS
							pwd = settings.PASSWORD
							msg = MIMEMultipart()
							msg['From'] = fromaddr
							recipients = [item.lunchbox.restaurant.user.email]
							msg['To'] = ", ".join(recipients)

							msg['Subject'] = "La Fiambrera - New Order Placed"

							content_html = render_to_string("mail/dashboard_restaurant_orders.html", {'order_list':order_list1})
							content_html = content_html.encode('utf-8').strip()
							test = MIMEText(content_html, 'html')
							msg.attach(test)

							server = smtplib.SMTP('smtp.gmail.com', 587)
							server.starttls()
							server.login(fromaddr, pwd)

							text = msg.as_string()

							server.sendmail(fromaddr, recipients, text)
							server.quit()

						# template = get_template("mail/dashboard_payment_orders.html")
						# logo=settings.BASE_URL
						# mail_content = template.render({"order_list":order_list,"order":order})
						# subject = "La Fiambrera - Your Payment details"
						# from_email = settings.EMAIL_HOST_USER
						# to_email = [request.user.email]
						# email = EmailMessage(subject, mail_content, from_email, to_email)
						# email.content_subtype = 'html'
						# email.send()

						#----------------------------New Mail Details---------------------------

						fromaddr = settings.EMAIL_ADDRESS
						pwd = settings.PASSWORD
						msg = MIMEMultipart()
						msg['From'] = fromaddr
						recipients = [request.user.email]
						msg['To'] = ", ".join(recipients)

						msg['Subject'] = "La Fiambrera - Your Payment details"

						content_html = render_to_string("mail/dashboard_payment_orders.html", {"order_list":order_list,"order":order})
						content_html = content_html.encode('utf-8').strip()
						test = MIMEText(content_html, 'html')
						msg.attach(test)

						server = smtplib.SMTP('smtp.gmail.com', 587)
						server.starttls()
						server.login(fromaddr, pwd)

						text = msg.as_string()

						server.sendmail(fromaddr, recipients, text)
						server.quit()
						return render(request, self.template_name_both, locals())
					except WalletOrder.DoesNotExist:
						order_list = self.get_all_orders(order)
						items=OrderItem.objects.filter(order=order)
						for item in items:
							order_list1 = self.get_restaurant_orders(item.lunchbox.restaurant, order)
							# template = get_template("mail/dashboard_restaurant_orders.html")
							# logo=settings.BASE_URL
							# mail_content = template.render({"order_list":order_list1})
							# subject = "La Fiambrera - New Order Placed"
							# from_email = settings.EMAIL_HOST_USER
							# to_email = [item.lunchbox.restaurant.user.email]
							# email = EmailMessage(subject, mail_content, from_email, to_email)
							# email.content_subtype = 'html'
							# email.send()

							#----------------------------New Mail Details---------------------------

							fromaddr = settings.EMAIL_ADDRESS
							pwd = settings.PASSWORD
							msg = MIMEMultipart()
							msg['From'] = fromaddr
							recipients = [request.user.email]
							msg['To'] = ", ".join(recipients)

							msg['Subject'] = "La Fiambrera - New Order Placed"

							content_html = render_to_string("mail/dashboard_restaurant_orders.html", {"order_list":order_list1})
							content_html = content_html.encode('utf-8').strip()
							test = MIMEText(content_html, 'html')
							msg.attach(test)

							server = smtplib.SMTP('smtp.gmail.com', 587)
							server.starttls()
							server.login(fromaddr, pwd)

							text = msg.as_string()

							server.sendmail(fromaddr, recipients, text)
							server.quit()

						# template = get_template("mail/dashboard_admin_orders.html")
						# logo=settings.BASE_URL
						# mail_content = template.render({"order_list":order_list,"order":order})
						# subject = "La Fiambrera - Your Payment details"
						# from_email = settings.EMAIL_HOST_USER
						# to_email = [request.user.email]
						# email = EmailMessage(subject, mail_content, from_email, to_email)
						# email.content_subtype = 'html'
						# email.send()


						#----------------------------New Mail Details---------------------------

						fromaddr = settings.EMAIL_ADDRESS
						pwd = settings.PASSWORD
						msg = MIMEMultipart()
						msg['From'] = fromaddr
						recipients = [request.user.email]
						msg['To'] = ", ".join(recipients)

						msg['Subject'] = "La Fiambrera - Your Payment details"

						content_html = render_to_string("mail/dashboard_admin_orders.html", {"order_list":order_list,"order":order})
						content_html = content_html.encode('utf-8').strip()
						test = MIMEText(content_html, 'html')
						msg.attach(test)

						server = smtplib.SMTP('smtp.gmail.com', 587)
						server.starttls()
						server.login(fromaddr, pwd)

						text = msg.as_string()

						server.sendmail(fromaddr, recipients, text)
						server.quit()
						

						return render(request, self.template_name, locals())
				except Order.DoesNotExist:
					moneytowallet = MoneyToWallet.objects.get(uuid=paypal_payment.payuiid)
					payment = moneytowallet.walletpayment
					moneytowallet.status=True
					payment.status = payment_choices.SUCCESS
					moneytowallet.save()
					payment.save()
					
					UserNotification.objects.create(user=request.user,
							head_en="Wallet",
							head_es="Billetera",
							msg_en="You have successfully added {} La-Fiambrera credits in your account.".format(payment.amount),
							msg_es='Has agregado {} créditos de La-Fiambrera correctamente en tu cuenta.'.format(payment.amount)
							)
					try:
						wallet_amount = Wallet.objects.get(user=moneytowallet.user)
						wallet_amount.amount += moneytowallet.amount
						wallet_amount.lafiambera_credit += moneytowallet.lafiambera_credit
						wallet_amount.save()
					except Wallet.DoesNotExist:
						wallet_amount = Wallet.objects.create(user=moneytowallet.user,
							amount = moneytowallet.amount,
							lafiambera_credit = moneytowallet.lafiambera_credit)
					return render(request, self.template_name_wallet, locals())

			except PaypalPaymentDetails.DoesNotExist:
				messages.error(request, _('Requested link is no more available.'))
				return	HttpResponseRedirect('/')
		else:
			messages.error(request, _('Requested link is no more available.'))
			
			return HttpResponseRedirect('/')
	def get_all_orders(self, order):
		order_list = []
		delivery_datetimes = orders.models.OrderItem.objects.filter(order=order,
			order__u_is_paid=True).order_by(
			'delivery_date').values('delivery_date').distinct()

		est = pytz.timezone('CET')
		delivery_dates = []
		for date in delivery_datetimes:
			date_cet = date['delivery_date'].astimezone(est)
			date_cet = date_cet.replace(hour=0, minute=0)
			if date_cet not in delivery_dates:
				delivery_dates.append(date_cet)

		for dd in delivery_dates:
			user_orders = []
			tz_utc = pytz.timezone('UTC')
			delivery_date_start = dd.replace(hour=0, minute=0)\
				.astimezone(tz_utc)
			delivery_date_end = dd.replace(hour=23, minute=59)\
				.astimezone(tz_utc)

			u = orders.models.OrderItem.objects.filter(order=order,
				order__is_archived=False,
				delivery_date__range=(delivery_date_start, delivery_date_end),
				order__u_is_paid=True)\
				.values('lunchbox__restaurant').annotate(
				available=Count('lunchbox__restaurant'))

			for uo in u:
				qset = orders.models.OrderItem.objects.filter(order=order,
					order__is_archived=False,
					delivery_date__range=(delivery_date_start,
										  delivery_date_end),
					lunchbox__restaurant__id=uo['lunchbox__restaurant'],
					order__u_is_paid=True)

				u_orders = qset
				tlen=(len(u_orders)*4)+1
				user_orders.append({
					'restaurant': Restaurant.objects.get(id=uo['lunchbox__restaurant']),
					'user_orders': u_orders,
					'length_of':tlen
				})
			order_list.append({
				'date': dd,
				'orders': user_orders
			})
		return order_list
	def get_restaurant_orders(self, restaurant, order):
		order_list = []
		delivery_datetimes = orders.models.OrderItem.objects.filter(order=order,
			lunchbox__restaurant=restaurant,
			order__u_is_paid=True
		).order_by('delivery_date')\
			.values('delivery_date').distinct()

		est = pytz.timezone('CET')
		delivery_dates = []
		for date in delivery_datetimes:
			date_cet = date['delivery_date'].astimezone(est)
			date_cet = date_cet.replace(hour=0, minute=0)
			if date_cet not in delivery_dates:
				delivery_dates.append(date_cet)

		for dd in delivery_dates:
			user_orders = []
			tz_utc = pytz.timezone('UTC')
			delivery_date_start = dd.replace(hour=0, minute=0)\
				.astimezone(tz_utc)
			delivery_date_end = dd.replace(hour=23, minute=59)\
				.astimezone(tz_utc)

			u = orders.models.OrderItem.objects.filter(order=order,
				lunchbox__restaurant=restaurant,
				delivery_date__range=(delivery_date_start, delivery_date_end),
				order__is_archived=False,
				order__u_is_paid=True)\
				.values('order__user').annotate(available=Count('order__user'))
			for uo in u:
				qset = orders.models.OrderItem.objects.filter(order=order,
					delivery_date__range=(delivery_date_start,
										  delivery_date_end),
					order__user__id=uo['order__user'],
					lunchbox__restaurant=restaurant,
					order__is_archived=False,
					order__u_is_paid=True)

				u_orders = qset
				tlen=(len(u_orders)*3)+1
				user_orders.append({
					'user': User.objects.get(id=uo['order__user']),
					'user_orders': u_orders,
					'length_of':tlen
				})
			order_list.append({
				'date': dd,
				'orders': user_orders
			})
		return order_list
	

class WalletHistory(TemplateView):
	template_name="mainapp/wallet.html"
	def get(self, request, *args, **kwargs):
		if request.user.is_authenticated():
			if request.user.profile.is_restaurant() or request.user.profile.is_employee() or request.user.is_staff:
				messages.error(request,'invalidforsite')
				return HttpResponseRedirect('/{}/dashboard/'.format(request.LANGUAGE_CODE))
		if request.user.is_authenticated() and not request.user.profile.is_restaurant() or not request.user.profile.is_employee() or not request.user.is_staff:
			try:
				wallet = Wallet.objects.get(user=request.user)
				wallet_credits = wallet.lafiambera_credit
			except Wallet.DoesNotExist:
				wallet_credits = 0
			wallet_payments = WalletPayment.objects.filter(moneytowallet__user=request.user, moneytowallet__status=True)
			page = self.request.GET.get('page', 1)
			wallet_payments = Paginator(wallet_payments, 5)
			try:
				wallet_payments = wallet_payments.page(page)
			except PageNotAnInteger:
				wallet_payments = wallet_payments.page(1)
			except EmptyPage:
				wallet_payments = wallet_payments.page(wallet_payments.num_pages)
			return render(request, self.template_name,locals())
		else:
			messages.error(request, _('Please log in first.'))
			return HttpResponseRedirect('/')



class ShareCredit(TemplateView):
	template_name="mainapp/wallet.html"
	def post(self, request, *args, **kwargs):
		response={}
		credits=request.POST.get("amount")
		email=request.POST.get("email")
		try:
			wallet = Wallet.objects.get(user=request.user)
			if wallet.lafiambera_credit <= 0:
				response['status']='error'
				response['msg'] = _("Your wallet is empty. Please recharge your wallet.")
				return HttpResponse(json.dumps(response), content_type='application/json')
			elif wallet.lafiambera_credit < float(credits):
				response['status']='error'
				response['msg'] = _("Your wallet balance is low. Please recharge your wallet.")
				return HttpResponse(json.dumps(response), content_type='application/json')
			else:
				try:
					second_user = User.objects.get(email=email)
					lafia_currency = Lafiambrera_Currency.objects.all();
					try:
						wallet1 = Wallet.objects.get(user=second_user)
						wallet1.lafiambera_credit += float(credits) 
						wallet1.amount += round(float(credits)/lafia_currency[0].OneEuro, 2)
						wallet1.save()
					except Wallet.DoesNotExist:
						Wallet.objects.create(user=second_user,
							lafiambera_credit = float(credits),
							amount = round(float(credits)/lafia_currency[0].OneEuro, 2))
					wallet.lafiambera_credit -= float(credits) 
					wallet.amount -= round(float(credits)/lafia_currency[0].OneEuro, 2)
					wallet.save()
					UserNotification.objects.create(user=second_user,
							head_en="Wallet",
							head_es="Billetera",
							msg_en="{} {} sent you {} La-Fiambrera credits.".format(request.user.first_name, request.user.last_name, credits),
							msg_es="{} {} Te envía {} créditos de La-Fiambrera.".format(request.user.first_name, request.user.last_name, credits),
							)
					response['status']='success'
					response['remains']=wallet.lafiambera_credit
					response['msg'] = _("{} La-Fiambrera credits are transfered to {} {}.").format(credits, second_user.first_name, second_user.last_name)
					return HttpResponse(json.dumps(response), content_type='application/json')
				except User.DoesNotExist:
					response['status']='error'
					response['msg'] = _("This email does not exist. Invite your friend or try another email.")
					return HttpResponse(json.dumps(response), content_type='application/json')
		except Wallet.DoesNotExist:
			response['status']='error'
			response['msg'] = _("Your wallet is empty. Please recharge your wallet.")
			return HttpResponse(json.dumps(response), content_type='application/json')

class ForgotPassword(TemplateView):
	template_name = "mainapp/password_recovery.html"
	def post(self, request, *args, **kwargs):
		email = request.POST.get('email')
		try:
			user = User.objects.get(email=email)
			profile=Profile.objects.get(user=user,accounts_status=1)
			fromaddr = settings.EMAIL_ADDRESS
			salt = hashlib.sha1(str(random.random())).hexdigest()[:5]
			activation_key = hashlib.sha1(salt+email).hexdigest()

			
			user_id = user.id

			start_datetime = datetime.now()
			end_datetime = start_datetime + timedelta(minutes=130)

			fg_pwd = ForgetPassword(user_id=user_id, activation_key=activation_key, start_datetime=start_datetime, end_datetime=end_datetime)
			print fg_pwd
			fg_pwd.save()

			link = settings.BASE_URL+request.LANGUAGE_CODE+"/recover_password/{user_id}/{activation_key}".format(user_id=user_id, activation_key=activation_key)
			logo=settings.BASE_URL
			fromaddr = settings.EMAIL_ADDRESS
			password = settings.PASSWORD
			print fromaddr
			print password
			msg = MIMEMultipart()
			msg['From'] = fromaddr

			recipients = [email]
			msg['To'] = ", ".join(recipients)

			msg['Subject'] = "La Fiambrera Password Reset"

			content_html = render_to_string('login_register/recover_pass.html', {'link':link,'logo':logo})

			test = MIMEText(content_html, 'html')
			msg.attach(test)
			print 'test',test
			print 'msg',msg
			print "connecting to server"
			
			try:
				server = smtplib.SMTP('smtp.gmail.com',587)
			except Exception as rr:
				print rr
			server.set_debuglevel(True)	
			
			server.ehlo()
			server.starttls()
			server.login(fromaddr, password)

			text = msg.as_string()
			print text
			print server
			print test
			try:
				server.sendmail(fromaddr, recipients, text)
				server.quit()
			except Exception as t:
				print t
			
			return render(request, self.template_name, {'go_to_email':'A link has been sent to your email '})

		except User.DoesNotExist:
			return render(request, self.template_name, {'message':'This email is not associated with any account'})
		except Profile.DoesNotExist:
			return render(request, self.template_name, {'message':'This email is used with facebook or linkedin login. Use your social account to login.'})


	def get(self, request, *args, **kwargs):

		return render(request, self.template_name, {})




class ShareLunchbox(TemplateView):
	template_name = "mainapp/share_lunchboxes.html"
	def post(self, request, *args, **kwargs):
		credits=int(request.POST.get('credits'))
		email=request.POST.get('email')
		if not credits:
			credits=0
		response = {}
		if 'cart' in request.session:
			try:
				receiver = User.objects.get(email=email)
				wallet=""
				try:
					wallet = Wallet.objects.get(user=request.user)
				except Wallet.DoesNotExist:
					wallet = Wallet.objects.create(user=request.user)
				if wallet.lafiambera_credit < float(credits):
					response['status']='error'
					response['msg']=_('You don\'t have enough credits in your wallet.')
					return HttpResponse(json.dumps(response), content_type='application/json')
				cart = Cart.objects.filter(user=request.user)
				share = ShareSelection.objects.create(user=request.user,
					credits=credits,
					receiver_id=receiver.id)
				for boxes in cart:
					SelectionReference.objects.create(shareselection=share,lunchbox_id=boxes.lunchbox_id)
				del request.session['cart']
				cart.delete()
				UserNotification.objects.create(user=receiver,
					head_en="Share Lunchbox",
					head_es="Compartir La Fiambrera",
					msg_en="Your friend {} {} shared their lunchbox selection with you.".format(request.user.first_name.title(),request.user.last_name.title()),
					msg_es="Su amigo {} {} compartió su selección de comida con usted.ff.".format(request.user.first_name.title(),request.user.last_name.title()),
					cat=1,
					share_id=share.id)
				response['status']='success'
				response['msg']=_('Selection has been sent to your friend.')
				return HttpResponse(json.dumps(response), content_type='application/json')
			except User.DoesNotExist:
				response['status']='error'
				response['msg']=_('This email is not associated with any account.')
				return HttpResponse(json.dumps(response), content_type='application/json')
			except Wallet.DoesNotExist:
				response['status']='error'
				response['msg']=_('Your wallet is empty.')
				return HttpResponse(json.dumps(response), content_type='application/json')
		else:
			response['status']='error'
			response['msg']=_('Your cart is empty.')
			return HttpResponse(json.dumps(response), content_type='application/json')

class SharePage(TemplateView):
	template_name = "mainapp/share_lunchboxes.html"
	def get(self, request, *args, **kwargs):
		if request.user.is_authenticated():
			if request.user.profile.is_restaurant() or request.user.profile.is_employee() or request.user.is_staff:
				messages.error(request,'invalidforsite')
				return HttpResponseRedirect('/{}/dashboard/'.format(request.LANGUAGE_CODE))
		return render(request, self.template_name, {})


class AcceptShare(TemplateView):
	template_name = "mainapp/user_notifications.html"
	def post(self, request, *args, **kwargs):
		sharing_id = request.POST.get('id')
		reference = SelectionReference.objects.filter(shareselection__id=int(sharing_id))

		for boxes in reference:		
			lb = Lunchbox.objects.get(id=boxes.lunchbox_id)
			try:
				cart = Cart.objects.get(user=request.user, lunchbox_id=lb.id) 
				cart.total_price = cart.total_price +lb.price
				cart.qty = cart.qty + 1
				cart.save()	
			except Cart.DoesNotExist:
				
				cart = Cart.objects.create(
					user=request.user,
					total_price = lb.price,
					qty = 1,
					user_status = 1,
					lunchbox_id = lb.id,
					)
				cart.save()

		share = ShareSelection.objects.get(id=int(sharing_id))
		if share.credits > 0:
			print share.user.id
			wallet = Wallet.objects.get(user_id=share.user.id)
			lafia_currency = Lafiambrera_Currency.objects.all();
			try:
				wallet1 = Wallet.objects.get(user=request.user)
				wallet1.lafiambera_credit += float(share.credits) 
				wallet1.amount += round(float(share.credits)/lafia_currency[0].OneEuro, 2)
				wallet1.save()
			except Wallet.DoesNotExist:
				Wallet.objects.create(user=request.user,
					lafiambera_credit = float(share.credits),
					amount = round(float(share.credits)/lafia_currency[0].OneEuro, 2))
			wallet.lafiambera_credit -= float(share.credits) 
			wallet.amount -= round(float(share.credits)/lafia_currency[0].OneEuro, 2)
			wallet.save()
		share.status=True
		share.save()
		UserNotification.objects.filter(share_id=share.id).update(unread=True)
		return render(request, self.template_name, {})

class ArchieveUserNoti(TemplateView):
	template_name = "mainapp/user_notifications.html"
	def post(self, request, *args, **kwargs):
		sharing_id = request.POST.get('id')
		UserNotification.objects.filter(id=int(sharing_id)).update(unread=True)
		notify_qty=len(UserNotification.objects.filter(user__id=request.user.id, unread=False))
		response={}
		response['status']='success'
		response['notify_qty']=notify_qty
		return HttpResponse(json.dumps(response), content_type='application/json')


class ConfirmWalletPaid(TemplateView):
	template_name = "mainapp/both_payment_confirm.html"
	def get(self, request, *args, **kwargs):

		order=Order.objects.get(id=int(kwargs.get('id')))

		order_list = self.get_all_orders(order)

		items=OrderItem.objects.filter(order=order)
		for item in items:
			order_list1 = self.get_restaurant_orders(item.lunchbox.restaurant, order)
			# template = get_template("mail/dashboard_restaurant_orders.html")
			# logo=settings.BASE_URL
			# mail_content = template.render({"order_list":order_list1})
			# subject = "La Fiambrera - New Order Placed"
			# from_email = settings.EMAIL_HOST_USER
			# to_email = [item.lunchbox.restaurant.user.email]
			# email = EmailMessage(subject, mail_content, from_email, to_email)
			# email.content_subtype = 'html'
			# email.send()


			#----------------------------New Mail Details---------------------------

			
			fromaddr = settings.EMAIL_ADDRESS
			pwd = settings.PASSWORD
			msg = MIMEMultipart()
			msg['From'] = fromaddr
			recipients = [item.lunchbox.restaurant.user.email]
			msg['To'] = ", ".join(recipients)

			msg['Subject'] = "La Fiambrera - New Order Placed"

			content_html = render_to_string("mail/dashboard_restaurant_orders.html", {'order_list':order_list1})
			content_html = content_html.encode('utf-8').strip()
			test = MIMEText(content_html, 'html')
			msg.attach(test)

			server = smtplib.SMTP('smtp.gmail.com', 587)
			server.starttls()
			server.login(fromaddr, pwd)

			text = msg.as_string()

			server.sendmail(fromaddr, recipients, text)
			server.quit()

		# template = get_template("mail/dashboard_payment_orders.html")
		# logo=settings.BASE_URL
		# mail_content = template.render({"order_list":order_list,"order":order})
		# subject = "La Fiambrera - Your Payment details"
		# from_email = settings.EMAIL_HOST_USER
		# to_email = [request.user.email]
		# email = EmailMessage(subject, mail_content, from_email, to_email)
		# email.content_subtype = 'html'
		# email.send()
		fromaddr = settings.EMAIL_ADDRESS
		pwd = settings.PASSWORD
		msg = MIMEMultipart()
		msg['From'] = fromaddr
		recipients = [request.user.email]
		msg['To'] = ", ".join(recipients)

		msg['Subject'] = "La Fiambrera - Your Payment details"

		content_html = render_to_string("mail/dashboard_payment_orders.html", {"order_list":order_list,"order":order})
		content_html = content_html.encode('utf-8').strip()
		test = MIMEText(content_html, 'html')
		msg.attach(test)

		server = smtplib.SMTP('smtp.gmail.com', 587)
		server.starttls()
		server.login(fromaddr, pwd)

		text = msg.as_string()

		server.sendmail(fromaddr, recipients, text)
		server.quit()
		return render(request, self.template_name, {'order_list':order_list,'order':order})


	def get_all_orders(self, order):
		order_list = []
		delivery_datetimes = OrderItem.objects.filter(order=order)
		est = pytz.timezone('CET')
		delivery_dates = []
		for date in delivery_datetimes:
			date_cet = date.delivery_date.astimezone(est)
			date_cet = date_cet.replace(hour=0, minute=0)
			if date_cet not in delivery_dates:
				delivery_dates.append(date_cet)

		for dd in delivery_dates:
			user_orders = []
			tz_utc = pytz.timezone('UTC')
			delivery_date_start = dd.replace(hour=0, minute=0)\
				.astimezone(tz_utc)
			delivery_date_end = dd.replace(hour=23, minute=59)\
				.astimezone(tz_utc)

			u = OrderItem.objects.filter(order=order,
				order__is_archived=False,
				delivery_date__range=(delivery_date_start, delivery_date_end),
				order__u_is_paid=True)\
				.values('lunchbox__restaurant').annotate(
				available=Count('lunchbox__restaurant'))

			for uo in u:
				qset = OrderItem.objects.filter(order=order)

				u_orders = qset
				tlen=(len(u_orders)*3)+1
				user_orders.append({
					'restaurant': Restaurant.objects.get(id=uo['lunchbox__restaurant']),
					'user_orders': u_orders,
					'length_of':tlen
				})
			order_list.append({
				'date': dd,
				'orders': user_orders
			})
		return order_list



	def get_restaurant_orders(self, restaurant, order):
			order_list = []
			delivery_datetimes = orders.models.OrderItem.objects.filter(order=order,
				lunchbox__restaurant=restaurant,
				order__u_is_paid=True
			).order_by('delivery_date')\
				.values('delivery_date').distinct()

			est = pytz.timezone('CET')
			delivery_dates = []
			for date in delivery_datetimes:
				date_cet = date['delivery_date'].astimezone(est)
				date_cet = date_cet.replace(hour=0, minute=0)
				if date_cet not in delivery_dates:
					delivery_dates.append(date_cet)

			for dd in delivery_dates:
				user_orders = []
				tz_utc = pytz.timezone('UTC')
				delivery_date_start = dd.replace(hour=0, minute=0)\
					.astimezone(tz_utc)
				delivery_date_end = dd.replace(hour=23, minute=59)\
					.astimezone(tz_utc)

				u = orders.models.OrderItem.objects.filter(order=order,
					lunchbox__restaurant=restaurant,
					delivery_date__range=(delivery_date_start, delivery_date_end),
					order__is_archived=False,
					order__u_is_paid=True)\
					.values('order__user').annotate(available=Count('order__user'))
				for uo in u:
					qset = orders.models.OrderItem.objects.filter(order=order,
						delivery_date__range=(delivery_date_start,
											  delivery_date_end),
						order__user__id=uo['order__user'],
						lunchbox__restaurant=restaurant,
						order__is_archived=False,
						order__u_is_paid=True)

					u_orders = qset
					tlen=(len(u_orders)*3)+1
					user_orders.append({
						'user': User.objects.get(id=uo['order__user']),
						'user_orders': u_orders,
						'length_of':tlen
					})
				order_list.append({
					'date': dd,
					'orders': user_orders
				})
			return order_list

class ConfirmSermpaResponse(TemplateView):
	template_name = "mainapp/order_payment_confirm.html"
	template_name_wallet = "mainapp/wallet_payment_confirm.html"
	template_name_both = "mainapp/both_payment_confirm.html"
	def get(self, request, *args, **kwargs):
		order_uiid = request.GET.get('order-uuid')
		try:
			order = Order.objects.get(uuid=order_uiid)
			if order.u_is_paid:
				if 'cart' in request.session:
					del request.session['cart']
				try:
					wallet_order = WalletOrder.objects.get(order=order)
					wallet_order.status = True
					wallet_order.save()
					Wallet.objects.filter(user=wallet_order.user).update(amount='0', lafiambera_credit='0')
					order_list = self.get_all_orders(order)
					items=OrderItem.objects.filter(order=order)
					for item in items:
						order_list1 = self.get_restaurant_orders(item.lunchbox.restaurant, order)
						# template = get_template("mail/dashboard_restaurant_orders.html")
						# logo=settings.BASE_URL
						# mail_content = template.render({"order_list":order_list1})
						# subject = "La Fiambrera - New Order Placed"
						# from_email = settings.EMAIL_HOST_USER
						# to_email = [item.lunchbox.restaurant.user.email]
						# email = EmailMessage(subject, mail_content, from_email, to_email)
						# email.content_subtype = 'html'
						# email.send()

						#----------------------------New Mail Details---------------------------

						fromaddr = settings.EMAIL_ADDRESS
						pwd = settings.PASSWORD
						msg = MIMEMultipart()
						msg['From'] = fromaddr
						recipients = [item.lunchbox.restaurant.user.email]
						msg['To'] = ", ".join(recipients)

						msg['Subject'] = "La Fiambrera - New Order Placed"

						content_html = render_to_string("mail/dashboard_restaurant_orders.html", {'order_list':order_list1})
						content_html = content_html.encode('utf-8').strip()
						test = MIMEText(content_html, 'html')
						msg.attach(test)

						server = smtplib.SMTP('smtp.gmail.com', 587)
						server.starttls()
						server.login(fromaddr, pwd)

						text = msg.as_string()

						server.sendmail(fromaddr, recipients, text)
						server.quit()

					# template = get_template("mail/dashboard_payment_orders.html")
					# logo=settings.BASE_URL
					# mail_content = template.render({"order_list":order_list,"order":order})
					# subject = "La Fiambrera - Your Payment details"
					# from_email = settings.EMAIL_HOST_USER
					# to_email = [request.user.email]
					# email = EmailMessage(subject, mail_content, from_email, to_email)
					# email.content_subtype = 'html'
					# email.send()

					#----------------------------New Mail Details---------------------------

					fromaddr = settings.EMAIL_ADDRESS
					pwd = settings.PASSWORD
					msg = MIMEMultipart()
					msg['From'] = fromaddr
					recipients = [request.user.email]
					msg['To'] = ", ".join(recipients)

					msg['Subject'] = "La Fiambrera - Your Payment details"

					content_html = render_to_string("mail/dashboard_payment_orders.html", {"order_list":order_list,"order":order})
					content_html = content_html.encode('utf-8').strip()
					test = MIMEText(content_html, 'html')
					msg.attach(test)

					server = smtplib.SMTP('smtp.gmail.com', 587)
					server.starttls()
					server.login(fromaddr, pwd)

					text = msg.as_string()

					server.sendmail(fromaddr, recipients, text)
					server.quit()
					return render(request, self.template_name_both, locals())
				except WalletOrder.DoesNotExist:
					order_list = self.get_all_orders(order)
					items=OrderItem.objects.filter(order=order)
					for item in items:
						order_list1 = self.get_restaurant_orders(item.lunchbox.restaurant, order)
						# template = get_template("mail/dashboard_restaurant_orders.html")
						# logo=settings.BASE_URL
						# mail_content = template.render({"order_list":order_list1})
						# subject = "La Fiambrera - New Order Placed"
						# from_email = settings.EMAIL_HOST_USER
						# to_email = [item.lunchbox.restaurant.user.email]
						# email = EmailMessage(subject, mail_content, from_email, to_email)
						# email.content_subtype = 'html'
						# email.send()

						#----------------------------New Mail Details---------------------------

						fromaddr = settings.EMAIL_ADDRESS
						pwd = settings.PASSWORD
						msg = MIMEMultipart()
						msg['From'] = fromaddr
						recipients = [request.user.email]
						msg['To'] = ", ".join(recipients)

						msg['Subject'] = "La Fiambrera - New Order Placed"

						content_html = render_to_string("mail/dashboard_restaurant_orders.html", {"order_list":order_list1})
						content_html = content_html.encode('utf-8').strip()
						test = MIMEText(content_html, 'html')
						msg.attach(test)

						server = smtplib.SMTP('smtp.gmail.com', 587)
						server.starttls()
						server.login(fromaddr, pwd)

						text = msg.as_string()

						server.sendmail(fromaddr, recipients, text)
						server.quit()

					# template = get_template("mail/dashboard_admin_orders.html")
					# logo=settings.BASE_URL
					# mail_content = template.render({"order_list":order_list,"order":order})
					# subject = "La Fiambrera - Your Payment details"
					# from_email = settings.EMAIL_HOST_USER
					# to_email = [request.user.email]
					# email = EmailMessage(subject, mail_content, from_email, to_email)
					# email.content_subtype = 'html'
					# email.send()


					#----------------------------New Mail Details---------------------------

					fromaddr = settings.EMAIL_ADDRESS
					pwd = settings.PASSWORD
					msg = MIMEMultipart()
					msg['From'] = fromaddr
					recipients = [request.user.email]
					msg['To'] = ", ".join(recipients)

					msg['Subject'] = "La Fiambrera - Your Payment details"

					content_html = render_to_string("mail/dashboard_admin_orders.html", {"order_list":order_list,"order":order})
					content_html = content_html.encode('utf-8').strip()
					test = MIMEText(content_html, 'html')
					msg.attach(test)

					server = smtplib.SMTP('smtp.gmail.com', 587)
					server.starttls()
					server.login(fromaddr, pwd)

					text = msg.as_string()

					server.sendmail(fromaddr, recipients, text)
					server.quit()
					

					return render(request, self.template_name, locals())

		except Order.DoesNotExist:
			moneytowallet = MoneyToWallet.objects.get(uuid=order_uiid)
			payment = moneytowallet.walletpayment
			if moneytowallet.status==False:
				moneytowallet.status=True
				moneytowallet.save()
				try:
					wallet_amount = Wallet.objects.get(user=moneytowallet.user)
					wallet_amount.amount += moneytowallet.amount
					wallet_amount.lafiambera_credit += moneytowallet.lafiambera_credit
					wallet_amount.save()
				except Wallet.DoesNotExist:
					wallet_amount = Wallet.objects.create(user=moneytowallet.user,
						amount = moneytowallet.amount,
						lafiambera_credit = moneytowallet.lafiambera_credit)
				return render(request, self.template_name_wallet, locals())
			else:
				messages.error(request, _('Requested link is no more available.'))
				return	HttpResponseRedirect('/')

	def get_all_orders(self, order):
		order_list = []
		delivery_datetimes = orders.models.OrderItem.objects.filter(order=order,
			order__u_is_paid=True).order_by(
			'delivery_date').values('delivery_date').distinct()

		est = pytz.timezone('CET')
		delivery_dates = []
		for date in delivery_datetimes:
			date_cet = date['delivery_date'].astimezone(est)
			date_cet = date_cet.replace(hour=0, minute=0)
			if date_cet not in delivery_dates:
				delivery_dates.append(date_cet)

		for dd in delivery_dates:
			user_orders = []
			tz_utc = pytz.timezone('UTC')
			delivery_date_start = dd.replace(hour=0, minute=0)\
				.astimezone(tz_utc)
			delivery_date_end = dd.replace(hour=23, minute=59)\
				.astimezone(tz_utc)

			u = orders.models.OrderItem.objects.filter(order=order,
				order__is_archived=False,
				delivery_date__range=(delivery_date_start, delivery_date_end),
				order__u_is_paid=True)\
				.values('lunchbox__restaurant').annotate(
				available=Count('lunchbox__restaurant'))

			for uo in u:
				qset = orders.models.OrderItem.objects.filter(order=order,
					order__is_archived=False,
					delivery_date__range=(delivery_date_start,
										  delivery_date_end),
					lunchbox__restaurant__id=uo['lunchbox__restaurant'],
					order__u_is_paid=True)

				u_orders = qset
				tlen=(len(u_orders)*4)+1
				user_orders.append({
					'restaurant': Restaurant.objects.get(id=uo['lunchbox__restaurant']),
					'user_orders': u_orders,
					'length_of':tlen
				})
			order_list.append({
				'date': dd,
				'orders': user_orders
			})
		return order_list
	def get_restaurant_orders(self, restaurant, order):
		order_list = []
		delivery_datetimes = orders.models.OrderItem.objects.filter(order=order,
			lunchbox__restaurant=restaurant,
			order__u_is_paid=True
		).order_by('delivery_date')\
			.values('delivery_date').distinct()

		est = pytz.timezone('CET')
		delivery_dates = []
		for date in delivery_datetimes:
			date_cet = date['delivery_date'].astimezone(est)
			date_cet = date_cet.replace(hour=0, minute=0)
			if date_cet not in delivery_dates:
				delivery_dates.append(date_cet)

		for dd in delivery_dates:
			user_orders = []
			tz_utc = pytz.timezone('UTC')
			delivery_date_start = dd.replace(hour=0, minute=0)\
				.astimezone(tz_utc)
			delivery_date_end = dd.replace(hour=23, minute=59)\
				.astimezone(tz_utc)

			u = orders.models.OrderItem.objects.filter(order=order,
				lunchbox__restaurant=restaurant,
				delivery_date__range=(delivery_date_start, delivery_date_end),
				order__is_archived=False,
				order__u_is_paid=True)\
				.values('order__user').annotate(available=Count('order__user'))
			for uo in u:
				qset = orders.models.OrderItem.objects.filter(order=order,
					delivery_date__range=(delivery_date_start,
										  delivery_date_end),
					order__user__id=uo['order__user'],
					lunchbox__restaurant=restaurant,
					order__is_archived=False,
					order__u_is_paid=True)

				u_orders = qset
				tlen=(len(u_orders)*3)+1
				user_orders.append({
					'user': User.objects.get(id=uo['order__user']),
					'user_orders': u_orders,
					'length_of':tlen
				})
			order_list.append({
				'date': dd,
				'orders': user_orders
			})
		return order_list
class EveningOrders(TemplateView):
	template_name = "mainapp/checkout.html"
	def post(self, request, *args, **kwargs):
		response={}
		delivery_date = request.POST.get("delivery_date")
		print "\n\n\n",delivery_date,"\n\n\n"
		timeNow = datetime.now().time()
		max_time = datetime.strptime("12:00 PM","%I:%M %p").time()
		date_1 = datetime.strptime(delivery_date, "%Y-%m-%d").date()
		dateNow = datetime.now().date()
		if date_1 == dateNow:
			if timeNow > max_time:
				response['status'] = "timeup"
				response['msg'] = _("Oooops! You are late. No more orders for today. Please select later date.")
				delivery_date = date_1 + timedelta(days=1)

		return HttpResponse(json.dumps(response), content_type='application/json')