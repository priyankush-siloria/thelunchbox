# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-08-19 04:49
from __future__ import unicode_literals

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('orders', '0128_auto_20170819_0953'),
    ]

    operations = [
        migrations.AlterField(
            model_name='order',
            name='u_processing_date_till',
            field=models.DateField(blank=True, default=datetime.datetime(2017, 8, 26, 4, 49, 1, 53302, tzinfo=utc), null=True, verbose_name='Processing till date'),
        ),
    ]
