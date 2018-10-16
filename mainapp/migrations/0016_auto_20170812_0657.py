# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-08-12 04:57
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mainapp', '0015_auto_20170812_0548'),
    ]

    operations = [
        migrations.CreateModel(
            name='InviteRewards',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('u_reward', models.FloatField(blank=True, null=True, verbose_name='Existing user reward credits')),
                ('n_reward', models.FloatField(blank=True, null=True, verbose_name='New user reward credits')),
            ],
        ),
        migrations.AddField(
            model_name='inviterequest',
            name='status',
            field=models.BooleanField(default=False, verbose_name='Accepted'),
        ),
    ]
