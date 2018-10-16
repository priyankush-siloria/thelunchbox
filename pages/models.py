# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
# from ckeditor.fields import RichTextField
from ckeditor_uploader.fields import RichTextUploadingField
from easy_thumbnails.fields import ThumbnailerImageField

class Faqs(models.Model):
	title = models.CharField(max_length=200)
	description = models.TextField()


	def __str__(self):
		return str(self.title)

class LunchSteps(models.Model):
	title = models.CharField(max_length=200, default='Steps to a healthy lunch')
	# content = RichTextField()
	content = RichTextUploadingField()

	def __str__(self):
		return str(self.title)


class ContactUs(models.Model):
	name = models.CharField(max_length=200)
	email = models.EmailField(blank=False, null=True)
	phone = models.CharField(max_length=50)
	msg = models.TextField()

	def __str__(self):
		return str(self.name)


class GroupBenifits(models.Model):
	title = models.CharField(max_length=11, blank=False, null=False, verbose_name='Title')
	head = models.CharField(max_length=200, blank=False, null=False, verbose_name='Headings')
	image = ThumbnailerImageField(blank=False, null=False, verbose_name='Image')
	description = models.TextField(blank=False, null=False, verbose_name='Description')

	def __str__(self):
		return str(self.title)

class SupportDetails(models.Model):
	email = models.EmailField(blank=False, null=True)
	phone = models.CharField(max_length=50)

	def __str__(self):
		return str(self.email)