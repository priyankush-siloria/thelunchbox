# -*- coding: utf-8 -*-
# Generated by Django 1.11.1 on 2017-08-02 04:22
from __future__ import unicode_literals

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('orders', '0097_auto_20170802_0611'),
    ]

    operations = [
        migrations.AlterField(
            model_name='order',
            name='u_processing_date_till',
            field=models.DateField(blank=True, default=datetime.datetime(2017, 8, 9, 4, 22, 5, 101067, tzinfo=utc), null=True, verbose_name=b'Processing till date'),
        ),
    ]