# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-09-20 13:28
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('userprofiles', '0027_auto_20170919_0718'),
    ]

    operations = [
        migrations.AddField(
            model_name='restaurant',
            name='door',
            field=models.CharField(blank=True, default=b'0', max_length=50, null=True, verbose_name=b'Door No'),
        ),
        migrations.AddField(
            model_name='restaurant',
            name='floor',
            field=models.CharField(blank=True, default=b'0', max_length=50, null=True, verbose_name=b'Floor No'),
        ),
    ]
