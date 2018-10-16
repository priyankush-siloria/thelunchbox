from django.conf.urls import include, url
from orders import views as order
import sermepa.urls as sermepa_urls

urlpatterns = [
    url(r'^order_payment/$', order.OrderPayment.as_view(),
        name="order_payment"),
    url(r'^paypal/', include('paypal.standard.ipn.urls')),
    url(r'^sermepa/', include(sermepa_urls))
]
