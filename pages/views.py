# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.shortcuts import redirect
from django.shortcuts import render
from django.views.generic import *
from pages.models import Faqs,LunchSteps,ContactUs,SupportDetails
from pages.models import GroupBenifits as group
from django.contrib import messages
from django.http import HttpResponseRedirect,HttpResponse
import json
from django.utils.translation import ugettext as _
from mainapp.models import InviteRewards
from payments.models import Lafiambrera_Currency


class StepsView(TemplateView):
	template_name = "pages/steps_to_a_healthy_lunch.html"
	lang_page_url="steps_to_healthy_lunch"

	def get(self, request, *args, **kwargs):
		if request.user.is_authenticated():
			if request.user.profile.is_restaurant() or request.user.profile.is_employee() or request.user.is_staff:
				messages.error(request,'invalidforsite')
				return HttpResponseRedirect('/{}/dashboard/'.format(request.LANGUAGE_CODE))
		lang_page_url="steps_to_healthy_lunch"
		steps = LunchSteps.objects.all()
		return render(request, self.template_name,{"steps":steps,"lang_page_url":lang_page_url})

class FaqsView(TemplateView):
	
	template_name = "pages/Faqs.html"

	def get(self, request, *args, **kwargs):
		if request.user.is_authenticated():
			if request.user.profile.is_restaurant() or request.user.profile.is_employee() or request.user.is_staff:
				messages.error(request,'invalidforsite')
				return HttpResponseRedirect('/{}/dashboard/'.format(request.LANGUAGE_CODE))
		faqs = Faqs.objects.all()
		half=len(faqs)/2
		half=half+1
		return render(request, self.template_name,{"faqs":faqs,"half":half})

class ContactUsView(TemplateView):
	template_name="pages/contact_us.html"
	def post(self, request, *args, **kwargs):
		if request.user.is_authenticated():
			if request.user.profile.is_restaurant() or request.user.profile.is_employee() or request.user.is_staff:
				messages.error(request,'invalidforsite')
				return HttpResponseRedirect('/{}/dashboard/'.format(request.LANGUAGE_CODE))
		name = self.request.POST.get('name')
		email = self.request.POST.get('email')
		phone = self.request.POST.get('phone')
		msg1 = self.request.POST.get('msg1')
		try:
			ContactUs.objects.create(name=name, email=email, phone=phone, msg=msg1).save()
			messages.error(request, _('contact_success'))
			return redirect("/")
		except:
			messages.error(request, _('contact_error'))
			return redirect("/")
	def get(self, request, *args, **kwargs):
		if request.user.is_authenticated():
			if request.user.profile.is_restaurant() or request.user.profile.is_employee() or request.user.is_staff:
				messages.error(request,'invalidforsite')
				return HttpResponseRedirect('/{}/dashboard/'.format(request.LANGUAGE_CODE))
		lang_page_url="contactus"
		support=SupportDetails.objects.all().first()
		return render(request, self.template_name,{"lang_page_url":lang_page_url,'support':support})
	


class GroupBenifits(TemplateView):
	
	template_name = "pages/group_benifits.html"

	def get(self, request, *args, **kwargs):
		if request.user.is_authenticated():
			if request.user.profile.is_restaurant() or request.user.profile.is_employee() or request.user.is_staff:
				messages.error(request,'invalidforsite')
				return HttpResponseRedirect('/{}/dashboard/'.format(request.LANGUAGE_CODE))
		benifits = group.objects.all().order_by('id')
		rewards = InviteRewards.objects.all().first()
		currency = Lafiambrera_Currency.objects.all().first()
		return render(request, self.template_name,locals())


