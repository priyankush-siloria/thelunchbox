from django.conf.urls import url
from sermepa.views import sermepa_ipn

urlpatterns = [
    url(r'^$', sermepa_ipn, name="sermepa_ipn")
]
