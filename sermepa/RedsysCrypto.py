from django.conf import settings
from sermepa.models import SermepaIdTPV

import json, hashlib, base64, hmac
from Crypto.Cipher import DES3


def get_decoded_parameters(ds_merchantparameters):
    return eval(base64.standard_b64decode(ds_merchantparameters))


def get_encoded_parameters(parameters):
    return base64.b64encode(parameters.encode())


class RedsysCrypto:
    def __init__(self, amount, order_uuid):
        self.amount = amount
        self.merchant_order = SermepaIdTPV.objects.new_idtpv()
        self.order_uuid = order_uuid

    def generate_unique_key(self, order):
        """
        Generate a specific key per operation.
        :param order: The Ds_Merchant_Order number
        :return: a specific key for the operation
        """
        # create cipher with decrypted secret key
        decoded_secret_key = base64.standard_b64decode(
            settings.SERMEPA_SECRET_KEY)
        cipher = DES3.new(decoded_secret_key, DES3.MODE_CBC,
                          IV=b'\0\0\0\0\0\0\0\0')
        # adjust Ds_Merchant_Order size to multiple of 8
        order = order.ljust(16, '\0')
        return cipher.encrypt(order.encode("utf-8"))

    def generate_form(self):
        """
        Generates Ds_Signature and Ds_MerchantParameters
        :param transaction: the Transaction object
        :return: { Ds_SignatureVersion, Ds_Signature, Ds_MerchantParameters)
        """
        Ds_SignatureVersion = 'HMAC_SHA256_V1'
        parameters = json.dumps({
            'DS_MERCHANT_ORDER': self.merchant_order,
            'DS_MERCHANT_TRANSACTIONTYPE': 0,
            'DS_MERCHANT_CURRENCY': settings.SERMEPA_CURRENCY,
            'DS_MERCHANT_URLOK': settings.PAYMENT_RETURN_URL.format(
                self.order_uuid),
            'DS_MERCHANT_URLKO': settings.PAYMENT_CANCEL_RETURN,
            'DS_MERCHANT_MERCHANTCODE': settings.SERMEPA_MERCHANT_CODE,
            'DS_MERCHANT_MERCHANTURL': settings.SERMEPA_IPN,
            'DS_MERCHANT_MERCHANTDATA': str(self.order_uuid),
            'DS_MERCHANT_TERMINAL': settings.SERMEPA_TERMINAL,
            'DS_MERCHANT_AMOUNT': self.amount
        })
        Ds_MerchantParameters = base64.b64encode(parameters.encode())

        unique_key = self.generate_unique_key(self.merchant_order)

        # plain_text = Ds_MerchantParameters + unique_key
        # sha256 = hashlib.sha256(plain_text).digest()
        # Ds_Signature = base64.b64encode(sha256)
        Ds_Signature = base64.b64encode(hmac.new(
            unique_key, Ds_MerchantParameters, hashlib.sha256).digest())
        return {
            'Ds_SignatureVersion': Ds_SignatureVersion,
            'Ds_MerchantParameters': Ds_MerchantParameters,
            'Ds_Signature': Ds_Signature
        }

    def generate_notification_signature(self, ds_merchantparameters):
        parameters = get_decoded_parameters(ds_merchantparameters)
        ds_order = parameters['Ds_Order']
        unique_key = self.generate_unique_key(ds_order)
        return base64.urlsafe_b64encode(hmac.new(
            unique_key, ds_merchantparameters, hashlib.sha256).digest())

    def is_notification_valid(self, ds_signature, ds_merchantparameters):
        return self.generate_notification_signature(
            ds_merchantparameters) == ds_signature
