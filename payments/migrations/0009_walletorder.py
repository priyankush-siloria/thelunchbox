# -*- coding: utf-8 -*-
# Generated by Django 1.11.1 on 2017-07-25 04:36
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('orders', '0093_auto_20170725_0636'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('payments', '0008_wallet'),
    ]

    operations = [
        migrations.CreateModel(
            name='WalletOrder',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('paymentgateway', models.CharField(max_length=20, null=True, verbose_name=b'Payment Gateway')),
                ('status', models.BooleanField(default=False, verbose_name=b'Status')),
                ('order', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='orders.Order', verbose_name=b'Order')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name=b'User')),
                ('wallet', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='payments.Wallet', verbose_name=b'Wallet')),
            ],
        ),
    ]