# -*- coding: utf-8 -*-
# Generated by Django 1.11.1 on 2017-07-14 13:43
from __future__ import unicode_literals

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('orders', '0075_auto_20170714_1534'),
    ]

    operations = [
        migrations.AlterField(
            model_name='order',
            name='u_processing_date_till',
            field=models.DateField(blank=True, default=datetime.datetime(2017, 7, 21, 13, 43, 25, 173924, tzinfo=utc), null=True, verbose_name=b'Processing till date'),
        ),
    ]
