# -*- coding: utf-8 -*-
# Generated by Django 1.11.1 on 2017-07-01 10:08
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('userprofiles', '0004_lunchbox_category'),
    ]

    operations = [
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
        migrations.AddField(
            model_name='lunchbox',
            name='name_en',
            field=models.CharField(max_length=100, null=True, verbose_name=b'Name of lunchbox'),
        ),
        migrations.AddField(
            model_name='lunchbox',
            name='name_es',
            field=models.CharField(max_length=100, null=True, verbose_name=b'Name of lunchbox'),
        ),
        migrations.AddField(
            model_name='restaurant',
            name='desc_en',
            field=models.TextField(null=True, verbose_name=b'Short description'),
        ),
        migrations.AddField(
            model_name='restaurant',
            name='desc_es',
            field=models.TextField(null=True, verbose_name=b'Short description'),
        ),
        migrations.AddField(
            model_name='restaurant',
            name='name_en',
            field=models.CharField(max_length=255, null=True, verbose_name=b'Name of restaurant'),
        ),
        migrations.AddField(
            model_name='restaurant',
            name='name_es',
            field=models.CharField(max_length=255, null=True, verbose_name=b'Name of restaurant'),
        ),
    ]