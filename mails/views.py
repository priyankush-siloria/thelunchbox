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
from django.core.mail import EmailMessage
from mainapp.models import InviteRequest
import json
from django.conf import settings
import pytz
import uuid
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from django.template.loader import render_to_string
from django.contrib.auth.models import User

class MailDailyOrders(TemplateView):
	template_name = template_name = "dashboard/order.html"

	def get_all_orders(self,start_date,end_date):

				order_list = []
				delivery_datetimes = orders.models.OrderItem.objects.filter(
					order__u_is_paid=True,delivery_date__gte=start_date,delivery_date__lte=end_date).order_by(
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
					print "u:",u
					for uo in u:
						qset = orders.models.OrderItem.objects.filter(order__is_archived=False,delivery_date__range=(delivery_date_start,delivery_date_end),lunchbox__restaurant__id=uo['lunchbox__restaurant'],order__u_is_paid=True)
						u_orders = qset
						tlen=(len(u_orders)*4)+1
						user_orders.append({
							'restaurant': Restaurant.objects.get(id=uo['lunchbox__restaurant']),
							'user_orders': u_orders,
							'length_of':tlen})
						order_list.append({
							'date': dd,
							'orders': user_orders
						})
					# print order_list
					return order_list



		
	


	def get(self, request, *args, **kwargs):
		today=datetime.today()
		ifexists=OrderDateMail.objects.filter(mail_date=today)
		start_date=ifexists[0].start_date
		end_date=ifexists[0].end_date
		if ifexists:
			print 'in existss'
			emailids=[]
			superu=User.objects.filter(is_superuser=True)
			for emailid in superu:
				emailids.append(emailid.email)

			
			order_list=self.get_all_orders(start_date,end_date)
				
			if order_list:
				mail_content=""
				logo=settings.BASE_URL
					
				fromaddr = settings.EMAIL_ADDRESS
				pwd = settings.PASSWORD
				msg = MIMEMultipart()
				msg['From'] = fromaddr
				recipients = emailids
				msg['To'] = ", ".join(recipients)

				msg['Subject'] = "La Fiambrera - Today's order detail"

				content_html = render_to_string("mail/dashboard_admin_orders.html", {"order_list":order_list,"logo":logo})
				content_html = content_html.encode('utf-8').strip()
				try:
					
					test = MIMEText(content_html, 'html')
					msg.attach(test)

					server = smtplib.SMTP('smtp.gmail.com', 587)
					server.starttls()
					server.login(fromaddr, pwd)

					text = msg.as_string()

					server.sendmail(fromaddr, recipients, text)
					server.quit()
				except Exception as e:
					return HttpResponse(mail_content)
			else:
				mail_content=""
				logo=settings.BASE_URL
					
				fromaddr = settings.EMAIL_ADDRESS
				pwd = settings.PASSWORD
				msg = MIMEMultipart()
				msg['From'] = fromaddr
				recipients = emailids
				msg['To'] = ", ".join(recipients)

				msg['Subject'] = "La Fiambrera - Today's order detail"

				# content_html = render_to_string("mail/dashboard_admin_orders.html", {"order_list":'sORRY nO ORDERS',"logo":logo,})
				content_html='No order Exists'
				content_html = content_html.encode('utf-8').strip()
				try:
					
					test = MIMEText(content_html, 'html')
					msg.attach(test)

					server = smtplib.SMTP('smtp.gmail.com', 587)
					server.starttls()
					server.login(fromaddr, pwd)

					text = msg.as_string()

					server.sendmail(fromaddr, recipients, text)
					server.quit()
				except Exception as e:
					return HttpResponse(mail_content)

			user = User.objects.filter(groups__name='Restaurant')
			for emailid in user:
				restaurant=Restaurant.objects.get(user__id=emailid.id)
				order_list=self.get_restaurant_orders(restaurant,start_date,end_date)
				if order_list:
					mail_content=""
					logo=settings.BASE_URL
						
					fromaddr = settings.EMAIL_ADDRESS
					pwd = settings.PASSWORD
					msg = MIMEMultipart()
					msg['From'] = fromaddr
					recipients = emailid.email
					msg['To'] = ", ".join(recipients)

					msg['Subject'] = "La Fiambrera - Today's order detail"

					content_html = render_to_string("mail/dashboard_restaurant_orders.html", {"order_list":order_list,"logo":logo})
					content_html = content_html.encode('utf-8').strip()
					try:
						
						test = MIMEText(content_html, 'html')
						msg.attach(test)

						server = smtplib.SMTP('smtp.gmail.com', 587)
						server.starttls()
						server.login(fromaddr, pwd)

						text = msg.as_string()

						server.sendmail(fromaddr, recipients, text)
						server.quit()
					except Exception as e:
						return HttpResponse(mail_content)
				else:
					mail_content=""
					logo=settings.BASE_URL
						
					fromaddr = settings.EMAIL_ADDRESS
					pwd = settings.PASSWORD
					msg = MIMEMultipart()
					msg['From'] = fromaddr
					recipients = emailid.email
					msg['To'] = ", ".join(recipients)

					msg['Subject'] = "La Fiambrera - Today's order detail"

					# content_html = render_to_string("mail/dashboard_admin_orders.html", {"order_list":'sORRY nO ORDERS',"logo":logo,})
					content_html='No order Exists'
					content_html = content_html.encode('utf-8').strip()
					try:
						
						test = MIMEText(content_html, 'html')
						msg.attach(test)

						server = smtplib.SMTP('smtp.gmail.com', 587)
						server.starttls()
						server.login(fromaddr, pwd)

						text = msg.as_string()

						server.sendmail(fromaddr, recipients, text)
						server.quit()
					except Exception as e:
						return HttpResponse(mail_content)
		else:
			return HttpResponse('no')
		return HttpResponse('okay')
	

	def get_restaurant_orders(self, restaurant, start_date,end_date):
		order_list = []
		delivery_datetimes = orders.models.OrderItem.objects.filter(delivery_date__gte=start_date,
			delivery_date__lte=end_date,
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
				order__u_is_paid=True,
				order__date__contains=today)\
				.values('order__user').annotate(available=Count('order__user'))
			for uo in u:
				qset = orders.models.OrderItem.objects.filter(
					delivery_date__range=(delivery_date_start,
										  delivery_date_end),
					order__user__id=uo['order__user'],
					lunchbox__restaurant=restaurant,
					order__is_archived=False,
					order__u_is_paid=True,
					order__date__contains=today)

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
	

class InviteMail(TemplateView):
	template_name = template_name = "mail/invite.html"
	def post(self, request, *args, **kwargs):
		response={}
		try:
			email_id=request.POST.get('email')
			try:
				User.objects.get(email=email_id)	
				response['status']='error'
				response['msg']=_('This email is already registered.')
				return HttpResponse(json.dumps(response), content_type='application/json')
			except User.DoesNotExist:
				user = User.objects.get(id=request.user.id)
				name = "{} {}".format(user.first_name, user.last_name)
				
				invite_code = str(uuid.uuid4())[:15]
				# subject = 'La Fiambrera - Invitation'
				# from_email = settings.EMAIL_HOST_USER
				# to_email = [email_id]
				# template = get_template("mail/invite.html")
				c = {
					'username': name,
					'site': settings.BASE_URL,
					'lang': 'en',
					#'site': settings.SITE_URL,
					'invite_code': invite_code
				}
				# mail_content = template.render(c)

				# email = EmailMessage(subject, mail_content, from_email, to_email)
				# email.content_subtype = 'html'
				# email.send()
				fromaddr = settings.EMAIL_ADDRESS
				pwd = settings.PASSWORD
				msg = MIMEMultipart()
				msg['From'] = fromaddr
				recipients = [email_id]
				msg['To'] = ", ".join(recipients)

				msg['Subject'] = 'La Fiambrera - Invitation'
				logo=settings.BASE_URL
				content_html = render_to_string("mail/invite.html", {'c':c,'logo':logo})
				content_html = content_html.encode('utf-8').strip()
				test = MIMEText(content_html, 'html')
				msg.attach(test)

				server = smtplib.SMTP('smtp.gmail.com', 587)
				server.starttls()
				server.login(fromaddr, pwd)

				text = msg.as_string()

				server.sendmail(fromaddr, recipients, text)
				server.quit()

				invite = InviteRequest.objects.create(
							user=user,
							email=email_id,
							key=invite_code
					)
				invite.save()
				
				response['status']='success'
				response['msg']=_('Your invitation successsfully send to your friend.')
				return HttpResponse(json.dumps(response), content_type='application/json')
		except Exception as e:

			return HttpResponse(str(e))

class MailUserOrders(TemplateView):
	template_name = template_name = "dashboard/order.html"
	
	def post(self, request, *args, **kwargs):
		try:
			start_date=request.POST.get('start_date')
			end_date=request.POST.get('end_date')
			mail_date=request.POST.get('mail_date')
			count=OrderDateMail.objects.count()
			if count ==0:
				order_obj=OrderDateMail.objects.create(start_date=start_date,end_date=end_date,mail_date=mail_date)
			if count==1:
				alls=OrderDateMail.objects.all()
				alls_id=alls[0].id
				update=OrderDateMail.objects.filter(id=alls_id).update(start_date=start_date,end_date=end_date,mail_date=mail_date)
			return HttpResponse('yes')
		except Exception as error:
			print error
			return HttpResponse('no')

		return render(request,self.template_name,locals())
		
