#!/usr/bin/env python
# -*- coding: utf-8 -*-


from django.db import models
from restaurant.helpers import get_file_path
from django.contrib.auth.models import (BaseUserManager, AbstractBaseUser, PermissionsMixin, User)
from easy_thumbnails.fields import ThumbnailerImageField
from mainapp.models import Category
from autoslug import AutoSlugField
from django.db.models import Count
import orders, userprofiles
import collections
import datetime
from userprofiles import choices
from django.db.models.query import Q
from django.utils import timezone
from ckeditor_uploader.fields import RichTextUploadingField


class Customer(models.Model):
    name = models.CharField(max_length=255, blank=False, null=True, verbose_name='Customer name')
    address = models.CharField(max_length=255, blank=False, null=True, verbose_name='Address')
    street = models.CharField(max_length=255, blank=False, null=True, verbose_name='Street')
    city = models.CharField(max_length=50, blank=False, null=True, default='Barcelona', verbose_name='City')
    state = models.CharField(max_length=50, blank=False, null=True, default='Catalonia',verbose_name='State full')
    country = models.CharField(max_length=255, blank=False, null=True, verbose_name='Country')
    zip_code = models.CharField(max_length=10, blank=False, null=True, verbose_name='Zip Code')
    door_num = models.TextField(blank=True,null=True,verbose_name='Door Number')
    building_num = models.TextField(blank=True,null=True,verbose_name='Building Number')
    user = models.ForeignKey(User, null=True, blank=True, verbose_name='User')
    def __str__(self):
        return self.name

class Profile(models.Model):
    # 'c_' is catering
    user = models.OneToOneField(User, unique=True, blank=True, null=True, verbose_name='User', on_delete=models.CASCADE)
    phone = models.CharField(max_length=50, blank=False, null=True, verbose_name='Phone Number')

    customer = models.ForeignKey(Customer, null=True, blank=True, verbose_name='Customer')
    lang = models.CharField(max_length=2, null=True, blank=True, default='en', verbose_name='Prefered language')
    accounts_status=models.IntegerField(default=0, verbose_name='Acoount type')

    def __str__(self):
        return str(self.user)
    def is_restaurant(self):
        return True if self.user.groups.filter(name="Restaurant").exists() and self.user.is_active else False

    def is_employee(self):
        return True if self.user.groups.filter(name="Employee").exists() and self.user.is_active else False
    def is_customer(self):
        return True if self.user.groups.filter(name="Customer").exists() and self.user.is_active else False


    def is_filled(self):
        if self.is_restaurant():
            try:
                restaurant = Restaurant.objects.get(user=self.user)
                return True \
                    if restaurant.name and \
                       restaurant.address and \
                       restaurant.phone and \
                       self.user.first_name and \
                       self.user.last_name and \
                       self.user.email and \
                       self.phone else False
            except Restaurant.DoesNotExist:
                return False
        else:
            return True if self.phone and self.customer else False

    def get_user_status(self):
        if self.is_restaurant():
            return "a restaurant"
        elif self.is_employee():
            return "an admin"
        else:
            return "a customer"

    def empty_baskets(self):
        return orders.models.Basket.objects.filter(user=self.user,
                                                   is_catering=False).exists()

User.profile = property(lambda u: Profile.objects.get_or_create(user=u)[0])


class Restaurant(models.Model):
    user = models.ForeignKey(User, blank=True, null=True, verbose_name='User account')
    logo = ThumbnailerImageField(blank=True, null=True, verbose_name='Restaurant logo')
    name = models.CharField(max_length=255, blank=False, null=True, verbose_name='Name of restaurant')
    desc = RichTextUploadingField(blank=False, null=True)
    address = models.CharField(max_length=255, blank=False, null=True, verbose_name='Address')
    city = models.CharField(max_length=50, blank=True, default='Barcelona', null=True, verbose_name='City')
    state = models.CharField(max_length=50, blank=True, default='Catalonia', null=True, verbose_name='State')
    street = models.CharField(max_length=50, blank=True, default='Unknown', null=True, verbose_name='Street')
    floor = models.CharField(max_length=50, blank=True, default='0', null=True, verbose_name='Floor No')
    door = models.CharField(max_length=50, blank=True, default='0', null=True, verbose_name='Door No')
    country = models.CharField(max_length=50, blank=True, default='Spain', null=True, verbose_name='Country')
    zip_code = models.CharField(max_length=30, blank=True, null=True, verbose_name='Zip code')
    phone = models.CharField(max_length=30, blank=False, null=True, verbose_name='Phone Number')
    min_order = models.IntegerField(blank=True, null=True, default=1, verbose_name='Minimal Order')
    website = models.URLField(null=True, blank=True, verbose_name='Website')
    facebook = models.URLField(null=True, blank=True, verbose_name='Facebook')
    twitter = models.URLField(null=True, blank=True, verbose_name='Twitter')
    instagram = models.URLField(null=True, blank=True, verbose_name='Instagram')
    slug = AutoSlugField(null=True, blank=True, populate_from='name', unique_with=['name'], verbose_name='Slug')
    photoshoot_requested = models.BooleanField(null=False, blank=True, default=False, verbose_name='Photoshoot requested?')
    publishing_requested = models.BooleanField(null=False, blank=True, default=False, verbose_name='Published requested?')
    published = models.BooleanField(null=False, blank=False, default=False, verbose_name='Published?')
    rate = models.FloatField(default=10.0, null=True, blank=False, verbose_name='Restaurant rate %')
    is_confirmed = models.BooleanField(default=False, verbose_name='Is confirmed?')
    is_premium = models.BooleanField(default=False, verbose_name='Is premium account?')
    opening_hours = models.TextField(blank=False, null=True, verbose_name='Opening hours')

    def __str__(self):
        return self.name

    def get_lunchboxes(self):
        return Lunchbox.objects.filter(restaurant=self, available_till__gte=datetime.datetime.now(), published=True)

    def get_images(self):
        return RestaurantImage.objects.filter(restaurant=self)

    def has_lunchboxes(self):
        return True if self.name != '' \
                       and self.desc != '' \
                       and self.address != '' \
                       and self.city != '' \
                       and self.state != '' \
                       and self.zip_code != '' \
                       and self.phone != '' \
                       and self.min_order != '' \
                       and self.get_lunchboxes() \
            else False

    def is_filled(self):
        return True if self.has_lunchboxes() else False

    def get_today_orders(self):
        o = orders.models.OrderItem.objects.filter(
            lunchbox__restaurant=self,
            delivery_date__day=datetime.datetime.now().day,
            order__u_is_paid=True
        ).values('lunchbox__id').distinct()
        order_list = []
        for k in o:
            order_list.append(Lunchbox.objects.get(id=int(k['lunchbox__id'])))
        return order_list

    def get_hours(self):
        times = [x for x in range(12, 16)]
        return times

    def get_reviews(self):
        asd = RestaurantReview.objects.filter(restaurant=self).order_by('datetime')
        print "\n\n\n",asd,"\n\n\n"
        return RestaurantReview.objects.filter(restaurant=self).order_by('datetime')

    def has_contract(self):
        return RestaurantContract.objects.get(restaurant=self) or None

    def get_notifications(self):
        lb_feedback = len(LunchboxFeedback.objects.filter(restaurant=self, watched=False, inc=True))
        admin_messages = len(LunchboxAdminMessage.objects.filter(lunchbox__restaurant=self, watched=False, inc=True))
        new_orders = OrderNotification.objects.filter(
            order_item__lunchbox__restaurant=self, watched=False).count()
        return lb_feedback + admin_messages + new_orders

    def get_delivery_distances(self):
        return RestaurantDelivery.objects.filter(restaurant=self, possible=True)

    def get_coupon(self):
        coupon = RestaurantDiscountCoupon.objects.filter(restaurant=self, available_till__gte=datetime.datetime.now()).first()
        return coupon

    def get_promo_codes(self):
        return CheckoutPromoCode.objects.filter(restaurant=self)

    def get_opening_hours(self):
        today_weekday = timezone.now().strftime("%a")
        shifts = Shift.objects.filter(restaurant=self, week_day=today_weekday)
        if shifts:
            return shifts
        else:
            return False
    def is_open(self, timestamp):
        """Returns if the restaurant is open

        Arguments:
            timestamp - DateTime to be checked

        """
        restaurant_shifts = self.shifts.all()

        for shift in restaurant_shifts:
            if timestamp.strftime("%a") == shift.week_day:
                return True
        return False


class RestaurantImage(models.Model):
    restaurant = models.ForeignKey(Restaurant, null=True, blank=True,
                                   verbose_name='Restaurant')
    image = ThumbnailerImageField(blank=True, null=True, verbose_name='Image')

    def __str__(self):
        return self.restaurant.name


class RestaurantReview(models.Model):
    user = models.ForeignKey(User, null=True, blank=False, verbose_name='User')
    restaurant = models.ForeignKey(Restaurant, null=True, blank=False, verbose_name='Restaurant')
    msg = models.CharField(max_length=255, null=True, blank=False, verbose_name='Message')
    datetime = models.DateTimeField(null=True, blank=False, auto_now_add=True, verbose_name='Date and time')

    def __str__(self):
        return self.restaurant.name


class Shift(models.Model):
    # Relations
    week_day = models.CharField(choices=choices.WEEK_DAYS, max_length=3)
    restaurant = models.ForeignKey(Restaurant, related_name="shifts",
                                   null=True, blank=True)
    # Attributes
    start = models.TimeField()
    end = models.TimeField()

    def __unicode__(self):
        return str(self.restaurant)


class RestaurantDiscountCoupon(models.Model):

    """Restaurant coupon to print and exchange it in person"""

    restaurant = models.ForeignKey(Restaurant, null=True, blank=False,
                                   verbose_name='Restaurant')
    available_from = models.DateField(null=True, blank=False,
                                      verbose_name='Available from')
    available_till = models.DateField(null=True, blank=False,
                                      verbose_name='Available till')
    time_from = models.TimeField(null=True, blank=False,
                                 verbose_name='Time from')
    time_till = models.TimeField(null=True, blank=False,
                                 verbose_name='Time till')
    discount_text = models.CharField(max_length=50, null=True, blank=True,
                                     verbose_name='Discount text')
    percent = models.FloatField(null=True, blank=True,
                                  verbose_name='Percent')

    def __str__(self):
        return str(self.id)


class CheckoutPromoCode(models.Model):

    """Coupon to exchange in the checkout page. Created in the admin page"""

    promo_code = models.CharField(max_length=15, null=True, blank=False,
                                  verbose_name='Promo code')
    percent = models.FloatField(null=True, blank=False,
                                verbose_name='Discount percent')
    qty = models.IntegerField(null=True, blank=False,
                              verbose_name='Quantity of codes')
    date_from = models.DateField(null=True, blank=False,
                                 verbose_name='Date from')
    date_till = models.DateField(null=True, blank=False,
                                 verbose_name='Date till')
    used_by = models.ManyToManyField(User, related_name="used_coupons",
                                     blank=True)

    def __str__(self):
        return "Code: {}, Percent: {}%, Quantity: {}".format(
            self.promo_code, self.percent, self.qty)

    def is_valid(self, user):
        """Returns if the coupon is valid.
        1- Assert date_till is greater than now
        2- Assert date_from is older than now (both compared with localtime)
        3- Assert is not already used by provided user

        """
        now_localtime = timezone.localtime(timezone.now()).date()
        return self.date_from <= now_localtime <= self.date_till \
            and user not in self.used_by.all()


class City(models.Model):
    name = models.CharField(max_length=100, null=True, blank=False, verbose_name='Name')

    def __str__(self):
        return self.name


class RestaurantDelivery(models.Model):
    restaurant = models.ForeignKey(Restaurant, null=True, blank=False, verbose_name='Restaurant')
    city = models.ForeignKey(City, null=True, blank=False, verbose_name='City')
    possible = models.BooleanField(default=False, verbose_name='Delivery is possible?')

    def __str__(self):
        return "{}: {}".format(self.city, self.possible)


class RestaurantContract(models.Model):
    restaurant = models.ForeignKey(Restaurant, null=True, blank=False, verbose_name='Restaurant')
    text = models.TextField(null=True, blank=False, verbose_name='Contract text')

    def __str__(self):
        return self.restaurant.name


class Lunchbox(models.Model):
    restaurant = models.ForeignKey(Restaurant, blank=True, null=True, verbose_name='Restaurant')
    name = models.CharField(max_length=100, blank=False, null=True, verbose_name='Name of lunchbox')
    desc = RichTextUploadingField(blank=False, null=True)
    # CARE! No smart rounding. Allways DecimalField for money! :-(
    price = models.FloatField(blank=False, null=True, verbose_name='Price')
    available_from = models.DateField(null=True, blank=False, verbose_name='Available from')
    available_till = models.DateField(null=True, blank=False, verbose_name='Available till')
    # total_calories = models.IntegerField(null=True, blank=True, verbose_name='Total calories (KCal)')
    protein = models.FloatField(null=True, blank=True, verbose_name='Protein (Gr)')
    carbohydrates = models.FloatField(null=True, blank=True, verbose_name='Carbohydrates (Gr)')
    fat = models.FloatField(null=True, blank=True, verbose_name='Fat (Gr)')
    sugar = models.FloatField(null=True, blank=True, verbose_name='Sugar (Gr)')
    sodium = models.FloatField(null=True, blank=True, verbose_name='Sodium (Mgr)')
    published = models.BooleanField(null=False, blank=False, default=False, verbose_name='Published?')
    # useless_date=models.DateField(null=True,blank=True)
    # useless_time=models.CharField(max_length=100,null=True,blank=True)
    photoshoot_requested = models.BooleanField(null=False, blank=True, default=False, verbose_name='Photoshoot requested?')
    publishing_requested = models.BooleanField(null=False, blank=True, default=False, verbose_name='Published requested?')
    date = models.DateTimeField(null=True, blank=False, auto_now=True, verbose_name='Last saved date')

    rate = models.DecimalField(null=True, blank=False, max_digits=10,
                               decimal_places=2,
                               verbose_name='La Fiambrera rate')
    category=models.ForeignKey(Category,verbose_name='lunchbox category',null=True)
    vat = models.FloatField(blank=False, null=True, verbose_name='Vat', default=0)
    def __str__(self):
        return str(self.name)

    def get_images(self):
        try:
            image = LunchboxImage.objects.filter(lunchbox=self)
            
            return image
        except LunchboxImage.DoesNotExist:
            return "blank"

    def get_image(self):
        """ Returns: first lunchbox image """
        try:

            images = LunchboxImage.objects.filter(lunchbox=self)
            if images:
                image= LunchboxImage.objects.filter(lunchbox=self)[0] 
                return image
            else:
                image=[]
                return image
        except Exception as r:
            return False

    def get_orders_by_hours(self):
        """ Returns: today's orders by hours for control restaurant/admin dashboard """
        hours = {
             #9: 0, 10: 0, 11: 0,
            12: 0, 13: 0, 14: 0,
            15: 0#, 16: 0, 17: 0,
            # 18: 0, 19: 0, 20: 0,
            # 21: 0, 22: 0, 23: 0
        }

        for o in orders.models.OrderItem.objects.filter(lunchbox__restaurant=self.restaurant, delivery_date__day=datetime.datetime.now().day, lunchbox__name=self.name):
            hours[o.delivery_date.time().hour] += 1
        return hours

    def get_discounts(self):
        """ Returns: lunchbox discount list """
        return LunchboxDiscount.objects.filter(lunchbox=self)

    def get_images_qty_diff(self):
        """ Returns: number of empty (not uploaded) images for lunchbox admin """
        max_num = 5
        images_qty = LunchboxImage.objects.filter(lunchbox=self).count()
        return [x + 1 for x in range(images_qty, max_num)]

    def get_privileges(self):
        """ Returns: lunchbox privilegies like: no gmo, no lactose e.t.c """
        return LunchboxPrivilegesItem.objects.filter(lunchbox=self)

    def nfacts_is_filled(self):
        """ Returns: True if nutrition facts is filled, else False """
        return True if self.get_total_calories() else False

    def get_min_order(self):
        # max_order = (self.restaurant.min_order + 10) if self.restaurant.min_order else 10
        # return range(self.restaurant.min_order, max_order) if self.restaurant.min_order else range(1, max_order)
        return range(1, 11)

    @staticmethod
    def get_range():
        # return range(1, 11) used on Quantity selected_box
        return range(1, 11)

    def get_orders_qty(self):
        """ Returns: number of orders for current lunchbox """
        return '{:04d}'.format(len(orders.models.OrderItem.objects.filter(order__u_is_paid=True, lunchbox=self)))

    def get_feedback(self):
        """ Returns: lunchbox feedback list """
        return LunchboxFeedback.objects.filter(lunchbox=self).order_by('datetime')

    def get_rating(self):
        """ Returns: average rating for lunchbox """
        ratings = LunchboxRating.objects.filter(lunchbox=self)
        if len(ratings) > 0:
            ratings_sum = 0
            for r in ratings:
                ratings_sum += r.rating
            rating_avg = ratings_sum / float(len(ratings))
        else:
            return 0
        return rating_avg

    def get_rating_int(self):
        """ Returns: integer rating for stars in template """
        return [x for x in range(int(self.get_rating()))]

    def get_rating_diff(self):
        """ Returns: empty stars for rating in template """
        return [x for x in range(len(self.get_rating_int()), 5)]

    def get_count_of_rating_1(self):
        return len(LunchboxRating.objects.filter(rating=1, lunchbox=self)) or 0

    def get_count_of_rating_2(self):
        return len(LunchboxRating.objects.filter(rating=2, lunchbox=self)) or 0

    def get_count_of_rating_3(self):
        return len(LunchboxRating.objects.filter(rating=3, lunchbox=self)) or 0

    def get_count_of_rating_4(self):
        return len(LunchboxRating.objects.filter(rating=4, lunchbox=self)) or 0

    def get_count_of_rating_5(self):
        return len(LunchboxRating.objects.filter(rating=5, lunchbox=self)) or 0

    def get_total_purchase(self):
        lb_orders = orders.models.OrderItem.objects.filter(lunchbox=self, order__u_is_paid=True)
        total = 0
        for o in lb_orders:
            total += o.lunchbox.price * o.qty
        return total

    def get_requests(self):
        return '{:04d}'.format(len(LunchboxRequest.objects.filter(lunchbox=self)))

    def get_admin_communication(self):
        return LunchboxAdminMessage.objects.filter(lunchbox=self).order_by('-id')

    def get_customer_orders_qty(self):
        current_time = timezone.now()
        delivery_date = current_time.replace(hour=13, minute=00, second=0,
                                      microsecond=0)
        orders_len = len(orders.models.OrderItem.objects.filter(
                order__u_is_paid=True,
                lunchbox=self,
                order__user__profile__customer__isnull=False,
                delivery_date=delivery_date
        ))
        return orders_len

    def get_customer_orders_amount(self):
        current_time = timezone.now()
        delivery_date = current_time.replace(hour=13, minute=00, second=0,
                                      microsecond=0)
        all_orders = orders.models.OrderItem.objects.filter(
                order__u_is_paid=True,
                lunchbox=self,
                order__user__profile__customer__isnull=False,
                delivery_date=delivery_date
        )
        return "{0:.2f}".format(self.get_orders_total(all_orders))

    def get_total_orders_amount(self):
        all_orders = orders.models.OrderItem.objects.filter(
                order__u_is_paid=True,
                lunchbox=self
        )
        amount = 0
        for o in all_orders:
            amount += o.lunchbox.price * o.qty
        return amount

    def get_total_calories(self):
        if self.fat is not None and self.carbohydrates is not None and self.protein is not None:
            return int(9.3 * self.fat + 4.1 * self.carbohydrates + 4.1 * self.protein)
        else:
            return False

    def get_total_sold_lunchboxes(self):
        items = orders.models.OrderItem.objects.filter(lunchbox=self,
                                                       order__u_is_paid=True)
        qty = 0
        for item in items:
            qty += item.qty
        return qty

    def get_total_earned(self):
        items = orders.models.OrderItem.objects.filter(lunchbox=self,
                                                       order__u_is_paid=True)
        discounts = userprofiles.models.LunchboxDiscount.objects.filter(
            lunchbox=self)
        total = 0

        if items:
            if discounts:

                dates = []

                for item in items:
                    # if item.order.date.hour >= 11:
                    #     date_from = item.order.date.replace(hour=11, minute=00,
                    #                                         second=00,
                    #                                         microsecond=00)
                    #     date_to = item.order.date + datetime.timedelta(days=1)
                    #     date_to = date_to.replace(hour=10, minute=59,
                    #                               second=59, microsecond=999999)
                    # else:
                    #     date_from = item.order.date - datetime.timedelta(days=1)
                    #     date_from = date_from.replace(hour=11, minute=00,
                    #                                   second=00,
                    #                                   microsecond=00)
                    #     date_to = item.order.date.replace(hour=10, minute=59,
                    #                                       second=59,
                    #                                       microsecond=999999)

                    if item.delivery_date not in dates:
                        dates.append(item.delivery_date)

                        orders_in_interval = orders.models.OrderItem.objects\
                            .filter(
                                Q(lunchbox=self),
                                Q(order__u_is_paid=True),
                                Q(delivery_date=item.delivery_date))

                        total += self.get_orders_total(orders_in_interval)
            else:
                total = self.price

        return "{0:.2f}".format(total)

    def get_average_price(self):
        if self.get_total_earned():
            return "{0:.2f}".format(self.get_total_earned() /
                                    self.get_total_sold_lunchboxes())
        return None

    def get_orders_total(self, orders_in_interval):
        total = 0
        if orders_in_interval:
            discounts = userprofiles.models.LunchboxDiscount.objects.filter(
                lunchbox=self).order_by('-qty')
            orders_qty = 0
            for order in orders_in_interval:
                orders_qty += order.qty

            orders_to_discount = orders_qty
            if orders_qty:
                for d in discounts:
                    if orders_to_discount >= d.qty:
                        orders_to_apply_discount = \
                            orders_to_discount - d.qty + 1
                        total += orders_to_apply_discount * self.price * \
                                 (100 - d.percent) / 100
                        orders_to_discount -= orders_to_apply_discount

                if orders_to_discount:
                    total += orders_to_discount * self.price
        return total


class LunchboxImage(models.Model):
    lunchbox = models.ForeignKey(Lunchbox, null=True, blank=True, verbose_name='Lunchbox')
    image = ThumbnailerImageField(blank=True, null=True, verbose_name='Image')

    def __str__(self):
        return self.lunchbox.name


class LunchboxPrivileges(models.Model):
    title = models.CharField(max_length=50, null=True, blank=False, verbose_name='Title')
    image = ThumbnailerImageField(blank=False, null=True, verbose_name='Image')

    def __str__(self):
        return self.title

    class Meta:
        verbose_name_plural = 'Lunchbox Privileges'
        verbose_name = 'Lunchbox privilege'


class LunchboxPrivilegesItem(models.Model):
    lunchbox = models.ForeignKey(Lunchbox, null=True, blank=False, verbose_name='Lunchbox')
    privilege = models.ForeignKey(LunchboxPrivileges, null=True, blank=False, verbose_name='Privilege')

    def __str__(self):
        return self.lunchbox.name


class LunchboxDiscount(models.Model):
    lunchbox = models.ForeignKey(Lunchbox, null=True, blank=False, verbose_name='Lunchbox')
    percent = models.FloatField(null=True, blank=False, verbose_name='Discount percent')
    qty = models.IntegerField(null=True, blank=False, verbose_name='Discount qty')

    def __str__(self):
        return self.lunchbox.name


class LunchboxRating(models.Model):
    lunchbox = models.ForeignKey(Lunchbox, null=True, blank=False, verbose_name='Lunchbox')
    user = models.ForeignKey(User, null=True, blank=False, verbose_name='User')
    rating = models.IntegerField(null=True, blank=False, verbose_name='Rating')

    def __str__(self):
        return "{}: {}".format(self.lunchbox.name, self.rating)


class LunchboxFeedback(models.Model):
    lunchbox = models.ForeignKey(Lunchbox, null=True, blank=False, verbose_name='Lunchbox')
    user = models.ForeignKey(User, null=True, blank=False, verbose_name='User')
    restaurant = models.ForeignKey(Restaurant, null=True, blank=False, verbose_name='Restaurant')
    msg = models.CharField(max_length=255, null=True, blank=False, verbose_name='Message')
    inc = models.BooleanField(default=True, verbose_name='Incoming?')
    watched = models.BooleanField(default=False, verbose_name='Watched?')
    datetime = models.DateTimeField(null=True, blank=False, auto_now_add=True, verbose_name='Date and time')
    priority = models.IntegerField(default=4, null=True, blank=True, verbose_name='Priority')

    def __str__(self):
        return self.lunchbox.name


class LunchboxRequest(models.Model):
    lunchbox = models.ForeignKey(Lunchbox, null=True, blank=False, verbose_name='Lunchbox')
    user = models.ForeignKey(User, null=True, blank=False, verbose_name='User')

    def __str__(self):
        return self.lunchbox.name


class LunchboxAdminMessage(models.Model):
    lunchbox = models.ForeignKey(Lunchbox, null=True, blank=False, verbose_name='Lunchbox')
    user = models.ForeignKey(User, null=True, blank=True, verbose_name='User')
    msg = models.CharField(max_length=255, null=True, blank=False, verbose_name='Admin message')
    inc = models.BooleanField(default=True, verbose_name='Incoming?')
    watched = models.BooleanField(default=False, verbose_name='Watched?')
    priority = models.IntegerField(default=4, null=True, blank=True, verbose_name='Priority')
    date = models.DateTimeField(null=True, blank=False, auto_now=True, verbose_name='Date')

    def __str__(self):
        return self.msg


# To notify the admin about photoshoot and publishing requests
class AdminNotification(models.Model):
    lunchbox = models.ForeignKey(Lunchbox, null=True, blank=False, verbose_name='Lunchbox')
    archived = models.BooleanField(default=False, verbose_name='Is ')
    priority = models.IntegerField(default=4, null=True, blank=True, verbose_name='Priority')
    restaurant = models.ForeignKey(Restaurant, null=True, blank=False,
                                   default=None, verbose_name='Restaurant')

    def __str__(self):
        return str(self.id)


class OrderNotification(models.Model):
    order_item = models.ForeignKey('orders.OrderItem', null=True, blank=False,
                                   verbose_name="Item")
    watched = models.BooleanField(default=False, verbose_name='Watched?')
    priority = models.IntegerField(default=4, null=True, blank=True,
                                   verbose_name='Priority')

    def __str__(self):
        return self.order_item.lunchbox.name


class Activation(models.Model):
    user = models.ForeignKey(User, null=True, blank=True, verbose_name='User')
    email = models.EmailField(blank=False, null=True, verbose_name='Email')
    key = models.CharField(max_length=255, blank=False, null=True)
    date = models.DateTimeField(auto_now=True, null=True, blank=True, verbose_name='Date')

    def __str__(self):
        return "{} {} {}".format(self.user.first_name, self.user.last_name, self.user.email)


class ServiceRating(models.Model):
    order = models.ForeignKey('orders.Order', verbose_name='Order')
    rating = models.IntegerField(blank=False, null=False,
                                 verbose_name='Rating')

    def __str__(self):
        return "{} {}".format(self.order.id, self.rating)
