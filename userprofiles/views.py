from django.shortcuts import *
from django.views.generic import *
from .models import *
from .forms import *
from django.contrib.auth.models import User
from django.db.models import Count, Q
from django.forms import inlineformset_factory, modelformset_factory, formset_factory
from django.forms import *
from .forms import ShiftsFormSet
import orders
import datetime
import json
from django.utils.translation import ugettext as _
import pytz
from django.conf import settings
from userprofiles.models import OrderNotification
from mainapp.models import Category

class RestaurantProfile(TemplateView):
	def get(self, request, *args, **kwargs):
		r = Restaurant.objects.get(slug=kwargs.get('slug'))
		coupon = RestaurantDiscountCoupon.objects.filter(restaurant__id=r.id,
														 available_till__gte=datetime.datetime.now()).first()
		try:
			user = User.objects.get(id=request.user.id)
			unrated = LunchboxRating.objects.filter(
					Q(lunchbox__restaurant_id=r.id) &
					Q(user=user)
			)
			user_orders = orders.models.OrderItem.objects.filter(order__user=user, order__u_is_paid=True)

			lunchboxes_unrated = Lunchbox.objects.filter(
					~Q(id__in=unrated.values('lunchbox_id')) &
					Q(restaurant=r) &
					Q(id__in=user_orders.values('lunchbox_id')),
					Q(available_till__gt=datetime.datetime.now())
			)

			lunchboxes_rated = Lunchbox.objects.filter(
					Q(id__in=unrated.values('lunchbox_id')) &
					Q(id__in=user_orders.values('lunchbox_id')) &
					Q(restaurant=r),
					Q(available_till__gt=datetime.datetime.now())
			)

			other_lunchboxes = Lunchbox.objects.filter(
					~Q(id__in=user_orders.values('lunchbox_id')) &
					Q(restaurant=r),
					Q(available_till__gt=datetime.datetime.now())
			)

			archived_lunchboxes_unrated = Lunchbox.objects.filter(
					~Q(id__in=unrated.values('lunchbox_id')) &
					Q(restaurant=r) &
					Q(id__in=user_orders.values('lunchbox_id')),
					Q(available_till__lt=datetime.datetime.now())
			)
			archived_lunchboxes_rated = Lunchbox.objects.filter(
					Q(id__in=unrated.values('lunchbox_id')) &
					Q(id__in=user_orders.values('lunchbox_id')) &
					Q(restaurant=r),
					Q(available_till__lt=datetime.datetime.now())
			)
			archived_other_lunchboxes = Lunchbox.objects.filter(
					~Q(id__in=user_orders.values('lunchbox_id')) &
					Q(restaurant=r),
					Q(available_till__lt=datetime.datetime.now())
			)
		except User.DoesNotExist:
			lunchboxes = Lunchbox.objects.filter(
					Q(restaurant=r),
					Q(available_till__gt=datetime.datetime.now())
			)
			archived_other_lunchboxes = Lunchbox.objects.filter(
					Q(restaurant=r),
					Q(available_till__lt=datetime.datetime.now())
			)
		return render(request, self.template_name, locals())


class GetCoupon(TemplateView):
	template_name = "coupon.html"

	def get(self, request, *args, **kwargs):
		if request.user.is_authenticated():
			user = User.objects.get(id=request.user.id)
			restaurant = Restaurant.objects.get(id=kwargs.get('restaurant_id'))
			coupon = RestaurantDiscountCoupon.objects.filter(restaurant=restaurant,
															 available_till__gte=datetime.datetime.now()).first()
			if coupon:
				return render(request, self.template_name, locals())
			else:
				return HttpResponseRedirect('/')
		else:
			return HttpResponseRedirect('/')


class UserProfile(TemplateView):
	def get(self, request, *args, **kwargs):
		if not request.user.is_authenticated():
			return HttpResponseRedirect('/')

		user = User.objects.get(id=request.user.id)
		if not user.profile.is_filled() and not user.is_staff:
			return HttpResponseRedirect('/edit_user_profile/')

		unrated = LunchboxRating.objects.filter(
				Q(user=user)
		)
		user_orders = orders.models.OrderItem.objects.filter(order__user=user, order__u_is_paid=True)

		lunchboxes_unrated = Lunchbox.objects.filter(
				~Q(id__in=unrated.values('lunchbox_id')) &
				Q(id__in=user_orders.values('lunchbox_id')) &
				Q(available_till__gte=datetime.datetime.now())
		)

		lunchboxes_rated = Lunchbox.objects.filter(
				Q(id__in=unrated.values('lunchbox_id')) &
				Q(id__in=user_orders.values('lunchbox_id')) &
				Q(available_till__gte=datetime.datetime.now())
		)

		archived_lunchboxes_unrated = Lunchbox.objects.filter(
				~Q(id__in=unrated.values('lunchbox_id')) &
				Q(id__in=user_orders.values('lunchbox_id')) &
				Q(available_till__lt=datetime.datetime.now())
		)

		archived_lunchboxes_rated = Lunchbox.objects.filter(
				Q(id__in=unrated.values('lunchbox_id')) &
				Q(id__in=user_orders.values('lunchbox_id')) &
				Q(available_till__lt=datetime.datetime.now())
		)

		if not request.user.is_staff:
			company_form = ProfileCompanyForm(initial={
				'first_name': user.first_name,
				'last_name': user.last_name,
				'company_name': user.profile.company.name,
				'company_street': user.profile.company.street,
				'company_zipcode': user.profile.company.zip_code,
				'company_phone': user.profile.company.phone,
			})

		catering_form = ProfileCateringForm(initial={
			'c_first_name': user.profile.c_first_name,
			'c_last_name': user.profile.c_last_name,
			'c_address': user.profile.c_address,
			'c_zipcode': user.profile.c_zip_code,
			'c_phone': user.profile.phone
		})

		return render(request, self.template_name, locals())

	def post(self, request, *args, **kwargs):
		user = User.objects.get(id=request.user.id)
		catering_form = ProfileCateringForm(request.POST)
		if catering_form.is_valid():
			c_first_name = catering_form.cleaned_data.get('c_first_name')
			c_last_name = catering_form.cleaned_data.get('c_last_name')
			c_address = catering_form.cleaned_data.get('c_address')
			c_phone = catering_form.cleaned_data.get('c_phone')
			c_zipcode = catering_form.cleaned_data.get('c_zipcode')

			profile = Profile.objects.get(user=user)
			profile.c_first_name = c_first_name
			profile.c_last_name = c_last_name
			profile.c_address = c_address
			profile.phone = c_phone
			profile.c_zip_code = c_zipcode
			profile.save()
		return HttpResponseRedirect(request.META.get('HTTP_REFERER'))


class Control(TemplateView):
	template_name = "control/restaurant_dashboard.html"
	admin_template_name = "control/admin_dashboard.html"

	def get(self, request, *args, **kwargs):
		today = datetime.datetime.now()
		if request.user.is_authenticated() and request.user.profile.is_restaurant():
			user = User.objects.get(id=request.user.id)
			if user.profile.is_restaurant():
				restaurant = Restaurant.objects.get(user__id=request.user.id)
				restaurant_opening_hours = restaurant.get_opening_hours()
				return render(request, self.template_name, locals())
		elif request.user.is_authenticated() and request.user.is_staff or request.user.profile.is_employee():
			notifications_num = len(AdminNotification.objects.filter(archived=False))
			menu_restaurant_orders = orders.models.OrderItem.objects.filter(
				delivery_date__day=datetime.datetime.now().day,
				order__u_is_paid=True
			).values(
					'lunchbox__restaurant__id', 'lunchbox__restaurant__name', 'lunchbox__restaurant__logo').distinct()

			if kwargs.get('restaurant_id'):
				restaurant = Restaurant.objects.get(id=kwargs.get('restaurant_id'))
				o = orders.models.OrderItem.objects.filter(
					lunchbox__restaurant=restaurant,
					delivery_date__day=datetime.datetime.now().day,
					order__u_is_paid=True
				).values('lunchbox__id').distinct()
				order_list = []
				for k in o:
					order_list.append(Lunchbox.objects.get(id=int(k['lunchbox__id'])))
				today_orders = orders.models.OrderItem.objects.filter(
					lunchbox__restaurant=restaurant,
					delivery_date__day=datetime.datetime.now().day,
					order__u_is_paid=True
				)
			return render(request, self.admin_template_name, locals())
		else:
			return HttpResponseRedirect('/')



class ControlRestaurant(TemplateView):
	template_name = "control/restaurant_info.html"
	ImagesFormset = inlineformset_factory(
		Restaurant, RestaurantImage, form=LunchboxImageForm,
		fields='__all__', extra=5, max_num=5
	)
	DiscountFormset = inlineformset_factory(
		Restaurant, RestaurantDiscountCoupon, max_num=1, extra=1,
		fields='__all__',
		form=LunchboxDiscountsForm,
		widgets={
			'available_from': TextInput(attrs={'class': 'datepicker'}),
			'available_till': TextInput(attrs={'class': 'datepicker'}),
			'time_from': TextInput(attrs={'class': 'timepicker'}),
			'time_till': TextInput(attrs={'class': 'timepicker'}),
			'discount_text': widgets.TextInput(
				attrs={'class': 'd2 w100', 'placeholder': 'ADD TEXT'}),
			'percent': widgets.TextInput(attrs={'class': 'd2',
										 'placeholder': 'XX'})
		}
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

			edit_form = RestaurantEditForm(instance=restaurant)
			images_formset = self.ImagesFormset(instance=restaurant)
			discount_formset = self.DiscountFormset(instance=restaurant)
			shift_dict = restaurant.shifts.all().values()
			shift_dict = list(shift_dict)
			opening_hours_formset = self.ShiftsFormset(
				initial=shift_dict)
			restaurant_delivery = self.get_restaurant_delivery_distance(
				restaurant)
			return render(request, self.template_name, locals())
		else:
			return HttpResponseRedirect('/')

	def post(self, request, *args, **kwargs):
		if request.user.is_authenticated() and \
		   request.user.profile.is_restaurant() or \
		   request.user.is_staff or request.user.profile.is_employee():

			if kwargs.get('restaurant_id'):
				restaurant = Restaurant.objects.get(
					id=kwargs.get('restaurant_id'))
			else:
				restaurant = Restaurant.objects.get(user__id=request.user.id)
			print "\n\n\n",request.FILES,"\n\n\n"
			images_formset = self.ImagesFormset(
				request.POST, request.FILES, instance=restaurant)
			edit_form = RestaurantEditForm(
				request.POST, request.FILES, instance=restaurant)
			discount_formset = self.DiscountFormset(
				request.POST, instance=restaurant)
			opening_hours_formset = self.ShiftsFormset(
				request.POST, restaurant.shifts.all())
			restaurant_delivery = self.get_restaurant_delivery_distance(
				restaurant)
			if images_formset.is_valid():
				images_formset.save()
				for form in images_formset:
					if form.cleaned_data.get('image'):
						if form.instance.id:
							img_instance, created = RestaurantImage.objects\
								.get_or_create(pk=form.instance.id)
							img_instance.save()
			else:
				print(images_formset.errors)

			if edit_form.is_valid():
				if edit_form.cleaned_data.get('photoshoot_requested'):
					notification = AdminNotification.objects.get_or_create(
						lunchbox=None, restaurant=restaurant)
					if notification[1]:
						notification[0].save()
				else:
					notification = AdminNotification.objects.filter(
						restaurant=restaurant)
					if notification:
						notification[0].delete()

				edit_form.save()
			else:
				return render(request, self.template_name, locals())

			if discount_formset.is_valid():
				discount_formset.save()
			else:
				print(discount_formset.errors)

			if opening_hours_formset.is_valid():
				opening_hours_formset.save(restaurant)
			else:
				print (opening_hours_formset.__dict__)
				return render(request, self.template_name, locals())

			RestaurantDelivery.objects.filter(restaurant=restaurant).delete()
			delivery = json.loads(request.POST.get('delivery'))
			for k in delivery:
				RestaurantDelivery.objects.create(
					restaurant=restaurant, city=City.objects.get(id=int(k)),
					possible=delivery[k])

			if request.POST.get('images_del'):
				images_for_delete = str(request.POST.get('images_del'))\
					.split(',')

				if images_for_delete:
					for i in images_for_delete:
						image = RestaurantImage.objects.get(id=int(i))
						if image.restaurant == restaurant:
							image.delete()

			if request.POST.get('pcodes_del'):
				pcodes_for_delete = str(request.POST.get('pcodes_del'))\
					.split(',')

				if pcodes_for_delete:
					for c in pcodes_for_delete:
						pcode = CheckoutPromoCode.objects.get(id=int(c))
						if pcode.restaurant == restaurant:
							pcode.delete()

			if request.user.is_staff:
				return HttpResponseRedirect('/control/restaurant/{}/'.format(
					restaurant.id))
			else:
				return HttpResponseRedirect('/control/')


class ControlRestaurants(TemplateView):
	template_name = "control/restaurants.html"

	def get(self, request, *args, **kwargs):
		if request.user.is_authenticated() and request.user.is_staff or request.user.profile.is_employee():
			notifications_num = len(AdminNotification.objects.filter(archived=False))
			default = Restaurant.objects.filter(is_premium=False)
			return render(request, self.template_name, locals())
		else:
			return HttpResponseRedirect('/')


class ControlOrders(TemplateView):
	template_name = "control/restaurant_orders.html"
	admin_template_name = "control/admin_restaurant_orders.html"

	def get(self, request, *args, **kwargs):
		order_by_qty = request.GET.get('qty')
		order_by_time = request.GET.get('time')
		if request.user.is_authenticated() and request.user.profile.is_restaurant() or request.user.profile.is_employee() or request.user.is_staff:
			if not request.user.is_staff and not request.user.profile.is_employee():
				user = User.objects.get(id=request.user.id)
				restaurant = Restaurant.objects.get(user__id=request.user.id)
				order_list = self.get_restaurant_orders(restaurant, order_by_qty, order_by_time)
				return render(request, self.template_name, locals())
			else:
				notifications_num = len(AdminNotification.objects.filter(archived=False))
				order_list = self.get_all_orders(order_by_qty, order_by_time)
				return render(request, self.admin_template_name, locals())
		else:
			return HttpResponseRedirect('/')

	def get_restaurant_orders(self, restaurant, order_by_qty, order_by_time):
		order_list = []
		delivery_datetimes = orders.models.OrderItem.objects.filter(
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

			u = orders.models.OrderItem.objects.filter(
				lunchbox__restaurant=restaurant,
				delivery_date__range=(delivery_date_start, delivery_date_end),
				order__is_archived=False,
				order__u_is_paid=True)\
				.values('order__user').annotate(available=Count('order__user'))
			for uo in u:
				qset = orders.models.OrderItem.objects.filter(
					delivery_date__range=(delivery_date_start,
										  delivery_date_end),
					order__user__id=uo['order__user'],
					lunchbox__restaurant=restaurant,
					order__is_archived=False,
					order__u_is_paid=True)

				if order_by_time == '1':
					u_orders = qset.order_by('delivery_date')
				elif order_by_qty == '1':
					u_orders = qset.order_by('qty')
				else:
					u_orders = qset

				user_orders.append({
					'user': User.objects.get(id=uo['order__user']),
					'user_orders': u_orders
				})
			order_list.append({
				'date': dd,
				'orders': user_orders
			})
		return order_list

	def get_all_orders(self, order_by_qty, order_by_time):
		order_list = []
		delivery_datetimes = orders.models.OrderItem.objects.filter(
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

			u = orders.models.OrderItem.objects.filter(
				order__is_archived=False,
				delivery_date__range=(delivery_date_start, delivery_date_end),
				order__u_is_paid=True)\
				.values('lunchbox__restaurant').annotate(
				available=Count('lunchbox__restaurant'))

			for uo in u:
				qset = orders.models.OrderItem.objects.filter(
					order__is_archived=False,
					delivery_date__range=(delivery_date_start,
										  delivery_date_end),
					lunchbox__restaurant__id=uo['lunchbox__restaurant'],
					order__u_is_paid=True)

				if order_by_time == '1':
					u_orders = qset.order_by('delivery_date')
				elif order_by_qty == '1':
					u_orders = qset.order_by('qty')
				else:
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


class ControlBilling(TemplateView):
	template_name = "control/restaurant_billing.html"

	def get(self, request, *args, **kwargs):
		if request.user.is_authenticated() and request.user.profile.is_restaurant() or request.user.is_staff or request.user.profile.is_employee():
			user = User.objects.get(id=request.user.id)
			notifications_num = len(AdminNotification.objects.filter(archived=False))

			if not request.user.is_staff and not request.user.profile.is_employee():
				restaurant = Restaurant.objects.get(user__id=request.user.id)
				billing_opened = orders.models.OrderItem.objects.filter(
						Q(is_processed=False) &
						Q(order__u_is_paid=True) &
						Q(lunchbox__restaurant=restaurant)
				)
				billing_user_processing = orders.models.OrderItem.objects\
					.filter(
						is_processed=True,
						is_payment_transferred=False,
						lunchbox__restaurant=restaurant)
				billing_restaurant_processing = orders.models.OrderItem.objects\
					.filter(
						Q(is_payment_transferred=True) &
						Q(lunchbox__restaurant=restaurant))
			else:
				billing_opened = orders.models.OrderItem.objects.filter(
						Q(is_processed=False) &
						Q(order__u_is_paid=True)
				)
				billing_user_processing = orders.models.OrderItem.objects\
					.filter(
						is_processed=True,
						is_payment_transferred=False)
				billing_restaurant_processing = orders.models.OrderItem.objects\
					.filter(is_payment_transferred=True)

			return render(request, self.template_name, locals())


class ControlSetOrderStatus(RedirectView):
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

				data['msg'] = 'success'
				data['date'] = action_datetime.strftime("%Y.%b %d")
			else:
				data['msg'] = 'Order item not found'

			return HttpResponse(json.dumps({'data': data}),
								content_type="application/json")
		else:
			return HttpResponse(json.dumps('user is not authenticated'),
								content_type="application/json")


class ControlContract(TemplateView):
	template_name = "control/restaurant_contract.html"

	def get(self, request, *args, **kwargs):
		if request.user.is_authenticated() and request.user.profile.is_restaurant() or request.user.is_staff:
			if request.user.is_staff or request.user.profile.is_employee():
				notifications_num = len(AdminNotification.objects.filter(archived=False))
				is_restaurant_links = True
				restaurant = Restaurant.objects.get(id=kwargs.get('restaurant_id'))
			else:
				restaurant = Restaurant.objects.get(user__id=request.user.id)

			contract = RestaurantContract.objects.get(restaurant=restaurant)
			return render(request, self.template_name, locals())
		else:
			return HttpResponseRedirect('/')


class ControlNotifications(TemplateView):
	template_name = "control/restaurant_notifications.html"
	admin_template_name = "control/admin_notifications.html"

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


class ControlSetMsgPriority(RedirectView):
	def post(self, request, *args, **kwargs):
		if request.user.is_authenticated() and request.user.profile.is_restaurant() or request.user.is_staff:
			msg_id = request.POST.get('msg_id')
			user_id = request.POST.get('idd')
			priority = request.POST.get('priority')
			lb_msg_type = int(request.POST.get('lb_msg_type'))
			data = {}

			if request.user.is_staff or request.user.profile.is_employee():
				try:
					notification = AdminNotification.objects.get(id=msg_id)
					notification.priority = priority
					notification.save()
					data['msg'] = 'success'
				except AdminNotification.DoesNotExist:
					data['msg'] = 'error'
			else:
				restaurant = Restaurant.objects.get(user__id=request.user.id)

				if lb_msg_type == 1:
					try:
						msg = LunchboxAdminMessage.objects.get(id=msg_id)
						msg.priority = priority
						msg.save()
						data['msg'] = 'success'
					except LunchboxFeedback.DoesNotExist:
						data['msg'] = 'error'
				elif lb_msg_type == 0:
					try:
						msg = LunchboxFeedback.objects.get(id=msg_id, restaurant=restaurant,
														   user=User.objects.get(id=user_id))
						msg.priority = priority
						msg.save()
						data['msg'] = 'success'
					except LunchboxFeedback.DoesNotExist:
						data['msg'] = 'error'
				elif lb_msg_type == 2:
					try:
						notification = OrderNotification.objects.get(id=msg_id)
						notification.priority = priority
						notification.save()
						data['msg'] = 'success'
					except OrderNotification.DoesNotExist:
						data['msg'] = 'error'

			return HttpResponse(json.dumps({'data': data}), content_type="application/json")
		else:
			return HttpResponse(json.dumps('user is not authenticated'), content_type="application/json")


class RemoveRestaurant(RedirectView):
	def post(self, request, *args, **kwargs):
		if not request.user.is_authenticated():
			return HttpResponse(json.dumps('user is not authenticated'), content_type="application/json")
		else:
			if request.user.is_staff or request.user.profile.is_employee():

				res_id = request.POST.get('res_id')
				data = {}
				try:
					res = Restaurant.objects.get(id=res_id)
					if res.user.profile.is_restaurant():
						del_user=User.objects.get(id=res.user.id)
						del_user.delete()
					else:
						res.delete()
					data['msg'] = 'success'
				except LunchboxFeedback.DoesNotExist:
					data['msg'] = 'error'
				return HttpResponse(json.dumps({'data': data}), content_type="application/json")



class ControlCreateLunchbox(TemplateView):
	template_name = "control/restaurant_create_lunchbox.html"
	ImagesFormset = inlineformset_factory(Lunchbox, LunchboxImage, form=LunchboxImageForm, fields='__all__', extra=5,
										  max_num=5)
	DiscountFormset = inlineformset_factory(Lunchbox, LunchboxDiscount, max_num=3, extra=3, fields='__all__',
											form=LunchboxDiscountsForm)
	LbPrivilegesFormset = inlineformset_factory(Lunchbox, LunchboxPrivilegesItem, max_num=3, extra=3, fields='__all__',
												form=LunchboxPrivilegesForm)
	CategoryFormset=inlineformset_factory(Category,Lunchbox ,form=LunchboxCategoryForm)
	def get(self, request, *args, **kwargs):
		if request.user.is_authenticated() and request.user.profile.is_restaurant() or request.user.is_staff or request.user.profile.is_employee():
			user = User.objects.get(id=request.user.id)

			if kwargs.get('restaurant_id'):
				notifications_num = len(AdminNotification.objects.filter(archived=False))
				restaurant = Restaurant.objects.get(id=kwargs.get('restaurant_id'))
				is_restaurant_links = True
			else:
				restaurant = Restaurant.objects.get(user__id=request.user.id)

			images_formset = self.ImagesFormset()
			lb_form = LunchboxForm(initial={restaurant: restaurant})
			discount_formset = self.DiscountFormset()
			lb_privileges_formset = self.LbPrivilegesFormset()
			category_form_set=self.CategoryFormset()
			categories=Category.objects.all()
			
			return render(request, self.template_name, locals())
		else:
			return HttpResponseRedirect('/')

	def post(self, request, *args, **kwargs):
		if request.user.is_authenticated() and request.user.profile.is_restaurant() or request.user.is_staff or request.user.profile.is_employee():
			user = User.objects.get(id=request.user.id)
			notifications_num = len(AdminNotification.objects.filter(archived=False))

			if kwargs.get('restaurant_id'):
				restaurant = Restaurant.objects.get(id=kwargs.get('restaurant_id'))
			else:
				restaurant = Restaurant.objects.get(user__id=request.user.id)

			lb_form = LunchboxForm(request.POST)

			if lb_form.is_valid():

				lb, created = Lunchbox.objects.get_or_create(name=lb_form.cleaned_data.get('name'),
															 restaurant=restaurant)
				lb.desc = lb_form.cleaned_data.get('desc')
				lb.price = lb_form.cleaned_data.get('price')
				lb.total_calories = lb_form.cleaned_data.get('total_calories')
				lb.protein = lb_form.cleaned_data.get('protein')
				lb.carbohydrates = lb_form.cleaned_data.get('carbohydrates')
				lb.fat = lb_form.cleaned_data.get('fat')
				lb.sugar = lb_form.cleaned_data.get('sugar')
				lb.sodium = lb_form.cleaned_data.get('sodium')
				lb.min_order = lb_form.cleaned_data.get('min_order')
				lb.photoshoot_requested = lb_form.cleaned_data.get('photoshoot_requested')
				lb.publishing_requested = lb_form.cleaned_data.get('publishing_requested')
				lb.published = lb_form.cleaned_data.get('published')
				lb.rate = lb_form.cleaned_data.get('rate')

				if lb_form.cleaned_data.get('available_from') and lb_form.cleaned_data.get('available_till'):
					lb.available_from = lb_form.cleaned_data.get('available_from')
					lb.available_till = lb_form.cleaned_data.get('available_till')

				lb.save()

				if lb.photoshoot_requested or lb.publishing_requested:
					notification = AdminNotification.objects.create(lunchbox=lb)
					notification.save()

				discount_formset = self.DiscountFormset(request.POST, instance=lb)
				if discount_formset.is_valid():
					discount_formset.save()
					for form in discount_formset:
						if form.instance.id:
							d_instance = LunchboxDiscount.objects.get(pk=form.instance.id)
							d_instance.percent = form.cleaned_data.get('percent')
							d_instance.qty = form.cleaned_data.get('qty')
							d_instance.save()
				else:
					print(discount_formset.errors)

				images_formset = self.ImagesFormset(request.POST, request.FILES, instance=lb)
				LunchboxImage.objects.filter(lunchbox=lb).delete()
				if images_formset.is_valid():
					images_formset.save()
					for form in images_formset:
						if form.cleaned_data.get('image'):
							if form.instance.id:
								img_instance, created = LunchboxImage.objects.get_or_create(pk=form.instance.id)
								img_instance.save()

				lb_privileges_formset = self.LbPrivilegesFormset(request.POST, instance=lb)
				if lb_privileges_formset.is_valid():
					lb_privileges_formset.save()
					for form in lb_privileges_formset:
						if form.cleaned_data.get('privilege'):
							if form.instance.id:
								p_instance, created = LunchboxPrivilegesItem.objects.get_or_create(
										pk=form.instance.id)
								p_instance.save()
				else:
					print(lb_privileges_formset.errors)

				if user.is_staff:
					return HttpResponseRedirect('/control/restaurant/{}/saved_lunchboxes/'.format(restaurant.id))
				else:
					return HttpResponseRedirect('/control/saved_lunchboxes/')

			else:
				images_formset = self.ImagesFormset(request.POST, request.FILES)
				discount_formset = self.DiscountFormset(request.POST)
				lb_privileges_formset = self.LbPrivilegesFormset(request.POST)
				return render(request, self.template_name, locals())
		return HttpResponseRedirect('/')


class ControlEditLunchbox(TemplateView):
	template_name = "control/restaurant_create_lunchbox.html"
	ImageFormset = inlineformset_factory(Lunchbox, LunchboxImage, max_num=5, extra=5, fields='__all__',
										 form=LunchboxImageForm)
	DiscountFormset = inlineformset_factory(Lunchbox, LunchboxDiscount, max_num=3, extra=3, fields='__all__',
											form=LunchboxDiscountsForm)
	LbPrivilegesFormset = inlineformset_factory(Lunchbox, LunchboxPrivilegesItem, max_num=3, extra=3, fields='__all__',
												form=LunchboxPrivilegesForm)

	def get(self, request, *args, **kwargs):
		if request.user.is_authenticated() and request.user.profile.is_restaurant() or request.user.is_staff or request.user.profile.is_employee():
			user = User.objects.get(id=request.user.id)
			notifications_num = len(AdminNotification.objects.filter(archived=False))
			lunchbox = Lunchbox.objects.get(id=int(kwargs['id']))

			if request.user.profile.is_restaurant():
				restaurant = Restaurant.objects.get(user__id=request.user.id)
			else:
				is_restaurant_links = True
				restaurant = Restaurant.objects.get(id=lunchbox.restaurant.id)

			images_formset = self.ImageFormset(instance=lunchbox)
			lb_privileges_formset = self.LbPrivilegesFormset(instance=lunchbox)
			discount_formset = self.DiscountFormset(instance=lunchbox)
			lb_form = LunchboxForm(initial={
				restaurant: restaurant
			}, instance=lunchbox)
			return render(request, self.template_name, locals())
		else:
			return HttpResponseRedirect('/')

	def post(self, request, *args, **kwargs):
		if request.user.is_authenticated() and request.user.profile.is_restaurant() or request.user.is_staff or request.user.profile.is_employee():
			user = User.objects.get(id=request.user.id)
			notifications_num = len(AdminNotification.objects.filter(archived=False))
			lunchbox = Lunchbox.objects.get(id=kwargs['id'])

			if request.user.profile.is_restaurant():
				restaurant = Restaurant.objects.get(user__id=request.user.id)
			else:
				is_restaurant_links = True
				restaurant = Restaurant.objects.get(id=lunchbox.restaurant.id)

			lb_form = LunchboxForm(request.POST, instance=lunchbox)

			if lb_form.is_valid():
				lb = Lunchbox.objects.get(id=lunchbox.id, restaurant=restaurant)
				lb.name = lb_form.cleaned_data.get('name')
				lb.desc = lb_form.cleaned_data.get('desc')
				lb.price = lb_form.cleaned_data.get('price')
				lb.total_calories = lb_form.cleaned_data.get('total_calories')
				lb.protein = lb_form.cleaned_data.get('protein')
				lb.carbohydrates = lb_form.cleaned_data.get('carbohydrates')
				lb.fat = lb_form.cleaned_data.get('fat')
				lb.sugar = lb_form.cleaned_data.get('sugar')
				lb.sodium = lb_form.cleaned_data.get('sodium')
				lb.min_order = lb_form.cleaned_data.get('min_order')
				lb.photoshoot_requested = lb_form.cleaned_data.get('photoshoot_requested')
				lb.publishing_requested = lb_form.cleaned_data.get('publishing_requested')
				lb.published = lb_form.cleaned_data.get('published')
				lb.rate = lb_form.cleaned_data.get('rate')

				if lb_form.cleaned_data.get('available_from') and lb_form.cleaned_data.get('available_till'):
					lb.available_from = lb_form.cleaned_data.get('available_from')
					lb.available_till = lb_form.cleaned_data.get('available_till')

				if lb.published:
					lb.publishing_requested = False

				if lb_form.cleaned_data.get('photoshoot_done'):
					lb.photoshoot_requested = False

				lb.save()

				if lb.photoshoot_requested or lb.publishing_requested:
					notification = AdminNotification.objects.get_or_create(lunchbox=lb)
					if notification[1]:
						notification[0].save()
				else:
					notification = AdminNotification.objects.filter(lunchbox=lb)
					if notification:
						notification[0].delete()

				discount_formset = self.DiscountFormset(request.POST, instance=lunchbox)
				if discount_formset.is_valid():
					discount_formset.save()
					for form in discount_formset:
						if form.instance.id:
							d_instance = LunchboxDiscount.objects.get(pk=form.instance.id)
							d_instance.percent = form.cleaned_data.get('percent')
							d_instance.qty = form.cleaned_data.get('qty')
							d_instance.save()
				else:
					print(discount_formset.errors)

				try:
					images_formset = self.ImageFormset(request.POST, request.FILES, instance=lunchbox)

					if images_formset.is_valid():
						images_formset.save()
						for form in images_formset:
							if form.instance.id:
								img_instance = LunchboxImage.objects.get(pk=form.instance.id)
								img_instance.image = form.cleaned_data.get('image')
								img_instance.save()
				except:
					pass

				lb_privileges_formset = self.LbPrivilegesFormset(request.POST, instance=lunchbox)
				if lb_privileges_formset.is_valid():
					lb_privileges_formset.save()
					for form in lb_privileges_formset:
						if form.cleaned_data.get('privilege'):
							if form.instance.id:
								p_instance, created = LunchboxPrivilegesItem.objects.get_or_create(
										pk=form.instance.id)
								p_instance.save()
				else:
					print(lb_privileges_formset.errors)

				if user.is_staff or request.user.profile.is_employee():
					return HttpResponseRedirect('/control/restaurant/{}/saved_lunchboxes/'.format(restaurant.id))
				else:
					return HttpResponseRedirect('/control/saved_lunchboxes/')

			else:
				images_formset = self.ImageFormset(request.POST, request.FILES)
				lb_privileges_formset = self.LbPrivilegesFormset(request.POST, instance=lunchbox)
				discount_formset = self.DiscountFormset(instance=lunchbox)
				return render(request, self.template_name, locals())
		return HttpResponseRedirect('/')


class ControlArchiveLunchbox(RedirectView):
	def get(self, request, *args, **kwargs):
		if request.user.is_authenticated() and request.user.profile.is_restaurant() or request.user.is_staff or request.user.profile.is_employee():
			if kwargs.get('restaurant_id'):
				is_restaurant_links = True
				restaurant = Restaurant.objects.get(id=kwargs.get('restaurant_id'))
				notifications_num = len(AdminNotification.objects.filter(archived=False))
			else:
				restaurant = Restaurant.objects.get(user__id=request.user.id)
			lunchbox = Lunchbox.objects.get(id=int(kwargs.get('id')), restaurant=restaurant)
			lunchbox.available_from = datetime.datetime.now() - datetime.timedelta(days=1)
			lunchbox.available_till = datetime.datetime.now() - datetime.timedelta(days=1)
			lunchbox.save()
			cart = Cart.objects.filter(lunchbox_id=lunchbox.id)
			if cart:
				cart.delete()
		return HttpResponseRedirect(request.META.get('HTTP_REFERER'))


class ControlDeleteLunchbox(RedirectView):
	def get(self, request, *args, **kwargs):
		if request.user.is_authenticated():
			user = User.objects.get(id=request.user.id)
			if user.profile.is_restaurant() or request.user.is_staff or request.user.profile.is_employee():
				if not request.user.is_staff:
					restaurant = Restaurant.objects.get(user=user)
					try:
						lunchbox = Lunchbox.objects.get(id=kwargs.get('id'), restaurant=restaurant)
						cart = Lunchbox.objects.filter(lunchbox_id=lunchbox.id)
						if cart:
							cart.delete()
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


class ControlDuplicateLunchbox(RedirectView):
	def get(self, request, *args, **kwargs):
		if request.user.is_authenticated():
			user = User.objects.get(id=request.user.id)
			if user.profile.is_restaurant() or request.user.is_staff:
				try:
					lb = Lunchbox.objects.get(id=kwargs['id'])
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
					return HttpResponseRedirect('/control/lunchbox/edit/{}/'.format(lb.id))
				except Lunchbox.DoesNotExist:
					pass
		return HttpResponseRedirect('/control/archived_lunchboxes')


class ControlSavedLunchboxes(TemplateView):
	template_name = "control/saved_lunchboxes.html"

	def get(self, request, *args, **kwargs):
		if request.user.is_authenticated() and request.user.profile.is_restaurant() or request.user.is_staff:
			user = User.objects.get(id=request.user.id)
			if kwargs.get('restaurant_id'):
				notifications_num = len(AdminNotification.objects.filter(archived=False))
				restaurant = Restaurant.objects.get(id=kwargs.get('restaurant_id'))
				is_restaurant_links = True
			else:
				restaurant = Restaurant.objects.get(user__id=request.user.id)

			lunchboxes = Lunchbox.objects.filter(restaurant=restaurant, published=False,
												 available_till__gte=datetime.datetime.now())
			return render(request, self.template_name, locals())
		else:
			return HttpResponseRedirect('/')


class ControlPublishedLunchboxes(TemplateView):
	template_name = "control/published_lunchboxes.html"

	def get(self, request, *args, **kwargs):
		if request.user.is_authenticated() and request.user.profile.is_restaurant() or request.user.is_staff:
			user = User.objects.get(id=request.user.id)
			if kwargs.get('restaurant_id'):
				restaurant = Restaurant.objects.get(id=kwargs.get('restaurant_id'))
				notifications_num = len(AdminNotification.objects.filter(archived=False))
				is_restaurant_links = True
			else:
				restaurant = Restaurant.objects.get(user__id=request.user.id)
			lunchboxes = Lunchbox.objects.filter(restaurant=restaurant, published=True,
												 available_till__gte=datetime.datetime.now())
			return render(request, self.template_name, locals())
		else:
			return HttpResponseRedirect('/')


class ControlArchivedLunchboxes(TemplateView):
	template_name = "control/archived_lunchboxes.html"

	def get(self, request, *args, **kwargs):
		if request.user.is_authenticated() and request.user.profile.is_restaurant() or request.user.is_staff:
			user = User.objects.get(id=request.user.id)
			if kwargs.get('restaurant_id'):
				restaurant = Restaurant.objects.get(id=kwargs.get('restaurant_id'))
				notifications_num = len(AdminNotification.objects.filter(archived=False))
				is_restaurant_links = True
			else:
				restaurant = Restaurant.objects.get(user__id=request.user.id)

			lunchboxes = Lunchbox.objects.filter(restaurant=restaurant, available_till__lt=datetime.datetime.now())
			return render(request, self.template_name, locals())
		else:
			return HttpResponseRedirect('/')


class ControlLunchboxAdminMessages(RedirectView):
	def post(self, request, *args, **kwargs):
		if not request.user.is_authenticated():
			return HttpResponse(json.dumps('user is not authenticated'), content_type="application/json")
		else:
			lb = Lunchbox.objects.get(id=request.POST.get('lunchbox'))
			data = {}

			if lb.photoshoot_requested:
				data['photoshoot_requested'] = "{:%Y.%b %d}".format(
					lb.date.astimezone(pytz.timezone('CET')))

			lbadminmsg = LunchboxAdminMessage.objects.filter(lunchbox=lb).first()
			if lbadminmsg:
				data['msg'] = lbadminmsg.msg

			return HttpResponse(json.dumps({'data': data}), content_type="application/json")


class AskRestaurant(RedirectView):
	msg = ""

	def post(self, request, *args, **kwargs):
		if not request.user.is_authenticated():
			msg = "User is not authenticated!"
		else:
			res_id = request.POST.get('res')
			msg = request.POST.get('msg')
			username = "{} {}".format(request.user.first_name, request.user.last_name)
			lb = request.POST.get('lb')

			restaurant = Restaurant.objects.get(id=res_id)
			lbox = Lunchbox.objects.get(id=lb)
			user = User.objects.get(id=request.user.id)
			if user == restaurant.user:
				lb_feedback = LunchboxFeedback.objects.create(lunchbox=lbox, user=user, restaurant=restaurant, msg=msg,
															  inc=False)
				username = "{}".format(restaurant.name.upper())
			else:
				lb_feedback = LunchboxFeedback.objects.create(lunchbox=lbox, user=user, restaurant=restaurant, msg=msg)
			lb_feedback.save()
			msg = "Success"
			feedback_datetime = lb_feedback.datetime.astimezone(
				pytz.timezone('CET'))
			src =settings.STATIC_URL+"mainapp/img/dummy-image.jpg"
			return HttpResponse(json.dumps(
					{'msg': msg, 'user': username.title(), 'src':src,'date': "{:%Y.%b %d}".format(feedback_datetime), 'time': "{:%H:%M}".format(feedback_datetime)}),
					content_type="application/json")


class CommunicationWithRestaurant(RedirectView):
	msg = ""

	def post(self, request, *args, **kwargs):
		if not request.user.is_authenticated():
			msg = "User is not authenticated!"
		else:
			msg = request.POST.get('msg')
			print "\n",request.user.first_name,"\n",request.user.last_name
			username = "{} {} (Manager)".format(request.user.first_name, request.user.last_name)
			lb = request.POST.get('lb')
			user = User.objects.get(id=request.user.id)

			lbox = Lunchbox.objects.get(id=lb)

			admin_msg = LunchboxAdminMessage.objects.create(lunchbox=lbox, msg=msg, user=user)
			admin_msg.save()
			src =settings.STATIC_URL+"mainapp/img/dummy-image.jpg"
			msg = "Success"
			return HttpResponse(json.dumps(
					{'msg': msg, 'user': username, 'src':src, 'time': "{:%H:%M}".format(admin_msg.date), 'date': "{:%Y.%b %d}".format(admin_msg.date)}),
					content_type="application/json")


class LeaveReview(RedirectView):
	msg = ""

	def post(self, request, *args, **kwargs):
		if not request.user.is_authenticated():
			msg = "User is not authenticated!"
		else:
			res_id = request.POST.get('res')
			msg = request.POST.get('msg')
			username = "{} {}".format(request.user.first_name, request.user.last_name)
			username = username.title()
			restaurant = Restaurant.objects.get(id=res_id)
			user = User.objects.get(id=request.user.id)
			review = RestaurantReview.objects.create(user=user, restaurant=restaurant, msg=msg)
			review.save()
			msg = "Success!"
			return HttpResponse(json.dumps(
					{
						'msg': msg,
						'user': username,
						'src':settings.STATIC_URL+"mainapp/img/dummy-image.jpg",
						'date': "{:%H:%M %Y.%b %d}".format(
							review.datetime.astimezone(pytz.timezone('CET')))
					}), content_type="application/json"
			)


class RestaurantReply(RedirectView):
	msg = ""

	def post(self, request, *args, **kwargs):
		if not request.user.is_authenticated() or not request.user.profile.is_restaurant():
			msg = "User is not authenticated!"
		else:
			uid = request.POST.get('uid')
			mid = request.POST.get('mid')
			rmsg = request.POST.get('msg')
			lb = request.POST.get('lb')
			admin_reply = int(request.POST.get('admin_reply'))
			restaurant = Restaurant.objects.get(user=User.objects.get(id=request.user.id))

			if admin_reply:
				if mid:
					amsg = LunchboxAdminMessage.objects.get(id=mid)
					amsg.watched = True
					amsg.save()

				lunchbox = Lunchbox.objects.get(id=lb)
				user = User.objects.get(id=request.user.id)
				msg = LunchboxAdminMessage.objects.create(lunchbox=lunchbox)
				msg.user = user
				msg.inc = False
				msg.msg = rmsg
				msg.save()
				return HttpResponse(json.dumps(
					{
						'msg': msg.msg,
						'user': restaurant.name,
						'date': "{:%H:%M %Y.%b %d}".format(
							msg.date.astimezone(pytz.timezone('CET')))
					}), content_type="application/json"
				)
			else:
				user = User.objects.get(id=uid)

				msg = LunchboxFeedback.objects.get(id=mid)
				msg.watched = True
				msg.save()

				review = LunchboxFeedback.objects.create(user=user, lunchbox=Lunchbox.objects.get(id=lb),
														 restaurant=restaurant, msg=rmsg, inc=False)
				review.save()

				msg = "Success!"
				return HttpResponse(json.dumps(
						{
							'msg': msg,
							'user': restaurant.name,
							'date': "{:%H:%M %Y.%b %d}".format(
								review.datetime.astimezone(
									pytz.timezone('CET')))
						}), content_type="application/json"
				)


class ArchiveNotification(RedirectView):
	msg = ""

	def post(self, request, *args, **kwargs):
		if not request.user.is_authenticated() and not request.user.profile.is_restaurant():
			msg = "User is not authenticated!"
		else:
			uid = request.POST.get('uid')
			mid = request.POST.get('mid')
			lb_msg_type = int(request.POST.get('lb_msg_type'))

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

					msg = "Success!"
				except AdminNotification.DoesNotExist:
					msg = "Error!"
			else:
				if lb_msg_type == 1:
					try:
						notification = LunchboxAdminMessage.objects.get(id=mid)
						notification.watched = True
						notification.save()
						msg = "Success!"
					except LunchboxAdminMessage.DoesNotExist:
						msg = "Error!"
				elif lb_msg_type == 0:
					try:
						msg = LunchboxFeedback.objects.get(id=mid, user=User.objects.get(id=uid),
														   restaurant=Restaurant.objects.get(
																   user=User.objects.get(id=request.user.id)))
						msg.watched = True
						msg.save()
						msg = "Success!"
					except LunchboxFeedback.DoesNotExist:
						msg = "Error!"
				elif lb_msg_type == 2:
					try:
						notification = OrderNotification.objects.get(id=mid)
						notification.watched = True
						notification.save()
						msg = "Success!"
					except OrderNotification.DoesNotExist:
						msg = "Error!"

		return HttpResponse(json.dumps(
				{
					'msg': msg,
				}), content_type="application/json"
		)


class RateLunchbox(RedirectView):
	def post(self, request, *args, **kwargs):
		msg = ""
		response_params = {}

		if not request.user.is_authenticated():
			msg = "User is not authenticated!"
		else:
			normal_rate = [1, 2, 3, 4, 5]
			rating = request.POST.get('rating')
			lb = request.POST.get('lb')
			user = User.objects.get(id=request.user.id)

			try:
				lunchbox = Lunchbox.objects.get(id=lb)
				if int(rating) in normal_rate:
					try:
						order = orders.models.Order.objects.filter(u_is_paid=True, user=user)
						if order:
							try:
								lb_rating = LunchboxRating.objects.get(user=user, lunchbox=lunchbox)
								lb_rating.rating = rating
								lb_rating.save()
								msg = "success"
								response_params['lunchbox_rating'] = lunchbox.get_rating()
							except LunchboxRating.DoesNotExist:
								LunchboxRating.objects.create(user=user, lunchbox=lunchbox, rating=rating).save()
								msg = "success"
								response_params['lunchbox_rating'] = lunchbox.get_rating()
					except orders.models.Order.DoesNotExist:
						msg = "User not ordered this lunchbox!"
				else:
					msg = "Wrong rating!"
			except Lunchbox.DoesNotExist:
				msg = "Lunchbox does not exist!"
		return HttpResponse(json.dumps({'msg': msg, 'data': response_params}), content_type="application/json")


class RequestLunchbox(RedirectView):
	def post(self, request, *args, **kwargs):
		msg = ""
		response_params = {}

		if not request.user.is_authenticated():
			msg = _("User is not authenticated!")
		else:
			lb = request.POST.get('lb')
			user = User.objects.get(id=request.user.id)

			try:
				lunchbox = Lunchbox.objects.get(id=lb)
				order = orders.models.Order.objects.filter(u_is_paid=True, user=user)
				if order:
					lb_req = LunchboxRequest.objects.filter(user=user, lunchbox=lunchbox)
					if lb_req:
						msg = _('You have already requested this lunchbox.')
					else:
						LunchboxRequest.objects.create(user=user, lunchbox=lunchbox).save()
						msg = "success"
						response_params['requests'] = lunchbox.get_requests()
				else:
					msg = _("You haven't ordered this lunchbox!")
			except Lunchbox.DoesNotExist:
				msg = _("This lunchbox does not exist!")
		return HttpResponse(json.dumps({'msg': msg, 'data': response_params}), content_type="application/json")





#New Views=====================================================================================================================================================================

