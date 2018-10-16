# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin

from .models import *
admin.site.register(Category)
admin.site.register(HomeContent)
admin.site.register(InviteRewards)
admin.site.register(InviteRequest)
admin.site.register(UserNotification)