# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from userprofiles.models import *


class Cart(models.Model):
	user = models.ForeignKey(User, unique=False, blank=True, null=True, verbose_name='User', on_delete=models.CASCADE)
	delivery_date = models.DateField(null=True, blank=False, verbose_name='Delivery date')
	delivery_time = models.TimeField(null=True, blank=False,verbose_name='Delivery time')
	total_price = models.FloatField(blank=False, null=True, verbose_name='Price')
	qty = models.IntegerField(null=True, blank=False, verbose_name='qty')
	user_status = models.IntegerField(blank=False, null=True, verbose_name='Guest')
	lunchbox_id = models.IntegerField(blank=False, null=True, verbose_name='Lunchbox')

	def __str__(self):
		return str(self.user.username)


	def finalamount(self):
		lunchbox = Lunchbox.objects.filter(id=self.lunchbox_id)
		discount_prams=LunchboxDiscount.objects.filter(lunchbox=lunchbox).order_by('qty')
		d_percent=0.0
		for i in discount_prams:
			if self.qty >= i.qty:
				d_percent=i.percent
			else:
				break
		if d_percent > 0:
			discount_price = round((d_percent * self.total_price) / 100, 2)
			return float(self.total_price-discount_price)
		else:
			return float(self.total_price)

	def qtydiscount(self):
		lunchbox = Lunchbox.objects.filter(id=self.lunchbox_id)
		discount_prams=LunchboxDiscount.objects.filter(lunchbox=lunchbox).order_by('qty')
		d_percent=0.0
		for i in discount_prams:
			if self.qty >= i.qty:
				d_percent=i.percent
			else:
				break
		if d_percent > 0:
			discount_price = round((d_percent * self.total_price) / 100, 2)
			return float(discount_price)
		else:
			return 0


	def lunchboxes(self):
		return Lunchbox.objects.filter(id=self.lunchbox_id)

