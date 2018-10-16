from django import template
from django.contrib.auth.models import User
from django.utils import timezone
from userprofiles.models import Lunchbox
from orders.models import Order, OrderItem
from datetime import timedelta
from django.db.models.query import Q
from datetime import datetime
import pytz

register = template.Library()


@register.filter(name='get_company_orders_qty')
def get_company_orders_qty(lunchbox_id, user_id):
    try:
        lunchbox = Lunchbox.objects.get(id=lunchbox_id)
        
        if user_id != -1:
            user = User.objects.get(id=user_id)
        current_time = timezone.now()
        delivery_date = current_time.replace(hour=13, minute=00, second=0,
                                      microsecond=0)
        est = pytz.timezone('UTC')
        delivery_date = delivery_date.astimezone(est)
        delivery_date = delivery_date.date()
        if user_id == -1 or user.profile.is_restaurant() or user.is_staff:
            print "\n\n\n",lunchbox,"\n\n\n"
            company_orders = OrderItem.objects.filter(
                Q(lunchbox=lunchbox),
                Q(order__u_is_paid=True),
                Q(delivery_date__contains=delivery_date)
            )
        print "order items1=",company_orders,"\n"
        orders_qty = 0
        for c in company_orders:
            print c,"\n"
            orders_qty += c.qty
        return '{:04d}'.format(orders_qty)

    except Lunchbox.DoesNotExist:
        pass
    return ''
