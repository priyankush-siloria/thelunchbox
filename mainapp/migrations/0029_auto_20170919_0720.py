# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-09-19 05:20
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mainapp', '0028_homecontent_content'),
    ]

    operations = [
        migrations.AlterField(
            model_name='homecontent',
            name='content',
            field=models.TextField(blank=True, default=None, null=True),
        ),
    ]
