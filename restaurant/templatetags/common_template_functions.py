from django import template
from django.conf import settings
register=template.Library()
from django.utils.translation import to_locale, get_language
from django.utils import translation


@register.simple_tag
def  baseurl(language=None):
	if language:
		return settings.BASE_URL+language
	else:
		return settings.BASE_URL+translation.get_language()

