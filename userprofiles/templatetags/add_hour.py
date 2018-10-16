from django import template
from datetime import datetime,timedelta

register = template.Library()

@register.filter(name='add_hour')
def add_hour(given_time):
	

	hour_after=given_time+timedelta(hours=1)
	# return_data=hour_after.strftime('%H:%M')
	return hour_after

