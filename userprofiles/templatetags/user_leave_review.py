from django import template
from django.contrib.auth.models import User
from userprofiles.models import Restaurant, RestaurantReview
from orders.models import Order
register = template.Library()


@register.filter(name='user_leave_review')
def user_leave_review(restaurant_id, user_id):
    r = Restaurant.objects.get(id=restaurant_id)
    user = User.objects.get(id=user_id)

    try:
        RestaurantReview.objects.get(restaurant=r, user=user)
        return True
    except RestaurantReview.DoesNotExist:
        return False
