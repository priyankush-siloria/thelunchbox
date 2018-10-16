# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.contrib.auth.models import User
from django.db import models

# Create your models here.
class ForgetPassword(models.Model):
	user = models.ForeignKey(User, on_delete=models.CASCADE)
	activation_key = models.CharField(max_length=100)
	start_datetime = models.DateTimeField()
	end_datetime = models.DateTimeField()
	def __str__(self):
		return str(self.user)

