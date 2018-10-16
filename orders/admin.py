# -*- coding: utf-8 -*-
from django.contrib import admin
from . models import *
from userprofiles import models as userprofiles


class BasketAdmin(admin.ModelAdmin):
    list_display = ['user', 'lunchbox', 'qty']


class OrderItemInline(admin.TabularInline):
    model = OrderItem
    extra = 0
    fields = ['delivery_date']


class OrderItemAdmin(admin.ModelAdmin):
    model = OrderItem
    list_display = ['delivery_date', 'order', 'lunchbox', 'qty']
    fieldsets = (
        (None, {
            'fields': ('delivery_date', 'order', 'lunchbox', 'qty')
        }),
        ('Restaurant', {
            'classes': ('collapse',),
            'fields': ('is_processed', 'processed_date', 'is_payment_requested',
                       'payment_request_date', 'is_confirmed_by_lf',
                       'confirmation_by_lf_date', 'is_payment_transferred',
                       'payment_transfer_date'
                       )
        }),
    )


class OrderAdmin(admin.ModelAdmin):
    model = Order
    list_display = ['id', 'user', 'date', 'items', 'total', 'is_catering', 'is_paid']
    search_fields = ['id', 'user__email']
    date_hierarchy = 'date'
    list_filter = ['date']
    inlines = [OrderItemInline]
    fieldsets = (
        (None, {
            'fields': ('user', 'is_catering', 'date',)
        }),
        ('Customer', {
            'classes': ('collapse',),
            'fields': ('u_is_processing', 'u_processing_date_from', 'u_processing_date_till', 'u_is_payment_requested',
                       'u_payment_requested_date', 'u_is_confirmed_by_lf',
                       'u_is_confirmed_by_lf_date', 'u_is_paid'
                       )
        }),
    )

    def is_paid(self, obj):
        return True if obj.u_is_paid else False
    is_paid.boolean = True

    def total(self, obj):
        order_total = 0.0
        for i in obj.get_items():
            order_total += i.lunchbox.price * i.qty
        return "{} €".format(float(order_total))

    def items(self, obj):
        return '<br/>'.join("{} | Qty: {} / {} €".format(i.lunchbox.name, i.qty, i.qty * i.lunchbox.price) for i in obj.get_items())
    items.allow_tags = True

    #
    # def price(self, obj):
    #     if obj.lunchbox.price:
    #         return "{} €".format(obj.lunchbox.price)
    #     else:
    #         return 0
    #
    # def amount(self, obj):
    #     if obj.qty and obj.lunchbox.price:
    #         return "{} €".format(obj.qty * obj.lunchbox.price)
    #     else:
    #         return 0
    #
    # def restaurant(self, obj):
    #     return userprofiles.Lunchbox.objects.get(id=obj.lunchbox.id).restaurant.name


# admin.site.register(Basket, BasketAdmin)
admin.site.register(Order, OrderAdmin)
admin.site.register(OrderItem, OrderItemAdmin)
admin.site.register(Comment)
admin.site.register(OrderDateMail)