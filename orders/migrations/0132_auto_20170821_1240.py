# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-08-21 07:10
from __future__ import unicode_literals

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('orders', '0131_auto_20170819_1940'),
    ]

    operations = [
        migrations.CreateModel(
            name='OrderDateMail',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('start_date', models.DateTimeField()),
                ('end_date', models.DateTimeField()),
            ],
        ),
        migrations.AlterField(
            model_name='order',
            name='u_processing_date_till',
            field=models.DateField(blank=True, default=datetime.datetime(2017, 8, 28, 7, 10, 16, 564073, tzinfo=utc), null=True, verbose_name='Processing till date'),
        ),
    ]