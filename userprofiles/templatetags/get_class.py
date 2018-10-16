from django import template
register = template.Library()


@register.filter(name='get_class')
def get_class(value):
    try:
        css_class = value.lower().split(' ')
        if len(css_class) > 1:
            return "{}_{}".format(css_class[0], css_class[1])
        else:
            print(2)
    except:
        pass
    return ''