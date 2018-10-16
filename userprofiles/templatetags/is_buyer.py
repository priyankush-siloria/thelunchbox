from django import template
from django.contrib.auth.models import User
from userprofiles.models import Restaurant
from orders.models import Order, OrderItem
register = template.Library()


@register.filter(name='is_buyer')
def is_buyer(restaurant_id, user_id):
    try:
        restaurant = Restaurant.objects.get(id=restaurant_id)
        user = User.objects.get(id=user_id)
        user_orders_count = OrderItem.objects.filter(
            lunchbox__restaurant=restaurant, order__user=user,
            order__u_is_paid=True).count()
        if user_orders_count > 0:
            return True
        else:
            return False
    except Order.DoesNotExist:
        return False
