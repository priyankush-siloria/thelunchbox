# Django modules
from django.db import models

# Fiambrera modules
from userprofiles.models import CheckoutPromoCode
from orders.models import Order
from payments.managers import PaypalManager, RedSysManager
from .choices import *
from userprofiles.models import *
from django.contrib.auth.models import (BaseUserManager, AbstractBaseUser, PermissionsMixin, User)
import uuid
# Thirth party modules
from sermepa.models import SermepaResponse
from paypal.standard.ipn.models import PayPalIPN


class Payment(models.Model):

    """Order payment. Defines the status, payment type and some needed
    payment details.

    """

    # Metadata
    created = models.DateTimeField(auto_now_add=True)
    modified = models.DateTimeField(auto_now=True)

    # Related fields
    order = models.OneToOneField(Order, related_name="payment")

    # Attributes
    status = models.CharField(max_length=3, choices=PAYMENT_STATUS, default="pen")
    payment_type = models.CharField(max_length=3,
                                    choices=PAYMENT_TYPES, default="zbl")
    sermepa_response = models.ForeignKey(SermepaResponse, blank=True,
                                         null=True, help_text="Response for"
                                         " redsys payments")
    paypal_response = models.ForeignKey(PayPalIPN, blank=True, null=True,
                                        help_text="Response for paypal "
                                        "payments")
    amount = models.DecimalField(decimal_places=2, max_digits=10)
    error_message = models.TextField(blank=True, help_text="Error message"
                                     " for error status")
    coupon = models.ForeignKey(CheckoutPromoCode, on_delete=models.SET_NULL,
                               blank=True, null=True)
    # Managers
    paypal = PaypalManager()
    redsys = RedSysManager()
    objects = models.Manager()

    def __str__(self):
        return "Payment for order {0} - {1}".format(self.order.id,
                                                    self.get_status_display())


class Lafiambrera_Currency(models.Model):
    OneEuro=models.IntegerField(blank=False)

    def __str__(self):
        return str(self.id)


class MoneyToWallet(models.Model):
    uuid = models.UUIDField(default=uuid.uuid4, editable=False)
    user = models.ForeignKey(User, blank=False, null=False)
    amount=models.FloatField(blank=False,null=False)
    lafiambera_credit=models.FloatField(blank=False,null=False)
    status=models.BooleanField(default=False)


    def __str__(self):
        return str(self.user)
class WalletPayment(models.Model):
    moneytowallet = models.OneToOneField(MoneyToWallet, null=False, blank=False)
    created = models.DateTimeField(auto_now_add=True)
    modified = models.DateTimeField(auto_now=True)
    # Attributes
    status = models.CharField(max_length=3, choices=PAYMENT_STATUS, default="pen")
    payment_type = models.CharField(max_length=3,
                                    choices=PAYMENT_TYPES, default="zbl")
    sermepa_response = models.ForeignKey(SermepaResponse, blank=True,
                                         null=True, help_text="Response for"
                                         " redsys payments")
    paypal_response = models.ForeignKey(PayPalIPN, blank=True, null=True,
                                        help_text="Response for paypal "
                                        "payments")
    amount = models.DecimalField(decimal_places=2, max_digits=10)
    error_message = models.TextField(blank=True, help_text="Error message"
                                     " for error status")
    # Managers
    paypal = PaypalManager()
    redsys = RedSysManager()
    objects = models.Manager()

    def __str__(self):
        return "Payment for Wallet {0} - {1}".format(self.moneytowallet.id,
                                                    self.get_status_display())

class PaypalPaymentDetails(models.Model):
    payfor = models.CharField(max_length=20, blank=False, null=True, verbose_name="Payment For")
    payuiid = models.CharField(max_length=200, blank=False, null=False, verbose_name="Payment UIID")
    paypal_paymentid = models.CharField(max_length=200, blank=False, null=False, verbose_name="Paypal Payment ID")
    paypal_token = models.CharField(max_length=200, blank=False, null=True, verbose_name="Paypal Transaction Token")
    payer_id = models.CharField(max_length=200, blank=False, null=True, verbose_name="Customer Paypal ID")
    status = models.BooleanField(default=False, verbose_name="Status")

    def __str__(self):
        return str(self.payuiid)

class Wallet(models.Model):
    user = models.ForeignKey(User, blank=False, null=False)
    amount=models.FloatField(default=0.0,blank=False,null=False)
    lafiambera_credit=models.FloatField(default=0.0,blank=False,null=False)

    def __str__(self):
        return str(self.user)
        
class WalletOrder(models.Model):
    user = models.ForeignKey(User, blank=False, null=False, verbose_name="User")
    order = models.ForeignKey(Order, blank=False, null=False, verbose_name="Order")
    wallet = models.ForeignKey(Wallet, blank=False, null=False, verbose_name="Wallet" )
    paymentgateway = models.FloatField(max_length=20, blank=False, null=True, verbose_name="Payment Gateway")
    status = models.BooleanField(default=False, verbose_name="Status")

    def __str__(self):
        return str(self.user)