from django.db import models
from payments.choices import PAYPAL, REDSYS, SUCCESS, ERROR, PENDING, \
    SIGNATURE_ERROR


class PaymentStatusMixin(object):
    def success(self):
        return super(PaymentStatusMixin, self).get_queryset().filter(
            payment_status=SUCCESS
        )

    def error(self):
        return super(PaymentStatusMixin, self).get_queryset().filter(
            payment_status=ERROR
        )

    def pending(self):
        return super(PaymentStatusMixin, self).get_queryset().filter(
            payment_status=PENDING
        )

    def signature_error(self):
        return super(PaymentStatusMixin, self).get_queryset().filter(
            payment_status=SIGNATURE_ERROR
        )


class PaypalManager(PaymentStatusMixin, models.Manager):
    def get_queryset(self):
        return super(PaypalManager, self).get_queryset().filter(
            payment_type=PAYPAL)


class RedSysManager(PaymentStatusMixin, models.Manager):
    def get_queryset(self):
        return super(PaypalManager, self).get_queryset().filter(
            payment_type=REDSYS)
