# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-09-19 10:32
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mainapp', '0031_remove_homecontent_msg'),
    ]

    operations = [
        migrations.AddField(
            model_name='homecontent',
            name='msg',
            field=models.TextField(blank=True, default='Not available', null=True, verbose_name='Message'),
        ),
    ]