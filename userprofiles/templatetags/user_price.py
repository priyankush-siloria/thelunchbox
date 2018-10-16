from django import template
from django.contrib.auth.models import User
from userprofiles.models import Lunchbox, LunchboxDiscount
from orders.models import OrderItem
from django.db.models import Q
from datetime import timedelta, datetime
from django.utils import timezone

register = template.Library()


@register.filter(name='user_price')
def user_price(lunchbox_id, user_id):
    # Your price
    try:
        lunchbox = Lunchbox.objects.get(id=lunchbox_id)
        try:
            user = User.objects.get(id=user_id)
            if user.profile.company:
                # current_time = datetime.now()
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

                if orders_qty:
                    discount = LunchboxDiscount.objects.filter(
                        Q(lunchbox=lunchbox) &
                        Q(qty__lte=orders_qty)
                    ).last()

                    if discount:
                        return round(lunchbox.price - (lunchbox.price * discount.percent / 100), 2)
                    else:
                        return lunchbox.price
                else:
                    return lunchbox.price
            else:
                return lunchbox.price
        except User.DoesNotExist:
            return lunchbox.price
    except Lunchbox.DoesNotExist:
        return 0