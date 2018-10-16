from django import template
from django.contrib.auth.models import User
from userprofiles.models import Lunchbox, LunchboxRating
from orders.models import Order
from datetime import timedelta, datetime

register = template.Library()


@register.filter(name='get_user_lunchbox_rating')
def get_user_lunchbox_rating(lunchbox_id, user_id):
    lunchbox = Lunchbox.objects.get(id=lunchbox_id)
    user = User.objects.get(id=user_id)
    try:
        lb_rating = LunchboxRating.objects.get(lunchbox=lunchbox, user=user)
        return lb_rating.rating
    except LunchboxRating.DoesNotExist:
        return False