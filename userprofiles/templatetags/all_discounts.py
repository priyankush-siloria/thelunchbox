from django import template
from userprofiles.models import Lunchbox, LunchboxDiscount

register = template.Library()

@register.filter(name='all_discounts')
def all_discounts(lunchbox_id):
	lunchbox_detail = Lunchbox.objects.get(id=lunchbox_id)
	price = lunchbox_detail.price
	discounts_results = []

	discounts = LunchboxDiscount.objects.filter(lunchbox_id=lunchbox_id)
	for discount in discounts:
		qty = discount.qty
		percent = discount.percent
		
		discounted_price = qty * price * percent / 100
		discounts_results.append({'qty': qty, 'percent': percent, 'discounted_price': discounted_price})
	return discounts_results

