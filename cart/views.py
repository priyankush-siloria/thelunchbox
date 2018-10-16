from easycart import BaseCart

# We assume here that you've already defined your item model
# in a separate app named "userprofiles".
#from userprofiles.models import Lunchbox
from userprofiles.models import Lunchbox

class Cart(BaseCart):

    def get_queryset(self, pks):
        return Lunchbox.objects.filter(pk__in=pks)