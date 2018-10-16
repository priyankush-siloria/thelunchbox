# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import *
from userprofiles.models import *
from orders.models import *
from userprofiles.forms import *
from django.views.generic import *
from django.forms import inlineformset_factory, modelformset_factory, formset_factory
from datetime import datetime
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.utils.translation import ugettext as _
from django.template.loader import get_template
import json
import pytz
from django.conf import settings
from datetime import datetime
# Create your views here.
class DashboardRestaurants(TemplateView):
	template_name = "dashboard/restaurants.html"

	def get(self, request, *args, **kwargs):
		if request.user.is_authenticated() and request.user.is_staff or request.user.profile.is_employee():
			notifications_num = len(AdminNotification.objects.filter(archived=False))
			default = Restaurant.objects.filter(is_premium=False)
			if 'restaurant_id' in request.session:
				del request.session['restaurant_id']
			return render(request, self.template_name, locals())
		else:
			return HttpResponseRedirect('/')

class AdminNotifications(TemplateView):
	template_name = "dashboard/restaurant_notification.html"
	admin_template_name = "dashboard/admin_notifications.html"

	def get(self, request, *args, **kwargs):
		if request.user.is_authenticated() and request.user.profile.is_restaurant() or request.user.is_staff or request.user.profile.is_employee():

			if request.user.is_staff or request.user.profile.is_employee():
				notifications_num = len(AdminNotification.objects.filter(archived=False))
				notifications = AdminNotification.objects.filter(archived=False)
				return render(request, self.admin_template_name, locals())
			else:
				restaurant = Restaurant.objects.get(user__id=request.user.id)
				new_orders_notifications = OrderNotification.objects.filter(
					order_item__lunchbox__restaurant=restaurant, watched=False
				).order_by('-order_item__order__date')

				admin_messages = LunchboxAdminMessage.objects.filter(
						lunchbox__restaurant=restaurant,
						inc=True,
						watched=False
				)

				notifications = LunchboxFeedback.objects.filter(
						restaurant=restaurant,
						watched=False,
						inc=True
				).order_by('-datetime')


				return render(request, self.template_name, locals())
		else:
			return HttpResponseRedirect('/')

class Dashboard(TemplateView):
	template_name = "dashboard/dashboard_home.html"
	restaurant_template_name = "dashboard/restaurant_dashboard_home.html"
	def get(self, request, *args, **kwargs):
		today = datetime.now()
		print "authentication of user =",request.user.is_authenticated()
		if request.user.is_authenticated() and request.user.profile.is_restaurant():
			restaurant = Restaurant.objects.get(user__id=request.user.id)
			restaurant_opening_hours = []
			if restaurant.get_opening_hours():
				restaurant_opening_hours=restaurant.get_opening_hours()
				
			return render(request, self.restaurant_template_name, locals())
		elif request.user.is_authenticated() and request.user.is_staff or request.user.profile.is_employee():
			notifications_num = len(AdminNotification.objects.filter(archived=False))
			menu_restaurant_orders = orders.models.OrderItem.objects.filter(
				delivery_date__day=datetime.now().day,
				order__u_is_paid=True
			).values(
					'lunchbox__restaurant__id', 'lunchbox__restaurant__name', 'lunchbox__restaurant__logo').distinct()

			if kwargs.get('restaurant_id'):
				restaurant = Restaurant.objects.get(id=kwargs.get('restaurant_id'))
				o = orders.models.OrderItem.objects.filter(
					lunchbox__restaurant=restaurant,
					delivery_date__day=datetime.now().day,
					order__u_is_paid=True
				).values('lunchbox__id').distinct()
				order_list = []
				for k in o:
					order_list.append(Lunchbox.objects.get(id=int(k['lunchbox__id'])))
				today_orders = orders.models.OrderItem.objects.filter(
					lunchbox__restaurant=restaurant,
					delivery_date__day=datetime.now().day,
					order__u_is_paid=True
				)
			return render(request, self.template_name, locals())
		else:
			return HttpResponseRedirect('/')


class DashboardOrders(TemplateView):
	template_name = "dashboard/order.html"

	def get(self, request, *args, **kwargs):
		if request.user.is_authenticated():
			orders1=""
			if request.user.profile.is_restaurant():
				restaurant = Restaurant.objects.get(user__id=request.user.id)
				orders1 = OrderItem.objects.filter(lunchbox__restaurant=restaurant).order_by('-delivery_date')
				
			if request.user.is_staff or request.user.profile.is_employee():
				notifications_num = len(AdminNotification.objects.filter(archived=False))
				orders1 = OrderItem.objects.all().order_by('-delivery_date')
			for o in orders1:
				print o.delivery_date
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
			return HttpResponseRedirect('/')
#.exclude(alias__isnull=True).exclude(alias__exact='')

class DashboardBilling(TemplateView):
	template_name = "dashboard/billing.html"

	def get(self, request, *args, **kwargs):
		if request.user.is_authenticated() and request.user.profile.is_restaurant() or request.user.is_staff or request.user.profile.is_employee():
			user = User.objects.get(id=request.user.id)
			notifications_num = len(AdminNotification.objects.filter(archived=False))

			if not request.user.is_staff and not request.user.profile.is_employee():
				restaurant = Restaurant.objects.get(user__id=request.user.id)
				billing_opened = OrderItem.objects.filter(
						Q(is_processed=False) &
						Q(order__u_is_paid=True) &
						Q(lunchbox__restaurant=restaurant)
				)
				billing_user_processing = OrderItem.objects\
					.filter(
						is_processed=True,
						is_payment_transferred=False,
						lunchbox__restaurant=restaurant)
				billing_restaurant_processing = OrderItem.objects\
					.filter(
						Q(is_payment_transferred=True) &
						Q(lunchbox__restaurant=restaurant))
			else:
				billing_opened =OrderItem.objects.filter(
						Q(is_processed=False) &
						Q(order__u_is_paid=True)
				)
				billing_user_processing = OrderItem.objects\
					.filter(
						is_processed=True,
						is_payment_transferred=False)
				billing_restaurant_processing = OrderItem.objects\
					.filter(is_payment_transferred=True)
				page = self.request.GET.get('page', 1)
				
				billing_opened = Paginator(billing_opened, 5)
				billing_user_processing = Paginator(billing_user_processing, 3)
				billing_restaurant_processing = Paginator(billing_restaurant_processing, 3)
				try:
					billing_opened = billing_opened.page(page)
				except PageNotAnInteger:
					billing_opened = billing_opened.page(1)
				except EmptyPage:
					billing_opened = billing_opened.page(billing_opened.num_pages)
				try:
					billing_user_processing = billing_user_processing.page(page)
				except PageNotAnInteger:
					billing_user_processing = billing_user_processing.page(1)
				except EmptyPage:
					billing_user_processing = billing_user_processing.page(billing_user_processing.num_pages)
				try:
					billing_restaurant_processing = billing_restaurant_processing.page(page)
				except PageNotAnInteger:
					billing_restaurant_processing = billing_restaurant_processing.page(1)
				except EmptyPage:
					billing_restaurant_processing = billing_restaurant_processing.page(billing_restaurant_processing.num_pages)
			return render(request, self.template_name, locals())


class DashboardRestaurant(TemplateView):
	template_name = "dashboard/edit_restaurant.html"
	ImagesFormset = inlineformset_factory(
		Restaurant, RestaurantImage, form=LunchboxImageForm,
		fields='__all__', extra=5, max_num=5
	)
	ShiftsFormset = formset_factory(ShiftForm, formset=ShiftsFormSet)
	def get_restaurant_delivery_distance(self, restaurant):
		restaurant_delivery = []
		cities = City.objects.all()
		delivery = RestaurantDelivery.objects.filter(restaurant=restaurant,
													 possible=True)
		for c in cities:
			if delivery.filter(city=c):
				restaurant_delivery.append({'city': c, 'possible': True})
			else:
				restaurant_delivery.append({'city': c, 'possible': False})
		return restaurant_delivery
	def get(self, request, *args, **kwargs):
		print "\n\nenter\n\n",request.user.id
		if request.user.is_authenticated() and \
			request.user.profile.is_restaurant() or \
				request.user.is_staff or request.user.profile.is_employee():
			user = User.objects.get(id=request.user.id)
			notifications_num = len(AdminNotification.objects.filter(
				archived=False))

			if kwargs.get('restaurant_id'):
				restaurant = Restaurant.objects.get(id=kwargs.get(
					'restaurant_id'))
				is_restaurant_links = True
			else:
				restaurant = Restaurant.objects.get(user__id=request.user.id)

			# edit_form = RestaurantEditForm(instance=restaurant)
			images_formset = self.ImagesFormset(instance=restaurant)
			discount_formset = Restaurant.objects.filter(name=restaurant)
			discount_formset1=RestaurantDiscountCoupon.objects.filter(restaurant=restaurant)

			shift_dict = restaurant.shifts.all().values()
			exist_day=[]
			day_dic=['Sun','Mon','Tue','Wed','Thu','Fri','Sat']
			shift_dict1 =restaurant.shifts.all()
			for i in shift_dict1:
				exist_day.append(i.week_day)
				
			shift_dict = list(shift_dict)
			opening_hours_formset = self.ShiftsFormset(
				initial=shift_dict)
			restaurant_delivery = self.get_restaurant_delivery_distance(
				restaurant)
			request.session['restaurant_id'] = restaurant.id
			return render(request, self.template_name, locals())
		else:
			return HttpResponseRedirect('/')


	def post(self, request, *args, **kwargs):
		if request.user.is_authenticated() and \
			request.user.profile.is_restaurant() or \
			request.user.is_staff or request.user.profile.is_employee():

			

			selected = json.loads(request.POST.get("deliver_cities_array_value"))
			shifts = json.loads(request.POST.get("shifts_array_value"))
			
			discount_start_date = request.POST.get("discount_start_date")
			discount_end_date = request.POST.get("discount_end_date")
			res_discount_text = request.POST.get("res_dis_text")
			discountp = request.POST.get("discountp")
			discountp = float(discountp)
			res_desc = request.POST.get("res_desc")
			res_desc_es = request.POST.get("res_desc_es")
			discount_start_time = request.POST.get("discount_start_time")
			discount_end_time = request.POST.get("discount_end_time")
			# selected = json.loads(request.POST.get("selected"))
			photoshoot = request.POST.get("photoshoot")
			address = request.POST.get("address")
			phone = request.POST.get("phone")
			email = request.POST.get("contact_email")
			website = request.POST.get("website")
			facebook = request.POST.get("facebook")

			twitter = request.POST.get("twitter")
			instagram = request.POST.get("instagram")
			restaurent_id = kwargs.get('restaurant_id')
			min_order = request.POST.get("min_order")
			min_order = int(min_order)
			if photoshoot == "on":
				photoshoot = True
			else:
				photoshoot = False

			#-----------------Extara Variable for Add new restuarant-------------------------

			res_name = request.POST.get("res_name")

			# -------------------------Update data in restaurant table-----------------
			restaurant1 = Restaurant.objects.filter(
					id=kwargs.get('restaurant_id'))
			restaurant1.update(desc=res_desc,
				desc_es=res_desc_es,
				phone=phone,
				address=address,
				website=website,
				facebook=facebook,
				twitter=twitter,
				instagram=instagram,
				photoshoot_requested=photoshoot,
				min_order=min_order)

			user_id = restaurant1[0].user.id
			User.objects.filter(id=user_id).update(email=email)

			if kwargs.get('restaurant_id'):
				restaurant = Restaurant.objects.get(
					id=kwargs.get('restaurant_id'))
			else:
				restaurant = Restaurant.objects.get(user__id=request.user.id)

			restaurant_image = RestaurantImage.objects.filter(restaurant=restaurant)
			if restaurant_image:
				
				for filename, file in request.FILES.iteritems():
					if str(filename) == 'myfile':
						for f in request.FILES.getlist('myfile'):
							RestaurantImage.objects.create(restaurant=restaurant,
								image=f)
					else:
						str1 = str(filename)
						index_of_m = str1.find('m')
						if index_of_m != -1 and index_of_m > 0:
							key_name = str1[index_of_m:]
							image_id = str1[:-len(key_name)]
							add_image = RestaurantImage.objects.get(id=int(image_id))
							add_image.image = file
							add_image.save()
			else:
				for f in request.FILES.getlist('myfile'):
					RestaurantImage.objects.create(restaurant=restaurant,
						image=f)
			if 'logo'in request.FILES:
				restaurant = Restaurant.objects.get(id=kwargs.get('restaurant_id'))
				restaurant.logo = request.FILES['logo']
				restaurant.save()
			# -----------------Update delivery cities for restaurant------------------
			if selected:
				RestaurantDelivery.objects.filter(restaurant=restaurant).delete()
				for k in selected:
					RestaurantDelivery.objects.create(
						restaurant=restaurant, city=City.objects.get(id=int(k)),
						possible=True)
			
			# -------------------------Update shift table---------------
			if shifts:
				restaurant.shifts.all().delete()
				for shift in shifts:
					Shift.objects.create(
						start=shift['from'],
						week_day=shift['day'],
						end=shift['till'], restaurant=restaurant)
			# ---------------------Photoshoot requested-------------------
			if photoshoot:
				notification = AdminNotification.objects.get_or_create(
					lunchbox=None, restaurant=restaurant)
				if notification[1]:
					notification[0].save()
			else:
				notification = AdminNotification.objects.filter(
					restaurant=restaurant)
				if notification:
					notification[0].delete()
			# ------------------Restaurant Discount Coupan----------------------
			res_discount_coupan = RestaurantDiscountCoupon.objects.filter(restaurant=restaurant)
			if res_discount_coupan:
				res_discount_coupan.update(
					available_from=discount_start_date,
					available_till=discount_end_date,
					time_from=discount_start_time,
					time_till=discount_start_time,
					discount_text=res_discount_text,
					percent=discountp)
			else:
				RestaurantDiscountCoupon.objects.create(
					restaurant=restaurant,
					available_from=discount_start_date,
					available_till=discount_end_date,
					time_from=discount_start_time,
					time_till=discount_start_time,
					discount_text=res_discount_text,
					percent=discountp)
			
			days_in_week={}
			opening_hours=restaurant.shifts.all()
			for shift_time in opening_hours:
				start_time=shift_time.start.strftime('%H:%M')
				end_time=shift_time.end.strftime('%H:%M')

				days_in_week.setdefault(shift_time.get_week_day_display(), []).append(start_time+"-"+end_time)
				# if count==1:
				# 	info += shift_time.week_day+" "+str(shift_time.start)+" "+str(shift_time.end)
				# else:
				# 	info +="<br> "+shift_time.week_day+" "+str(shift_time.start)+" "+str(shift_time.end)
				# count=count+1
			info=""
			count=1
			print days_in_week
			for week,time in days_in_week.iteritems():
				if count==1:
					info +=str(week)+" "
					for times in time:
						info +=str(times)+", "
					info=info[:-2]
				else:
					info +="<br>"+str(week)+" "
					for times in time:
						info +=str(times)+", "
					info=info[:-2]
				count=count+1
			rest=Restaurant.objects.get(id=restaurant.id)
			rest.opening_hours=info
			rest.save()
			request.session['restaurant_id'] = restaurant.id
			if request.user.is_staff or request.user.profile.is_employee():
				return HttpResponseRedirect('/{}/dashboard/restaurants/'.format(request.LANGUAGE_CODE))
			else:
				return HttpResponseRedirect('/{}/dashboard'.format(request.LANGUAGE_CODE))


class DashboardAddRestaurant(TemplateView):
	template_name = "dashboard/add_restaurant.html"

	def get_restaurant_delivery_distance(self):
		restaurant_delivery = []
		cities = City.objects.all()
		for c in cities:
			restaurant_delivery.append({'city': c, 'possible': False})
		return restaurant_delivery
	def get(self, request, *args, **kwargs):
		if request.user.is_authenticated() and \
				request.user.is_staff or request.user.profile.is_employee():

			notifications_num = len(AdminNotification.objects.filter(
				archived=False))
			exist_day=[]
			day_dic=['Mon','Tue','Wed','Thu','Fri','Sat','Sun']

			restaurant_delivery = self.get_restaurant_delivery_distance()
			return render(request, self.template_name, locals())
		else:
			return HttpResponseRedirect('/')

	def post(self, request):
		email = self.request.POST.get('res_email')
		restaurant_name =self.request.POST.get('res_name')
		restaurant_desc =self.request.POST.get('res_desc')
		restaurant_address = self.request.POST.get('res_address')
		restaurant_zip_code = self.request.POST.get('res_zip_code')
		restaurant_phone = self.request.POST.get('res_phone')
		restaurant_country = self.request.POST.get('res_country')
		restaurant_street = self.request.POST.get('res_street')
		restaurant_state = self.request.POST.get('res_state')
		discount_time_from = self.request.POST.get('datetimepicker1')
		discount_time_end = self.request.POST.get('datetimepicker2')
		discount_date_from = self.request.POST.get('datetimepicker3')
		discount_date_end = self.request.POST.get('datetimepicker4')
		discount_text = self.request.POST.get('res_dis_text')
		discount_persent = self.request.POST.get('discountp')
		facebook = self.request.POST.get('facebook')
		website = self.request.POST.get('website')
		instagram = self.request.POST.get('instagram')
		twitter = self.request.POST.get('twitter')
		min_order = self.request.POST.get('res_min_order')
		phone = restaurant_phone
		return HttpResponseRedirect('/dashboard/restaurants/')


class LunchboxManagement(TemplateView):
	template_name = "dashboard/lunchbox_management.html"

	def get(self, request, *args, **kwargs):
		restaurant = Restaurant.objects.get(id=kwargs.get('restaurant_id'))
		categories = Category.objects.all()
		archieved_lunchboxes = Lunchbox.objects.filter(restaurant=restaurant, available_till__lt=datetime.now())
		saved_lunchboxes = Lunchbox.objects.filter(restaurant=restaurant, published=False,available_till__gte=datetime.now())
		published_lunchboxes = Lunchbox.objects.filter(restaurant=restaurant, published=True, available_till__gte=datetime.now())
		return render(request, self.template_name, locals())

	def post(self, request, *args, **kwargs):
		#--------------------Add new lunchbox--------------------
		name_of_box =self.request.POST.get('name_of_box')
		box_name_desc =self.request.POST.get('box_name_desc')
		box_name_desc_es =self.request.POST.get('box_name_desc_es')
		available_from =self.request.POST.get('available_from')
		available_till =self.request.POST.get('available_till')
		fat =self.request.POST.get('fat')
		protein =self.request.POST.get('protein')
		sugar =self.request.POST.get('sugar')
		carbo =self.request.POST.get('carbo')
		sodium =self.request.POST.get('sodium')
		lunchbox_price =self.request.POST.get('lunchbox_price')
		lafia_lunchbox_price =self.request.POST.get('lafia_lunchbox_price')
		vat =self.request.POST.get('vat')
		discount_percent1 =self.request.POST.get('discount_percent1')
		discount_percent2 =self.request.POST.get('discount_percent2')
		discount_percent3 =self.request.POST.get('discount_percent3')
		discount_qty1 =self.request.POST.get('discount_qty1')
		discount_qty2 =self.request.POST.get('discount_qty2')
		discount_qty3 =self.request.POST.get('discount_qty3')
		photoshoot =self.request.POST.get('photoshoot')
		publishing =self.request.POST.get('publishing')
		photoshoot_done =self.request.POST.get('photoshoot_done')
		lunchbox_published =self.request.POST.get('lunchbox_published')
		category =self.request.POST.get('category')
		if photoshoot=='on':
			photoshoot=True
		else:
			photoshoot=False

		if publishing=='on':
			publishing=True
		else:
			publishing=False
		if lunchbox_published=='on':
			lunchbox_published=True
		else:
			lunchbox_published=False
		if photoshoot_done=='on':
			photoshoot_done=True
		else:
			photoshoot_done=False



		restaurant = Restaurant.objects.get(
					id=kwargs.get('restaurant_id'))

		categories = Category.objects.get(slug=category)
		lunchbox = Lunchbox.objects.create(restaurant=restaurant,
			name=name_of_box,
			desc_en=box_name_desc,
			desc_es=box_name_desc_es,
			available_from=available_from,
			available_till=available_till,
			fat=fat,
			vat=vat,
			protein=protein,
			sugar=sugar,
			carbohydrates=carbo,
			sodium=sodium,
			price=lunchbox_price,
			rate=lafia_lunchbox_price,
			photoshoot_requested=photoshoot,
			publishing_requested=publishing,
			published=lunchbox_published,
			category=categories)


		for f in request.FILES.getlist('myfile'):
			print f
			LunchboxImage.objects.create(lunchbox=lunchbox,
				image=f)
		if discount_percent1:
			LunchboxDiscount.objects.create(lunchbox=lunchbox,
				percent=discount_percent1,
				qty=int(discount_qty1))
		if discount_percent2:
			LunchboxDiscount.objects.create(lunchbox=lunchbox,
				percent=discount_percent2,
				qty=int(discount_qty2))
		if discount_percent3:
			LunchboxDiscount.objects.create(lunchbox=lunchbox,
				percent=discount_percent3,
				qty=int(discount_qty3))
		if lunchbox.photoshoot_requested or lunchbox.publishing_requested:
			notification = AdminNotification.objects.create(lunchbox=lunchbox)
			notification.save()
		return HttpResponseRedirect('/dashboard/lunchbox/management/{}'.format(restaurant.id))




class EditLunchbox(TemplateView):
	template_name = "dashboard/edit_lunchbox.html"
	ImageFormset = inlineformset_factory(Lunchbox, LunchboxImage, max_num=5, extra=5, fields='__all__', form=LunchboxImageForm)
	def get(self, request, *args, **kwargs):
		id_r =kwargs.get('restaurant_id')
		id_l =kwargs.get('lunchbox_id')
		notifications_num = len(AdminNotification.objects.filter(archived=False))
		restaurant = Restaurant.objects.get(id=kwargs.get('restaurant_id'))
		categories = Category.objects.all()
		archieved_lunchboxes = Lunchbox.objects.filter(restaurant=restaurant, available_till__lt=datetime.now())
		saved_lunchboxes = Lunchbox.objects.filter(restaurant=restaurant, published=False,available_till__gte=datetime.now())
		published_lunchboxes = Lunchbox.objects.filter(restaurant=restaurant, published=True, available_till__gte=datetime.now())
		lunchbox = Lunchbox.objects.get(id=kwargs.get('lunchbox_id'))
		images_formset = self.ImageFormset(instance=lunchbox)
		return render(request, self.template_name, locals())

	def post(self, request, *args, **kwargs):
		#--------------------Add new lunchbox--------------------
		name_of_box =self.request.POST.get('name_of_box')
		box_name_desc =self.request.POST.get('box_name_desc')
		box_name_desc_es =self.request.POST.get('box_name_desc_es')
		available_from =self.request.POST.get('available_from')
		available_till =self.request.POST.get('available_till')
		fat =self.request.POST.get('fat')
		protein =self.request.POST.get('protein')
		sugar =self.request.POST.get('sugar')
		carbo =self.request.POST.get('carbo')
		sodium =self.request.POST.get('sodium')
		lunchbox_price =self.request.POST.get('lunchbox_price')
		lafia_lunchbox_price =self.request.POST.get('lafia_lunchbox_price')
		vat =self.request.POST.get('vat')
		discount_percent1 =self.request.POST.get('discount_percent1')
		discount_percent2 =self.request.POST.get('discount_percent2')
		discount_percent3 =self.request.POST.get('discount_percent3')
		discount_qty1 =self.request.POST.get('discount_qty1')
		discount_qty2 =self.request.POST.get('discount_qty2')
		discount_qty3 =self.request.POST.get('discount_qty3')
		photoshoot =self.request.POST.get('photoshoot')
		publishing =self.request.POST.get('publishing')
		photoshoot_done =self.request.POST.get('photoshoot_done')
		lunchbox_published =self.request.POST.get('lunchbox_published')
		category =self.request.POST.get('category')
		if photoshoot=='on':
			photoshoot=True
		else:
			photoshoot=False

		if publishing=='on':
			publishing=True
		else:
			publishing=False
		if lunchbox_published=='on':
			lunchbox_published=True
		else:
			lunchbox_published=False
		if photoshoot_done=='on':
			photoshoot_done=True
		else:
			photoshoot_done=False



		restaurant = Restaurant.objects.get(
					id=kwargs.get('restaurant_id'))

		categories = Category.objects.get(slug=category)
		try:
			lunchbox = Lunchbox.objects.get(id=kwargs.get('lunchbox_id'))
			lunchbox.name=name_of_box
			lunchbox.desc_en=box_name_desc
			lunchbox.desc_es=box_name_desc_es
			lunchbox.available_from=available_from
			lunchbox.available_till=available_till
			lunchbox.fat=fat
			lunchbox.vat=vat
			lunchbox.protein=protein
			lunchbox.sugar=sugar
			lunchbox.carbohydrates=carbo
			lunchbox.sodium=sodium
			lunchbox.price=lunchbox_price
			lunchbox.rate=lafia_lunchbox_price
			lunchbox.photoshoot_requested=photoshoot
			lunchbox.publishing_requested=publishing
			lunchbox.published=lunchbox_published
			lunchbox.category=categories
			lunchbox.save()

			lunchbox_image = LunchboxImage.objects.filter(lunchbox=lunchbox)
			if lunchbox_image:
				for filename, file in request.FILES.iteritems():
					if str(filename) == 'myfile':
						for f in request.FILES.getlist('myfile'):
							LunchboxImage.objects.create(lunchbox=lunchbox,
								image=f)
					else:
						str1 = str(filename)
						index_of_m = str1.find('m')
						if index_of_m != -1 and index_of_m > 0:
							key_name = str1[index_of_m:]
							image_id = str1[:-len(key_name)]
							add_image = LunchboxImage.objects.get(id=int(image_id))
							add_image.image = file
							add_image.save()
			else:
				for f in request.FILES.getlist('myfile'):
					LunchboxImage.objects.create(lunchbox=lunchbox,
						image=f)
			LunchboxDiscount.objects.filter(lunchbox=lunchbox).delete()
			if discount_percent1:
				LunchboxDiscount.objects.create(lunchbox=lunchbox,
					percent=discount_percent1,
					qty=discount_qty1)
			if discount_percent2:
				LunchboxDiscount.objects.create(lunchbox=lunchbox,
					percent=discount_percent2,
					qty=discount_qty2)
			if discount_percent3:
				LunchboxDiscount.objects.create(lunchbox=lunchbox,
					percent=discount_percent3,
					qty=discount_qty3)
			AdminNotification.objects.filter(lunchbox=lunchbox).delete()
			if lunchbox.photoshoot_requested or lunchbox.publishing_requested:
				notification = AdminNotification.objects.create(lunchbox=lunchbox)
				notification.save()
		except Lunchbox.DoesNotExist:
			lunchbox = Lunchbox.objects.create(restaurant=restaurant,
				name=name_of_box,
				desc_en=box_name_desc,
				desc_es=box_name_desc_es,
				available_from=available_from,
				available_till=available_till,
				fat=fat,
				protein=protein,
				sugar=sugar,
				carbohydrates=carbo,
				sodium=sodium,
				price=lunchbox_price,
				rate=lafia_lunchbox_price,
				photoshoot_requested=photoshoot,
				publishing_requested=publishing,
				published=lunchbox_published,
				category=categories)


			for f in request.FILES.getlist('myfile'):
				LunchboxImage.objects.create(lunchbox=lunchbox,
					image=f)
			if discount_percent1:
				LunchboxDiscount.objects.create(lunchbox=lunchbox,
					percent=discount_percent1,
					qty=int(discount_qty1))
			if discount_percent2:
				LunchboxDiscount.objects.create(lunchbox=lunchbox,
					percent=discount_percent2,
					qty=int(discount_qty2))
			if discount_percent3:
				LunchboxDiscount.objects.create(lunchbox=lunchbox,
					percent=discount_percent3,
					qty=int(discount_qty3))
			if lunchbox.photoshoot_requested or lunchbox.publishing_requested:
				notification = AdminNotification.objects.create(lunchbox=lunchbox)
				notification.save()
		return HttpResponseRedirect('/dashboard/lunchbox/management/{}'.format(restaurant.id))

class DuplicateLunchbox(RedirectView):
	def get(self, request, *args, **kwargs):
		if request.user.is_authenticated():
			user = User.objects.get(id=request.user.id)
			if user.profile.is_restaurant() or request.user.is_staff:
				try:

					lb = Lunchbox.objects.get(id=kwargs['box_id'])
					lb.available_from = None
					lb.available_till = None
					discounts = LunchboxDiscount.objects.filter(lunchbox=lb)

					lb.pk = None
					lb.id = None
					lb.save()

					for d in discounts:
						d.pk = None
						d.id = None
						d.lunchbox = lb
						d.save()
					return HttpResponseRedirect('/dashboard/lunchbox/management/{}/edit/{}/'.format(request.session['restaurant_id'],lb.id))
				except Lunchbox.DoesNotExist:
					pass

		return HttpResponseRedirect('/dashboard/lunchbox/management/{}'.format(request.session['restaurant_id']))


class DeleteLunchbox(RedirectView):
	def get(self, request, *args, **kwargs):
		if request.user.is_authenticated():
			user = User.objects.get(id=request.user.id)
			if user.profile.is_restaurant() or request.user.is_staff or request.user.profile.is_employee():
				if not request.user.is_staff:
					restaurant = Restaurant.objects.get(user=user)
					try:
						lunchbox = Lunchbox.objects.get(id=kwargs.get('id'), restaurant=restaurant)
						try:
							notification = AdminNotification.objects.get(lunchbox=lunchbox)
							notification.delete()
						except AdminNotification.DoesNotExist:
							pass
						lunchbox.delete()

					except Lunchbox.DoesNotExist:
						return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
				else:
					Lunchbox.objects.get(id=kwargs.get('id')).delete()
		return HttpResponseRedirect(request.META.get('HTTP_REFERER'))



class OrderDetail(TemplateView):
	template_name = "dashboard/order_detail.html"
	def get(self, request, *args, **kwargs):
		item_id = kwargs.get('id')
		if request.user.is_authenticated() and request.user.profile.is_restaurant() or request.user.profile.is_employee() or request.user.is_staff:	
			notifications_num = len(AdminNotification.objects.filter(archived=False))
			order_list = self.get_all_orders(item_id)
			if request.user.profile.is_restaurant():
				restaurant=Restaurant.objects.get(user=request.user)
			return render(request, self.template_name, locals())
		else:
			return HttpResponseRedirect('/')

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
			print "\n\n\n",dd,"\n\n\n"
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


class DashboardSetOrderStatus(RedirectView):
	def post(self, request, *args, **kwargs):
		if request.user.is_authenticated() and \
				request.user.profile.is_restaurant() or request.user.is_staff:
			order_item_id = request.POST.get('order_item_id')
			status = int(request.POST.get('status'))
			data = {}

			order_item = orders.models.OrderItem.objects.filter(
				id=order_item_id)

			if order_item:
				action_datetime = timezone.now()
				action_datetime = action_datetime.astimezone(
					pytz.timezone('CET'))

				if status == 1:
					order_item[0].is_processed = not order_item[0].is_processed
					order_item[0].processed_date = action_datetime
				elif status == 2:
					order_item[0].is_payment_requested = \
						not order_item[0].is_payment_requested
					order_item[0].payment_request_date = action_datetime

				if request.user.is_staff:
					if status == 3:
						order_item[0].is_confirmed_by_lf = \
							not order_item[0].is_confirmed_by_lf
						order_item[0].confirmation_by_lf_date = action_datetime
					elif status == 4:
						order_item[0].is_payment_transferred = \
							not order_item[0].is_payment_transferred
						order_item[0].payment_transfer_date = action_datetime

				order_item[0].save()
				data['status'] = _('success')
				data['msg'] = _('Status changed successfully')
				data['date'] = action_datetime.strftime("%Y.%b %d")
			else:
				data['status'] = _('fail')
				data['msg'] = _('Order item not found')

			return HttpResponse(json.dumps({'data': data}),
								content_type="application/json")
		else:
			return HttpResponse(json.dumps('user is not authenticated'),
								content_type="application/json")

class ArchiveNotification(RedirectView):
	msg = ""

	def post(self, request, *args, **kwargs):
		if not request.user.is_authenticated() and not request.user.profile.is_restaurant():
			msg = "User is not authenticated!"
		else:
			uid = request.POST.get('uid')
			mid = request.POST.get('mid')
			lb_msg_type = int(request.POST.get('lb_msg_type'))
			print uid
			print mid
			print lb_msg_type
			if request.user.is_staff:
				try:
					notification = AdminNotification.objects.get(id=mid)

					if notification.restaurant is not None:
						notification.restaurant.photoshoot_requested = False
						notification.restaurant.save()
						notification.delete()
					else:
						notification.archived = True
						notification.save()

					status = "Success!"
					msg = _("Action Successful")
				except AdminNotification.DoesNotExist:
					status ="error"
					msg = _("Some Error Occur")
			else:
				if lb_msg_type == 1:
					try:
						notification = LunchboxAdminMessage.objects.get(id=mid)
						notification.watched = True
						notification.save()
						status = "Success!"
						msg = _("Action Successful")
					except LunchboxAdminMessage.DoesNotExist:
						status = "error"
						msg = _("Some Error Occur")
				elif lb_msg_type == 0:
					try:
						msg = LunchboxFeedback.objects.get(id=mid, user=User.objects.get(id=uid),
														   restaurant=Restaurant.objects.get(
																   user=User.objects.get(id=request.user.id)))
						msg.watched = True
						msg.save()
						status = "Success!"
						msg = _("Action Successful")
					except LunchboxFeedback.DoesNotExist:
						status = "error"
						msg =_("Some Error Occur")
				elif lb_msg_type == 2:
					try:
						notification = OrderNotification.objects.get(id=mid)
						notification.watched = True
						notification.save()
						status = "Success!"
						msg = _("Action Successful")
					except OrderNotification.DoesNotExist:
						status ="error"
						msg = _("Some Error Occur")

		return HttpResponse(json.dumps(
				{
					'msg': msg,
					'status':status,
				}), content_type="application/json"
		)


class SetMsgPriority(RedirectView):
	def post(self, request, *args, **kwargs):
		if request.user.is_authenticated() and request.user.profile.is_restaurant() or request.user.is_staff:
			msg_id = request.POST.get('msg_id')
			user_id = request.POST.get('idd')
			priority = request.POST.get('priority')
			lb_msg_type = int(request.POST.get('lb_msg_type'))
			print "msg_id ",msg_id
			print "user_id ",user_id
			print "priority ",priority
			data = {}

			if request.user.is_staff or request.user.profile.is_employee():
				try:
					notification = AdminNotification.objects.get(id=msg_id)
					notification.priority = priority
					notification.save()
					data['msg'] = _('Action Sucessful')
					data['status'] = "success"
				except AdminNotification.DoesNotExist:
					data['msg'] = 'Action Fail'
					data['status'] = _("Some Error Occur")
			else:
				restaurant_user=int(request.user.id)
				restaurant = Restaurant.objects.get(user__id=restaurant_user)

				if lb_msg_type == 1:
					try:
						msg = LunchboxAdminMessage.objects.get(id=msg_id)
						msg.priority = priority
						msg.save()
						data['msg'] = _('Action Sucessful')
						data['status'] = "success"
					except LunchboxFeedback.DoesNotExist:
						data['msg'] = 'Action Fail'
						data['status'] = _("Some Error Occur")
				elif lb_msg_type == 0:
					try:
						msg = LunchboxFeedback.objects.get(id=msg_id, restaurant=restaurant,
														   user=User.objects.get(id=user_id))
						msg.priority = priority
						msg.save()
						data['msg'] = _('Action Sucessful')
						data['status'] = "success"
					except LunchboxFeedback.DoesNotExist:
						data['msg'] = 'Action Fail'
						data['status'] = _("Some Error Occur")
				elif lb_msg_type == 2:
					try:
						notification = OrderNotification.objects.get(id=msg_id)
						notification.priority = priority
						notification.save()
						data['msg'] = _('Action Sucessful')
						data['status'] = "success"
					except OrderNotification.DoesNotExist:
						data['msg'] = 'Action Fail'
						data['status'] = _("Some Error Occur")
						

			return HttpResponse(json.dumps({'data': data}), content_type="application/json")
		else:
			return HttpResponse(json.dumps('user is not authenticated'), content_type="application/json")



class DashboardGetTable(TemplateView):
	template_name = "dashboard/admin_dashboard.html"
	def get(self, request, *args, **kwargs):
		test=request.GET.get("t")
		restaurant_id=request.GET.get("id")
		restaurant = Restaurant.objects.get(id=restaurant_id)
		o = orders.models.OrderItem.objects.filter(
			lunchbox__restaurant=restaurant,
			delivery_date__day=datetime.now().day,
			order__u_is_paid=True
		).values('lunchbox__id').distinct()
		order_list = []
		dict1={}
		image_no=[]
		for k in o:
			order_list.append(Lunchbox.objects.get(id=int(k['lunchbox__id'])))

		today_orders = orders.models.OrderItem.objects.filter(
			lunchbox__restaurant=restaurant,
			delivery_date__day=datetime.now().day,
			order__u_is_paid=True
		)
		list1 = [1,2,3,4]
		for i in today_orders:
			number_of = len(i.lunchbox.get_images())
			if number_of > 0 and number_of < 5:
				required_image = 5 - number_of
				for j in range(1,required_image+1,1):
					image_no.append(j)
			dict1[i.lunchbox.id]= image_no
			image_no=[]
		
		print "\n\n number of image\n",dict1
		if test == '1':
			template = get_template("dashboard/dashboard_admin_data.html")
		else:
			template = get_template("dashboard/admin_data.html")
		table_content = template.render(locals())
		return HttpResponse(table_content)


class Coupan(TemplateView):
	template_name = "dashboard/coupan.html"
	def get(self, request, *args, **kwargs):
		if request.user.is_authenticated():
			user = User.objects.get(id=request.user.id)
			restaurant = Restaurant.objects.get(id=kwargs.get('restaurant_id'))
			coupon = RestaurantDiscountCoupon.objects.filter(restaurant=restaurant, available_till__gte=datetime.now()).first()
			notifications_num = len(AdminNotification.objects.filter(archived=False))
			if coupon:
				return render(request, self.template_name, locals())
			else:
				return HttpResponseRedirect('/dashboard')
		else:
			return HttpResponseRedirect('/')