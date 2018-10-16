# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.models import User
from django.utils.timezone import now
import uuid
import userprofiles
import datetime
from django.core.exceptions import ValidationError


class Basket(models.Model):
    user = models.ForeignKey(User, null=True, blank=True, verbose_name='User')
    lunchbox = models.ForeignKey(userprofiles.models.Lunchbox, null=True, blank=True, verbose_name='Lunchbox')
    is_catering = models.BooleanField(default=False, verbose_name='Is catering basket?')
    qty = models.IntegerField(null=True, blank=True, verbose_name='Quantity')

    def __str__(self):
        return str(self.id)


class Order(models.Model):
    uuid = models.UUIDField(default=uuid.uuid4, editable=False)
    user = models.ForeignKey(User, null=True, blank=True, verbose_name='User')
    # 'u' is user
    u_is_processing = models.BooleanField(default=False, blank=True, verbose_name='Is processing?')
    u_processing_date_from = models.DateField(null=True, blank=True, default=now, verbose_name='Processing start date')
    u_processing_date_till = models.DateField(null=True, blank=True, default=now() + datetime.timedelta(days=7), verbose_name='Processing till date')
    u_is_payment_requested = models.BooleanField(default=False, blank=True, verbose_name='Payment requested?')
    u_payment_requested_date = models.DateField(null=True, blank=True, verbose_name='Payment requested date')
    u_is_confirmed_by_lf = models.BooleanField(default=False, blank=True, verbose_name='Is confirmed by LaFiambrera?')
    u_is_confirmed_by_lf_date = models.DateField(null=True, blank=True, verbose_name='Confirmed by LaFiambrera date')
    u_is_paid = models.BooleanField(default=False, blank=True, verbose_name='Is paid?')
    # Other useful flags...
    is_highlighted = models.BooleanField(default=False, blank=True, verbose_name='Is highlighted?')
    is_archived = models.BooleanField(default=False, blank=True, verbose_name='Is archived?')
    is_catering = models.BooleanField(default=False, blank=True, verbose_name='This is catering order?')
    vat = models.FloatField(default=0, blank=True, verbose_name='Vat')
    date = models.DateTimeField(null=True, blank=False, default=now, verbose_name='Order created date')

    def __str__(self):
        return str(self.uuid)

    def get_items(self):
        return OrderItem.objects.filter(order=self)

    def get_customer(self):

        return userprofiles.models.Customer.objects.get(user__id=self.user.id)

    def get_comment(self):
        comment = Comment.objects.get(order=self)
        return comment.comment


class OrderItem(models.Model):
    order = models.ForeignKey(Order, null=True, blank=False, verbose_name='Order')
    lunchbox = models.ForeignKey(userprofiles.models.Lunchbox, null=True, blank=True, verbose_name='Lunchbox')
    qty = models.IntegerField(null=True, blank=True, verbose_name='Quantity')
    delivery_date = models.DateTimeField(null=True, blank=False, verbose_name='Date and time of delivery')
    is_processed = models.BooleanField(
        default=False, blank=True, verbose_name='Is processed?')
    processed_date = models.DateField(
        null=True, blank=True, verbose_name='Processed date')
    is_payment_requested = models.BooleanField(
        default=False, blank=True, verbose_name='Payment requested?')
    payment_request_date = models.DateField(
        null=True, blank=True, verbose_name='Payment request date')
    is_confirmed_by_lf = models.BooleanField(
        default=False, blank=True, verbose_name='Is confirmed by LaFiambrera?')
    confirmation_by_lf_date = models.DateField(
        null=True, blank=True, verbose_name='Confirmation by LaFiambrera date')
    is_payment_transferred = models.BooleanField(
        default=False, blank=True, verbose_name='Is transferred?')
    payment_transfer_date = models.DateField(
        null=True, blank=True, verbose_name='Transfer date')

    def __str__(self):
        return self.lunchbox.name

    def get_amount(self):
        base_price = self.lunchbox.price * self.qty
        qty_discount_price = 0
        coupon_discount_price = 0

        discounts = userprofiles.models.LunchboxDiscount.objects.filter(
            lunchbox=self.lunchbox, qty__lte=self.qty).order_by('qty').last()

        if discounts:
            qty_discount_price = base_price * discounts.percent/100

        if self.order.payment.coupon:
            coupon_discount_price = (base_price - qty_discount_price) \
                                    * self.order.payment.coupon.percent/100

        return round(base_price - qty_discount_price - coupon_discount_price, 2)


class Comment(models.Model):
    order = models.ForeignKey(Order, blank=False, null=True)
    comment = models.TextField(blank=True, null=True)


    def __str__(self):
        return str(self.order.user)


class OrderDateMail(models.Model):
    start_date = models.DateField()
    end_date=models.DateField()
    mail_date=models.DateField()

    def save(self, *args, **kwargs):
        if OrderDateMail.objects.exists() and not self.pk:
        # if you'll not check for self.pk 
        # then error will also raised in update of exists model
            raise ValidationError('There is can be only one OrderMail instance')
        return super(OrderDateMail, self).save(*args, **kwargs)