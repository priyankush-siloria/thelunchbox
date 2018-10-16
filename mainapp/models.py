# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from django.contrib.contenttypes.models import ContentType
from django.template.defaultfilters import slugify
from userprofiles.models import User

class Category(models.Model):
	title = models.CharField(max_length=200)
	description = models.TextField()
	image = models.FileField(upload_to='mainapp/uploads')
	slug=models.CharField(max_length=50,blank=True)
	def save(self):
		self.slug="%s"%(slugify(self.title))
		super(Category,self).save()

	def __str__(self):
		return str(self.title)

class HomeContent(models.Model):
	title = models.CharField(max_length=200)
	description = models.TextField()
	msg = models.TextField(null=True, blank=True, default="Not available", verbose_name='Message')
	def __str__(self):
		return str(self.title)

class InviteRequest(models.Model):
    key = models.CharField(max_length=255, blank=False, null=True)
    user = models.ForeignKey(User, null=True, blank=True, verbose_name='User')
    email = models.EmailField(blank=False, null=True, verbose_name='Email')
    status = models.BooleanField(default=False, verbose_name='Accepted')

    def __str__(self):
		return str(self.email)
    
class InviteRewards(models.Model):
	u_reward = models.FloatField(null=True, blank=True,verbose_name='Existing user reward credits')
	n_reward = models.FloatField(null=True, blank=True,verbose_name='New user reward credits')

	def __str__(self):
		return str(self.id)


class UserNotification(models.Model):
    user = models.ForeignKey(User, null=True, blank=False, verbose_name='User')
    head = models.CharField(null=True, blank=True, max_length=200)
    unread = models.BooleanField(default=False, verbose_name='Read')
    msg = models.TextField(null=True, blank=True, verbose_name='Message')
    date = models.DateTimeField(null=True, blank=False, auto_now=True, verbose_name='Date')
    cat = models.IntegerField(blank=False, null=True, default=0)
    share_id = models.IntegerField(blank=False, null=True, default=0)

    def __str__(self):
        return str(self.user)






class ShareSelection(models.Model):
	user = models.ForeignKey(User, null=True, blank=False, verbose_name='User')
	receiver_id = models.IntegerField(blank=False, null=True, verbose_name='Reciever ID')
	# selectionreference = models.ForeignKey(SelectionReference, null=True, blank=False, verbose_name='Selection')
	date = models.DateField(null=True, blank=False, auto_now=True, verbose_name='Date Time')
	status = models.BooleanField(default=False, verbose_name='Status')
	credits = models.FloatField(blank=False, null=True, verbose_name='Credits')

class SelectionReference(models.Model):
	lunchbox_id = models.IntegerField(blank=False, null=True, verbose_name='Lunchbox ID')
	shareselection = models.ForeignKey(ShareSelection, null=True, blank=False, verbose_name='Share Selection')