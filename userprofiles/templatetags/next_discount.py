from django import template
from django.contrib.auth.models import User
from userprofiles.models import Lunchbox, LunchboxDiscount
from orders.models import Order, OrderItem
from django.db.models import Q
from datetime import timedelta
from django.utils import timezone
import pytz

register = template.Library()


@register.filter(name='next_discount')
def next_discount(lunchbox_id, user_id):
    lunchbox = Lunchbox.objects.get(id=lunchbox_id)
    try:
        user = User.objects.get(id=user_id)
        if user.profile.company:
            # current_time = timezone.now().astimezone(pytz.timezone('CET'))
            # if current_time.hour > 12:
            #     date_from = current_time.replace(hour=12, minute=00, second=00, microsecond=00)
            # else:
            #     date_from = current_time - timedelta(days=1)
            #     date_from = date_from.replace(hour=12, minute=00, second=00, microsecond=00)

            current_time = timezone.now()
            delivery_date = current_time.replace(hour=13, minute=00,
                                                 second=0,
                                                 microsecond=0)

            company_orders = OrderItem.objects.filter(
                    Q(order__u_is_paid=True),
                    Q(lunchbox=lunchbox),
                    Q(order__user__profile__company__id=user.profile.company.id),
                    Q(delivery_date=delivery_date)
            )

            orders_qty = 0
            for c in company_orders:
                orders_qty += c.qty

            current_discount = LunchboxDiscount.objects.filter(
                    Q(lunchbox=lunchbox) &
                    Q(qty__lte=orders_qty)
            ).last()

            if not current_discount:
                current_discount = 0

            upcoming_discount = LunchboxDiscount.objects.filter(
                lunchbox=lunchbox,
                qty__gt=orders_qty).first()

            if upcoming_discount:
                if current_discount:
                    current_discount_price = \
                        lunchbox.price * current_discount.percent / 100
                else:
                    current_discount_price = 0
                next_discount_price = \
                    lunchbox.price * upcoming_discount.percent / 100
                new_price = \
                    round(-(next_discount_price - current_discount_price), 2)
                return new_price
            else:
                return False
        else:
            return False
    except User.DoesNotExist:
        discount = LunchboxDiscount.objects.filter(lunchbox=lunchbox).first()
        if discount:
            return round(-(lunchbox.price * discount.percent / 100), 2)
        else:
            return False


