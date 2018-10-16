# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.views.generic import *
from django.shortcuts import render
import json
from django.http import HttpResponse
from userprofiles.models import *
from .models import *
from .serializers import *
from datetime import datetime
from django.utils.translation import ugettext as _
from mainapp.models import UserNotification

class AddToCart(TemplateView):
	template_name="mainapp/all_lunchbox.html"

	def post(self,request, *args, **kwargs):
		try:
			# d_date = self.request.POST.get("d_date")
			# d_time = self.request.POST.get("d_time")


			qty = self.request.POST.get("qty")
			l_price=0.0
			lunchbox_id = self.request.POST.get("lunchbox_id")
			str1 = ""
			# str2 = ""
			add = False
			today = datetime.now().date()
			# max_time = str(today)+' 1:00PM'
			# max_time = datetime.strptime(max_time, "%Y-%m-%d %I:%M%p")
			lunchbox = Lunchbox.objects.get(id=int(lunchbox_id))
			l_price=lunchbox.price
			if int(qty)>1:
				l_price=lunchbox.price*int(qty)
			if today < lunchbox.available_from or today > lunchbox.available_till:
				str1 = _("Sorry! This lunchbox is not available for delivery right now.")
			else:
				add = True	
			if add:
				if request.user.is_authenticated() and not request.user.profile.is_restaurant() and not request.user.profile.is_employee() and not request.user.is_staff:
					customer_user_id=request.user.id
					if 'cart' not in request.session:
						Cart.objects.filter(user=request.user).delete()
						user = User.objects.get(id=customer_user_id)
						cart = Cart.objects.create(
							user=user,
							# delivery_date = d_date,
							# delivery_time = d_time,
							total_price = l_price,
							qty = qty,
							user_status = 1,
							lunchbox_id = lunchbox_id,
							)
						cart.save()
						request.session['cart']=user.username
						cart_values = Cart.objects.filter(user=user)
						serializer = ReturnSerializer(cart_values, many=True)
						response_data = (serializer.data)
						for content in response_data:
							lb_id = ""
							for i,j in content.iteritems():
								if i == "lunchbox_id":
									lb_id = j
									break
							lb_cart = Cart.objects.get(lunchbox_id=int(lb_id),user=user)
							content['qty_discount'] = lb_cart.qtydiscount()
							content['total_amount'] = lb_cart.finalamount()
							content['total'] = lb_cart.total_price
							lb = Lunchbox.objects.get(id=int(lb_id))
							vat_amount = round((lb.price * lb.vat)/100, 2)
							t_vat_amount = round(lb_cart.qty*vat_amount, 2)
							content['vat'] = t_vat_amount
						return HttpResponse(json.dumps(response_data), content_type='application/json')
					else:
						user = User.objects.get(username=request.user.username)
						cart_value=Cart.objects.filter(user=user)
						if cart_value:
							if cart_value[0].user_status==0:
								user1 = User.objects.get(id=customer_user_id)
								cart_value.update(user=user1, user_status=1)
								User.objects.filter(username=request.session['cart']).delete()
								request.session['cart']=user1.username
								user=user1
							else:
								user = User.objects.get(id=customer_user_id)
								if request.session['cart'] != user.username:
									request.session['cart'] = user.username
						else:
							if 'cart' in request.session:
								del request.session['cart']

						
						try:
							cart = Cart.objects.get(user=user, lunchbox_id=lunchbox_id) 
							cart.total_price = cart.total_price +l_price
							cart.qty = cart.qty + int(qty)
							# i.delivery_date = d_date
							# i.delivery_time = d_time
							cart.save()	
						except Cart.DoesNotExist:
							
							cart = Cart.objects.create(
								user=user,
								# delivery_date = d_date,
								# delivery_time = d_time,
								total_price = l_price,
								qty = qty,
								user_status = 1,
								lunchbox_id = lunchbox_id,
								)
							cart.save()
						cart_values = Cart.objects.filter(user=user)
						serializer = ReturnSerializer(cart_values, many=True)
						response_data = (serializer.data)
						for content in response_data:
							lb_id = ""
							for i,j in content.iteritems():
								if i == "lunchbox_id":
									lb_id = j
									break
							lb_cart = Cart.objects.get(lunchbox_id=int(lb_id),user=user)
							content['qty_discount'] = lb_cart.qtydiscount()
							content['total_amount'] = lb_cart.finalamount()
							content['total'] = lb_cart.total_price
							lb = Lunchbox.objects.get(id=int(lb_id))
							vat_amount = round((lb.price * lb.vat)/100, 2)
							t_vat_amount = round(lb_cart.qty*vat_amount, 2)
							content['vat'] = t_vat_amount
						return HttpResponse(json.dumps(response_data), content_type='application/json')
				else:
					cartuser = None
					if 'cart' in request.session:
						cartuser = request.session['cart']
					try:
						user = User.objects.get(username=cartuser)

						
						
						try:
							cart = Cart.objects.get(user=user, lunchbox_id=lunchbox_id) 

							cart.total_price = cart.total_price + l_price
							cart.qty = cart.qty + int(qty)
							# i.delivery_date = d_date
							# i.delivery_time = d_time
							cart.save()
							

						except Cart.DoesNotExist:
							cart = Cart.objects.create(
								user=user,
								# delivery_date = d_date,
								# delivery_time = d_time,
								total_price = l_price,
								qty = qty,
								user_status = 0,
								lunchbox_id = lunchbox_id,
								)
							cart.save()
						cart_values = Cart.objects.filter(user=user)
						serializer = ReturnSerializer(cart_values, many=True)
						response_data = (serializer.data)
						for content in response_data:
							lb_id = ""
							for i,j in content.iteritems():
								if i == "lunchbox_id":
									lb_id = j
									break
							lb_cart = Cart.objects.get(lunchbox_id=int(lb_id),user=user)
							content['qty_discount'] = lb_cart.qtydiscount()
							content['total_amount'] = lb_cart.finalamount()
							content['total'] = lb_cart.total_price
							lb = Lunchbox.objects.get(id=int(lb_id))
							vat_amount = round((lb.price * lb.vat)/100, 2)
							t_vat_amount = round(lb_cart.qty*vat_amount, 2)
							content['vat'] = t_vat_amount
						return HttpResponse(json.dumps(response_data), content_type='application/json')
					except User.DoesNotExist:
						max_id = Cart.objects.all().order_by("-id")
						cartmax_id = 0
						if max_id:
							cartmax_id=max_id[0].id+1
						else:
							cartmax_id=0
						uname="guest"+str(cartmax_id)
						User.objects.filter(username=uname).delete()
						user = User.objects.create(username=uname)
						request.session['cart']=user.username
						cart = Cart.objects.create(
							user=user,
							# delivery_date = d_date,
							# delivery_time = d_time,
							total_price = l_price,
							qty = qty,
							user_status = 0,
							lunchbox_id = lunchbox_id,
							)
						cart.save()
						cart_values = Cart.objects.filter(user=user)
						serializer = ReturnSerializer(cart_values, many=True)
						response_data = (serializer.data)
						for content in response_data:
							lb_id = ""
							for i,j in content.iteritems():
								if i == "lunchbox_id":
									lb_id = j
									break
							lb_cart = Cart.objects.get(lunchbox_id=int(lb_id),user=user)
							content['qty_discount'] = lb_cart.qtydiscount()
							content['total_amount'] = lb_cart.finalamount()
							content['total'] = lb_cart.total_price
							lb = Lunchbox.objects.get(id=int(lb_id))
							vat_amount = round((lb.price * lb.vat)/100, 2)
							t_vat_amount = round(lb_cart.qty*vat_amount, 2)
							content['vat'] = t_vat_amount
						return HttpResponse(json.dumps(response_data), content_type='application/json')
			else:
				response_data = {}
				response_data['error'] = str1
				return HttpResponse(json.dumps(response_data), content_type='application/json')
		except Exception as e:
			response_data = {}
			response_data['error'] = str(e)
			return HttpResponse(json.dumps(response_data), content_type='application/json')



class ShowCart(View):
	def get(self,request, *args, **kwargs):
		
		if 'cart' not in request.session:
			if request.user.is_authenticated() and not request.user.profile.is_restaurant() and not request.user.profile.is_employee() and not request.user.is_staff:
				cart_values = Cart.objects.filter(user__id=request.user.id)
				if cart_values:
					user = User.objects.get(id=request.user.id)
					notify_qty=len(UserNotification.objects.filter(user__id=request.user.id, unread=False))
					request.session['cart'] = user.username
					serializer = ReturnSerializer(cart_values, many=True)
					response_data = (serializer.data)
					for content in response_data:
						lb_id = ""
						for i,j in content.iteritems():
							if i == "lunchbox_id":
								lb_id = j
								break
						lb_cart = Cart.objects.get(lunchbox_id=int(lb_id),user=user)
						content['qty_discount'] = lb_cart.qtydiscount()
						content['total_amount'] = lb_cart.finalamount()
						content['total'] = lb_cart.total_price
						lb = Lunchbox.objects.get(id=int(lb_id))
						vat_amount = round((lb.price * lb.vat)/100, 2)
						t_vat_amount = round(lb_cart.qty*vat_amount, 2)
						content['vat'] = t_vat_amount
					response_data.append({
						'notify_qty' : notify_qty
						})
					return HttpResponse(json.dumps(response_data), content_type='application/json')
			# notifications1 = UserNotification.objects.filter(user__id=request.user.id, unread=False)
			# for i in notifications1:
			# 	if i.cat==1:
			# 		if datetime.now().date() > i.date.date():
			# 			i.unread=True
			# 			i.save()
			notify_qty=len(UserNotification.objects.filter(user__id=request.user.id, unread=False))
			return HttpResponse(json.dumps({'notify_qty':int(notify_qty)}), content_type='application/json')
		else:
			find_user=""
			notify_qty=0
			if request.user.is_authenticated() and not request.user.profile.is_restaurant() and not request.user.profile.is_employee() and not request.user.is_staff:
				find_user=request.user.username
				# notifications1 = UserNotification.objects.filter(user__id=request.user.id, unread=False)
				# for i in notifications1:
				# 	if i.cat==1:
				# 		if datetime.now().date() > i.date.date():
				# 			i.unread=True
				# 			i.save()
				notify_qty=len(UserNotification.objects.filter(user__id=request.user.id, unread=False))
			else:
				find_user=request.session['cart']
			try:
				user = User.objects.get(username=find_user)
			except User.DoesNotExist:
				user=None
			
			cart_values = Cart.objects.filter(user__username=request.session['cart'])
			if request.user.is_authenticated() and not request.user.profile.is_restaurant() and not request.user.profile.is_employee() and not request.user.is_staff:

				if cart_values:
					for values in cart_values:
						if values.user_status==0:
							try:
								authusercart=Cart.objects.get(user__username=request.user.username,lunchbox_id=values.lunchbox_id)
								authusercart.qty +=values.qty
								authusercart.total_price += values.total_price
								authusercart.save()
								values.delete()
							except Cart.DoesNotExist:
								values.user=request.user
								values.user_status=1
								values.save()
					request.session['cart'] = request.user.username


				else:
					if 'cart' in request.session:
						del request.session['cart']

			cart_values1 = Cart.objects.filter(user=user)
			serializer = ReturnSerializer(cart_values1, many=True)
			response_data = (serializer.data)
			for content in response_data:
				lb_id = ""
				for i,j in content.iteritems():
					if i == "lunchbox_id":
						lb_id = j
						break
				
				lb_cart = Cart.objects.get(lunchbox_id=int(lb_id),user=user)
				content['qty_discount'] = lb_cart.qtydiscount()
				content['total_amount'] = lb_cart.finalamount()
				content['total'] = lb_cart.total_price
				lb = Lunchbox.objects.get(id=int(lb_id))
				vat_amount = round((lb.price * lb.vat)/100, 2)
				t_vat_amount = round(lb_cart.qty*vat_amount, 2)
				content['vat'] = t_vat_amount
			response_data.append({
						'notify_qty' : notify_qty
						})
			return HttpResponse(json.dumps(response_data), content_type='application/json')


class RemoveCartItem(TemplateView):
	template_name="mainapp/header.html"
	def post(self,request, *args, **kwargs):
		lunchbox_id = self.request.POST.get("lunchbox_id")
		response_data = {}
		user = User.objects.get(username=request.session['cart'])
		Cart.objects.filter(user=user, lunchbox_id=lunchbox_id).delete()
		cart_values = Cart.objects.filter(user=user)
		if cart_values:
			serializer = ReturnSerializer(cart_values, many=True)
			response_data = (serializer.data)
			for content in response_data:
				lb_id = ""
				for i,j in content.iteritems():
					if i == "lunchbox_id":
						lb_id = j
						break
				lb_cart = Cart.objects.get(lunchbox_id=int(lb_id),user=user)
				content['qty_discount'] = lb_cart.qtydiscount()
				content['total_amount'] = lb_cart.finalamount()
				content['total'] = lb_cart.total_price
				lb = Lunchbox.objects.get(id=int(lb_id))
				vat_amount = round((lb.price * lb.vat)/100, 2)
				t_vat_amount = round(lb_cart.qty*vat_amount, 2)
				content['vat'] = t_vat_amount
			return HttpResponse(json.dumps(response_data), content_type='application/json')
		else:
			if 'cart' in request.session:
				del request.session['cart']
			return HttpResponse(json.dumps(response_data), content_type='application/json')