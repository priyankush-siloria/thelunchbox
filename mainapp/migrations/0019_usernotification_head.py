# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-08-14 10:01
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mainapp', '0018_usernotification'),
    ]

    operations = [
        migrations.AddField(
            model_name='usernotification',
            name='head',
            field=models.CharField(blank=True, max_length=200, null=True),
        ),
    ]
