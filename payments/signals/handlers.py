# Fiambrera modules
from orders.models import Order
from payments import choices as payment_choices
from userprofiles.models import CheckoutPromoCode

# Thirth party modules
from sermepa.signals import payment_was_successful
from sermepa.signals import payment_was_error
from sermepa.signals import signature_error


def payment_success(sender, **kwargs):
    """The payment is successful.
    Arguments:
    sender -- SermepaResponse object. The field Ds_MerchantData
              is the id associated to the order

    """
    order = Order.objects.get(id=sender.Ds_MerchantData)
    order.u_is_paid = True
    payment = order.payment
    payment.sermepa_response = sender
    payment.status = payment_choices.SUCCESS
    # If the payment is success the coupon is set to used
    payment.coupon.used_by.add(payment.order.user)
    order.save()
    payment.save()


def payment_error(sender, **kwargs):
    """The payment is not successful
    sender -- SermepaResponse object. The field Ds_MerchantData
              is the id associated to the order

    """
    order = Order.objects.get(id=sender.Ds_MerchantData)
    payment = order.payment
    payment.sermepa_response = sender
    payment.status = payment_choices.ERROR
    order.save()
    payment.save()


def sermepa_ipn_error(sender, **kwargs):
    """The signature is invalid
    sender -- SermepaResponse object. The field Ds_MerchantData
              is the id associated to the order

    """
    order = Order.objects.get(id=sender.Ds_MerchantData)
    payment = order.payment
    payment.sermepa_response = sender
    payment.status = payment_choices.SIGNATURE_ERROR
    order.save()
    payment.save()


payment_was_successful.connect(payment_success)
payment_was_error.connect(payment_error)
signature_error.connect(sermepa_ipn_error)
