# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-08-23 10:15
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('userprofiles', '0020_auto_20170802_0917'),
    ]

    operations = [
        migrations.AddField(
            model_name='profile',
            name='accounts_status',
            field=models.IntegerField(default=0, verbose_name=b'Acoount type'),
        ),
    ]