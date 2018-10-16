# -*- coding: utf-8 -*-
# Generated by Django 1.11.1 on 2017-07-05 12:36
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mainapp', '0008_homecontent'),
    ]

    operations = [
        migrations.AddField(
            model_name='homecontent',
            name='description_en',
            field=models.TextField(null=True),
        ),
        migrations.AddField(
            model_name='homecontent',
            name='description_es',
            field=models.TextField(null=True),
        ),
        migrations.AddField(
            model_name='homecontent',
            name='title_en',
            field=models.CharField(max_length=200, null=True),
        ),
        migrations.AddField(
            model_name='homecontent',
            name='title_es',
            field=models.CharField(max_length=200, null=True),
        ),
    ]
