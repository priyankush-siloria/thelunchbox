from django import template
register = template.Library()


@register.filter(name='percent')
def percent(value, arg):
    try:
        value = float(value)
        arg = int(arg)
        if arg:
            return round(value - (value * arg / 100), 2)
    except:
        pass
    return ''