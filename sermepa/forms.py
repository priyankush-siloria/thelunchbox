# -*- encoding: utf-8 -*-
from __future__ import unicode_literals
from django import forms
from django.conf import settings
from django.utils.safestring import mark_safe
from sermepa.RedsysCrypto import RedsysCrypto


class SermepaPaymentForm(forms.Form):
    Ds_SignatureVersion = forms.IntegerField(widget=forms.HiddenInput())
    Ds_MerchantParameters = forms.IntegerField(widget=forms.HiddenInput())
    Ds_Signature = forms.IntegerField(widget=forms.HiddenInput())

    def __init__(self, *args, **kwargs):
        amount = kwargs.pop('amount', None)
        order_uuid = kwargs.pop('order_uuid', None)
        super(SermepaPaymentForm, self).__init__(*args, **kwargs)

        if amount:
            # Generate needed parameters using 256 signature Redsys method
            r = RedsysCrypto(amount, order_uuid)
            params = r.generate_form()
            # Parameters to send to RedSys
            self.initial['Ds_SignatureVersion'] = params["Ds_SignatureVersion"]
            self.initial['Ds_MerchantParameters'] = params[
                "Ds_MerchantParameters"]
            self.initial['Ds_Signature'] = params["Ds_Signature"]

    def render(self):
        return mark_safe(u"""<form id="tpv_form" name="tpv_form" action="%s"
        method="post">
            %s
        </form> <script type="text/javascript">
        document.forms.tpv_form.submit();</script>""" % (
            settings.SERMEPA_URL_PRO, self.as_p()))

    def sandbox(self):
        return mark_safe(u"""<form id="tpv_form" name="tpv_form" action="%s"
        method="post">
            %s
        </form><script type="text/javascript">
        document.forms.tpv_form.submit();</script>""" % (
            settings.SERMEPA_URL_TEST, self.as_p()))


class SermepaResponseForm(forms.Form):
    Ds_SignatureVersion = forms.CharField(max_length=256)
    Ds_Signature = forms.CharField(max_length=256)
    Ds_MerchantParameters = forms.CharField(max_length=2048)

    Ds_Date = forms.DateField(required=False, input_formats=('%d/%m/%Y',))
    Ds_Hour = forms.TimeField(required=False, input_formats=('%H:%M',))
