# -*- coding: utf-8 -*-
# Generated by Django 1.11.1 on 2017-07-03 06:03
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('userprofiles', '0007_auto_20170703_0803'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='lunchbox',
            name='name_en',
        ),
        migrations.RemoveField(
            model_name='lunchbox',
            name='name_es',
        ),
        migrations.AddField(
            model_name='lunchbox',
            name='desc_en',
            field=models.TextField(null=True, verbose_name=b'Description'),
        ),
        migrations.AddField(
            model_name='lunchbox',
            name='desc_es',
            field=models.TextField(null=True, verbose_name=b'Description'),
        ),
    ]
