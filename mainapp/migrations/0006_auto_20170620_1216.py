# -*- coding: utf-8 -*-
# Generated by Django 1.11.1 on 2017-06-20 10:16
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mainapp', '0005_delete_language'),
    ]

    operations = [
        migrations.AddField(
            model_name='category',
            name='description_en',
            field=models.TextField(null=True),
        ),
        migrations.AddField(
            model_name='category',
            name='description_es',
            field=models.TextField(null=True),
        ),
        migrations.AddField(
            model_name='category',
            name='title_en',
            field=models.CharField(max_length=200, null=True),
        ),
        migrations.AddField(
            model_name='category',
            name='title_es',
            field=models.CharField(max_length=200, null=True),
        ),
    ]