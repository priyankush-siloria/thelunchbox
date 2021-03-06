# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-08-21 07:18
from __future__ import unicode_literals

import datetime
from django.db import migrations, models
import django.utils.timezone
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('orders', '0132_auto_20170821_1240'),
    ]

    operations = [
        migrations.AddField(
            model_name='orderdatemail',
            name='mail_date',
            field=models.DateField(default=django.utils.timezone.now),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='order',
            name='u_processing_date_till',
            field=models.DateField(blank=True, default=datetime.datetime(2017, 8, 28, 7, 18, 25, 301615, tzinfo=utc), null=True, verbose_name='Processing till date'),
        ),
        migrations.AlterField(
            model_name='orderdatemail',
            name='end_date',
            field=models.DateField(),
        ),
        migrations.AlterField(
            model_name='orderdatemail',
            name='start_date',
            field=models.DateField(),
        ),
    ]
