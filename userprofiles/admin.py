from django import forms
from django.contrib import admin
from django.contrib.auth.models import Group
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from nested_inline.admin import NestedStackedInline, NestedModelAdmin
from django.contrib.auth.forms import ReadOnlyPasswordHashField
from pages.models import Faqs,LunchSteps,ContactUs
from .models import *
from carthandler.models import *



class LunchboxImagesInline(NestedStackedInline):
    model = LunchboxImage
    fk_name = 'lunchbox'
    extra = 1
    max_num = 3


class LunchboxDiscounts(NestedStackedInline):
    model = LunchboxDiscount
    extra = 1
    max_num = 3


class LunchboxAdminMessages(NestedStackedInline):
    model = LunchboxAdminMessage
    extra = 1
    max_num = 1


class LunchboxPrivilegesInline(NestedStackedInline):
    model = LunchboxPrivilegesItem
    extra = 1
    max_num = 3


class LunchboxInline(NestedStackedInline):
    model = Lunchbox
    fk_name = 'restaurant'
    extra = 0
    inlines = [LunchboxImagesInline, LunchboxDiscounts, LunchboxAdminMessages]
    classes = ['collapse']


class RestaurantImageInline(NestedStackedInline):
    model = RestaurantImage
    fk_name = 'restaurant'
    extra = 1
    max_num = 4


class RestaurantContractInline(NestedStackedInline):
    model = RestaurantContract
    fk_name = 'restaurant'
    extra = 1
    max_num = 1


class RestaurantAdmin(NestedModelAdmin):
    model = Restaurant
    list_display = ('name', 'address', 'phone', 'min_order', 'slug', 'lb_num')
    inlines = [RestaurantContractInline, RestaurantImageInline, LunchboxInline]

    def lb_num(self, obj):
        return len(Lunchbox.objects.filter(restaurant=obj)) or 0
    lb_num.short_description = 'Lunchboxes'


class ProfileInline(admin.StackedInline):
    model = Profile
    classes = ('grp-collapse grp-open',)


class UserAdmin(BaseUserAdmin):
    list_display = ['username', 'email', 'first_name', 'last_name', 'is_staff']
    list_filter = ['date_joined', 'is_active']

    def get_form(self, request, obj=None, **kwargs):
        if obj is not None:
            self.inlines = (ProfileInline, )
        return super(UserAdmin, self).get_form(request, obj, **kwargs)

    def is_confirmed(self, obj):
        return True if obj.profile.is_confirmed else False
    is_confirmed.boolean = True


class ActivationAdmin(admin.ModelAdmin):
    list_display = ('email', 'key', 'date')
    search_fields = ('email',)
    date_hierarchy = 'date'
    list_filter = ['date']

    def has_add_permission(self, request):
        return False


class CheckoutPromoCodeAdmin(admin.ModelAdmin):
    list_display = ('promo_code', 'percent', 'qty', 'date_from', 'date_till')


class ServiceRatingAdmin(admin.ModelAdmin):
    list_display = ('order', 'rating')

admin.site.unregister(User)
admin.site.register(User, UserAdmin)
admin.site.register(Customer)
admin.site.register(Restaurant, RestaurantAdmin)
admin.site.register(RestaurantReview)
# admin.site.register(Activation, ActivationAdmin)
# admin.site.register(LunchboxPrivileges)
admin.site.register(LunchboxRating)
admin.site.register(City)
admin.site.register(CheckoutPromoCode, CheckoutPromoCodeAdmin)
admin.site.register(RestaurantDiscountCoupon)
admin.site.register(Shift)
admin.site.register(ServiceRating, ServiceRatingAdmin)
admin.site.register(Lunchbox)
admin.site.register(Profile)
admin.site.register(LunchboxDiscount)
admin.site.register(Faqs)
admin.site.register(LunchSteps)
admin.site.register(ContactUs)
admin.site.register(RestaurantDelivery)
admin.site.register(Cart)
admin.site.register(OrderNotification)
admin.site.register(LunchboxFeedback)
admin.site.register(AdminNotification)