# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from django.contrib import messages
from django.contrib.auth import login, authenticate, logout
from django.shortcuts import render, HttpResponseRedirect
from django.views.generic import *
from userprofiles.models import *
from carthandler.models import Cart
from django.template import Context
from django.template.loader import get_template
from django.core.mail import EmailMessage
from django.conf import settings
from django.utils.translation import ugettext as _
from django.contrib.auth.models import Group,User
from django.utils import translation
import uuid
from django.http import HttpResponse
from django.conf import settings
from django.contrib.auth import authenticate,login
from mainapp.models import *
from payments.models import *
import json
from login_register.models import ForgetPassword
from django.utils.timezone import localtime
from django.views import View




class LoginView(TemplateView):
	template_name="login_register/login.html"

	

	def get(self, request, *args, **kwargs):
		return render(request, self.template_name)

	def post(self, request, *args, **kwargs):
		ema=self.request.POST.get('email')
		password=self.request.POST.get('pwd')
		response={}
		user_name=None

		find_user = User.objects.filter(email=ema)
		for users in find_user:
			try:
				profile = Profile.objects.get(user__id=users.id,accounts_status=1)
				user_name=profile.user.username
			except Profile.DoesNotExist:
				pass
		if not user_name:
			response['error']= '0'
			response['msg']= _('Incorrect email address.')
			return HttpResponse(json.dumps(response), content_type='application/json')
	
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
			if request.user.profile.is_restaurant():
				res = Restaurant.objects.get(user__id=request.user.id)
				request.session['restaurant_id']=res.id
			if 'cart' not in request.session:
				user_exist_in_cart=Cart.objects.filter(user__id=user.id)
				if user_exist_in_cart:
					request.session['cart']=user.username
			cus_id=Customer.objects.filter(user_id=user.id)
			rest_id=Restaurant.objects.filter(user_id=user.id)
			print "abc ",cus_id," rest_id ", rest_id
			if cus_id:
				response = {'custom_success': '1'}
				return HttpResponse(json.dumps(response), content_type='application/json')

			elif rest_id:
				response = {'rest_success': rest_id[0].id}
				return HttpResponse(json.dumps(response), content_type='application/json')
			else:
				response = {'error': '1'}
				return HttpResponse(json.dumps(response), content_type='application/json')
		else:
			response['error']= '0'
			response['msg']= _('Incorrect password.')
			
			return HttpResponse(json.dumps(response), content_type='application/json')


class ResetPassword(TemplateView):
	template_name="login_register/reset_password.html"

	
	def get(self, request, *args, **kwargs):
		# user_id=self.request.user_id
		user_id=kwargs['user_id']
		activation_key=kwargs['activation_key']
		fg_pwd = ForgetPassword.objects.filter(user_id=user_id, activation_key=activation_key)
		
		end_time = fg_pwd[0].end_datetime
		end_time=localtime(end_time)
		end_time=end_time.replace(tzinfo=None)
		now = datetime.datetime.now()
		now = now.replace(tzinfo=None)

		if now > end_time:
			return HttpResponse("The session has been espired. Please try again")
	
		return render(request, self.template_name, locals())

	
class ChangePassword(TemplateView):
	template_name="login_register/reset_password.html"

	def post(self, request, *args, **kwargs):
		print 'inpost'
		print request.POST
		
		passw = request.POST.get('password')
		user_id = request.POST.get('user_id')
		print passw
		try:
			user = User.objects.get(id=user_id)
			user.set_password(passw)
			user.save()
			
			messages.error(request, 'success')
			return HttpResponse('1')
		except:
			messages.error(request,'error')
			return HttpResponse('0')
		# return render(request, 'login_register/reset_password.html', locals())




		return render(request, self.template_name)
class RestaurantRegistration(TemplateView):
	template_name="login_register/reg-form.html"

	def get(self, request, *args, **kwargs):
		return render(request, self.template_name, locals())
	def post(self, request, *args, **kwargs):
		
		first_name = self.request.POST.get('restaurant_first_name')
		last_name = self.request.POST.get('restaurant_last_name')
		email = self.request.POST.get('restaurant_email')
		password1 = self.request.POST.get('restaurant_password1')
		password2 = self.request.POST.get('restaurant_password2')
		phone = self.request.POST.get('restaurant_owner_phone')
		restaurant_name =self.request.POST.get('restaurant_name')
		restaurant_address = self.request.POST.get('restaurant_address')
		# restaurant_city = form.cleaned_data.get('restaurant_city', 'Barcelona')
		# restaurant_state = form.cleaned_data.get('restaurant_state', 'Catalonia')
		restaurant_zip_code = self.request.POST.get('restaurant_zip_code')
		restaurant_phone = self.request.POST.get('restaurant_phone')
		lang_en = request.POST.get('lang')
		restaurant_country = self.request.POST.get('restaurant_country')
		restaurant_street = self.request.POST.get('restaurant_street')

		restaurant_state = self.request.POST.get('restaurant_state')
		restaurant_floor = self.request.POST.get('floor_no')
		restaurant_door = self.request.POST.get('door_number')
		try:
			user = User.objects.get(email=email)
		 	messages.error(request,'ExistsAgain')
			return HttpResponseRedirect('/login')
		except User.DoesNotExist:
			if password1 and password2 and password1 != password2:
				messages.error(request,'password_mismatch!')
				return HttpResponseRedirect('/restaurant/registration/')
			user = User.objects.create_user(
					username=email,
					email=email,
					password=password1
			)
			user.first_name = first_name
			user.last_name = last_name
			user.is_active = True
			user.save()
			group = Group.objects.get(name='Restaurant')
			group.user_set.add(user)

			profile = Profile.objects.create(user=user)
			profile.phone = phone
			profile.accounts_status=1
			if lang_en == 'en':
				profile.lang = 'en'
			else:
				profile.lang = 'es'

			profile.save()

			try:
				restaurant = Restaurant.objects.get(name=restaurant_name)
				messages.error(request,'ExistsAgain')
				return HttpResponseRedirect('/login')
			except Restaurant.DoesNotExist:
				restaurant = Restaurant.objects.create()
				restaurant.user = user
				restaurant.name = restaurant_name
				restaurant.address = restaurant_address
				# restaurant.city = restaurant_city
				# restaurant.state = restaurant_state
				restaurant.zip_code = restaurant_zip_code
				restaurant.phone = restaurant_phone
				restaurant.country = restaurant_country
				restaurant.street = restaurant_street
				restaurant.state = restaurant_state
				restaurant.floor = restaurant_floor
				restaurant.door = restaurant_door
				restaurant.save()
			
			print "user is not authenticated=",request.user
			user = authenticate(username=email, password=password1)
			if user:
				login(request, user)
				lng = user.profile.lang
				translation.activate(lng)
				request.session[translation.LANGUAGE_SESSION_KEY] = lng
				
				request.session['user_id']=user.id
				request.session['user_name']=user.username
				request.session['user_type']="Restaurant"
				request.session['restaurant_id']=restaurant.id
				
			messages.error(request,'successrestaurantregistration')

			return HttpResponseRedirect('/{}/dashboard/restaurant/{}/'.format(request.LANGUAGE_CODE,restaurant.id))


class Registration(TemplateView):
	template_name="login_register/reg-form.html"
	def get(self, request, *args, **kwargs):
		return render(request, self.template_name, locals())
	
	def post(self, request, *args, **kwargs):
		print "Enter in post"
		key = self.request.POST.get('code')
		register_type = self.request.POST.get('register_type')
		first_name = self.request.POST.get('user_first_name')
		last_name = self.request.POST.get('user_last_name')
		email = self.request.POST.get('user_email')
		password1 = self.request.POST.get('user_password1')
		password2 = self.request.POST.get('user_password2')
		phone = self.request.POST.get('user_phone')
		lang_en = self.request.POST.get('user_lang')
		user_address = self.request.POST.get('user_address')
		user_zip_code = self.request.POST.get('user_zip_code')
		user_phone = self.request.POST.get('user_phone')
		user_country = self.request.POST.get('user_country')
		user_street = self.request.POST.get('user_street')
		user_state = self.request.POST.get('user_state')
		user_city = self.request.POST.get('user_city')
		door = self.request.POST.get('user_door')
		
		building = self.request.POST.get('user_building')
		full_name = first_name+" "+last_name
		try:
			user = User.objects.get(email=email)
			messages.error(request,'AlreadyRegistered')
			return HttpResponseRedirect('/login/')
		except User.DoesNotExist:
			if password1 and password2 and password1 != password2:
				messages.error(request,'password_mismatch!')
				return HttpResponseRedirect('/restaurant/registration/')

			user = User.objects.create_user(
				username=email,
				email=email,
				password=password1
			)

			user.first_name = first_name
			user.last_name = last_name
			user.is_active = True
			
			user.save()
			group = Group.objects.get(name='Customer')
			group.user_set.add(user)
			customer = Customer.objects.create(
				user=user,
				name=full_name,
				address=user_address,
				street=building,
				city=user_city,
				state=user_state,
				country=user_country,
				zip_code=user_zip_code,
				door_num=door,
				building_num=building
				)
			customer.save()
			# activation_key = str(uuid.uuid4())[:15]

			# subject = 'La Fiambrera - Complete Activation'
			# from_email = settings.EMAIL_HOST_USER
			# to_email = [email]

			# template = get_template("activation_email.html")
			# c = {
			# 	'username': user.username,
			# 	'site': settings.BASE_URL,
			# 	'activation_key': activation_key,
			# 	'lang': lang_en,
			# }
			# mail_content = template.render(c)
			# email = EmailMessage(subject, mail_content, from_email, to_email)
			# email.content_subtype = 'html'
			# email.send()

			# code = Activation.objects.create(user=user, email=user.email, key=activation_key)
			# code.save()

			profile = Profile.objects.create(user=user, customer=customer)
			profile.phone = phone
			profile.accounts_status=1
			if lang_en == 'en':
				profile.lang = 'en'
			else:
				profile.lang = 'es'

			profile.save()
			user = authenticate(username=user.username, password=password1)
			if user:
				lng = user.profile.lang
				translation.activate(lng)
				request.session[translation.LANGUAGE_SESSION_KEY] = lng
				login(request, user)
				request.session['user_id']=user.id
				request.session['user_name']=user.username
				request.session['user_type']="Customer"
				if 'uuid' in request.session:
					try:
						invite = InviteRequest.objects.get(key=request.session['uuid'], status=True)
						reward = InviteRewards.objects.all().order_by('-id').first()
						lafia_currency = Lafiambrera_Currency.objects.all();
						inviting_user=None
						try:
							print "inviting user",invite.user
							inviting_user = User.objects.get(id=invite.user.id)
							wallet = Wallet.objects.get(user=inviting_user)
							wallet.amount +=round(reward.u_reward/lafia_currency[0].OneEuro,2)
							wallet.lafiambera_credit += round(reward.u_reward,2)
							wallet.save()
						except Wallet.DoesNotExist:
							print "inviting user create",invite.user
							Wallet.objects.create(
								user=inviting_user,
								amount=round(reward.u_reward/lafia_currency[0].OneEuro,2),
								lafiambera_credit=round(reward.u_reward,2)
								)
						except User.DoesNotExist:
							pass
						first = inviting_user.first_name.title()
						last = inviting_user.last_name.title()
						UserNotification.objects.create(user=inviting_user,
							head_en="Wallet",
							head_es="Billetera",
							msg_en="{} accepted your invitation. You got {} La-Fiambrera credit in your wallet.".format(invite.email,reward.u_reward),
							msg_es="{} aceptó su invitación. Tienes {} créditos de La-Fiambrera en tu cartera.".format(invite.email,reward.u_reward)
							)
						UserNotification.objects.create(user=request.user,
							head_en="Wallet",
							head_es="Billetera",
							msg_en="Congratualtions! You have won {} La-Fiambrera credit by using refferal code from {} {}. Invite your friends to win more credits.".format(reward.u_reward, first,last),
							msg_es="Felicitaciones! Has ganado {} crédito de La-Fiambrera usando el código de referencia de {} {}. Invita a tus amigos a ganar más créditos.".format(reward.u_reward,first,last)
							)
						print "new user",request.user
						Wallet.objects.create(
								user=request.user,
								amount=round(reward.u_reward/lafia_currency[0].OneEuro,2),
								lafiambera_credit=round(reward.u_reward,2)
								)
						InviteRequest.objects.filter(email=invite.email).delete()
						del request.session['uuid']
					except InviteRequest.DoesNotExist:
						del request.session['uuid']
			if register_type == 'checkout':
				return HttpResponseRedirect('/checkout/')
			else:
				return HttpResponseRedirect('/')
			# return render(request, 'site_message.html', {
			# 	'title': 'Thank you!',
			# 	'msg': _('Activation link has been sent to your email.')
			# })



