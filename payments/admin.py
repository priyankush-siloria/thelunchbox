# -*- coding: utf-8 -*-
from django.contrib import admin

from .models import *


class PaymentAdmin(admin.ModelAdmin):

    def get_queryset(self, request):
        return Payment.objects.all()


admin.site.register(Payment, PaymentAdmin)




class CurrencyAdmin(admin.ModelAdmin):
  def has_add_permission(self, request):
    num_objects = self.model.objects.count()
    if num_objects >= 1:
      return False
    else:
      return True

admin.site.register(Lafiambrera_Currency, CurrencyAdmin)
admin.site.register(MoneyToWallet)
admin.site.register(WalletPayment)
admin.site.register(PaypalPaymentDetails)
admin.site.register(Wallet)
admin.site.register(WalletOrder)


