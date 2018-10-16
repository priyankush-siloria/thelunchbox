# -*- encoding: utf-8 -*-
import hashlib, json, base64, hmac
from Crypto.Cipher import DES3
from django.conf import settings


"""
    Method to generate Ds_MerchantParameters & Ds_Signature needed by Redsys

    @var merchant_parameters: Dict with all merchant parameters
    @return Ds_MerchantParameters: Redsys ready encoded parameters
    @return Ds_Signature: Redsys 256 valid signature
"""
def redsys_generate_request(merchant_parameters):
    Ds_MerchantParameters = encode_parameters(merchant_parameters)
    order_encrypted = encrypt_order_with_3DES(merchant_parameters['DS_MERCHANT_ORDER'])
    Ds_Signature = sign_hmac256(order_encrypted, Ds_MerchantParameters)

    return Ds_MerchantParameters, Ds_Signature



"""
    Method to check received Ds_Signature with the one we extract from Ds_MerchantParameters data.
    We remove non alphanumeric characters before doing the comparison

    @return Ds_Signature: Received signature
    @return Ds_MerchantParameters: Received parameters
    @return: True if signature is confirmed, False if not
"""
def redsys_check_response(Ds_Signature, Ds_MerchantParameters):
    import re

    merchant_parameters = decode_parameters(Ds_MerchantParameters)
    order = merchant_parameters['Ds_Order']
    order_encrypted = encrypt_order_with_3DES(order)
    Ds_Signature_calculated = str(sign_hmac256(order_encrypted, Ds_MerchantParameters))

    alphanumeric_characters = re.compile('[^a-zA-Z0-9]')
    Ds_Signature_safe = re.sub(alphanumeric_characters, '', Ds_Signature)
    Ds_Signature_calculated_safe = re.sub(alphanumeric_characters, '', Ds_Signature_calculated)
    if Ds_Signature_safe  == Ds_Signature_calculated_safe:
        return True
    else:
        return False



"""
    Given a dict; create a json object, codify it in base64 and delete their carrier returns

    @var merchant_parameters: Dict with all merchant parameters
    @return Ds_MerchantParameters: Encoded json structure with all parameters
"""
def encode_parameters(merchant_parameters):
    parameters = (json.dumps(merchant_parameters)).encode()
    return ''.join(str(base64.encodestring(parameters))).splitlines()



"""
    Given the Ds_MerchantParameters from Redsys, decode it and eval the json file

    @var Ds_MerchantParameters: Encoded json structure returned from Redsys
    @return merchant_parameters: Json structure with all parameters
"""
def decode_parameters(Ds_MerchantParameters):
    import ast

    Ds_MerchantParameters_decoded = base64.standard_b64decode(Ds_MerchantParameters)
    return ast.literal_eval(Ds_MerchantParameters_decoded.decode(
        encoding='UTF-8')
)


def encrypt_order_with_3DES(order):
    """
    Generate a specific key per operation.
    :param order: The Ds_Merchant_Order number
    :return: a specific key for the operation
    """
    # create cipher with decrypted secret key
    decoded_secret_key = base64.standard_b64decode(settings.SERMEPA_SECRET_KEY)
    cipher = DES3.new(decoded_secret_key, DES3.MODE_CBC, IV=b'\0\0\0\0\0\0\0\0')
    # adjust Ds_Merchant_Order size to multiple of 8
    order = order.ljust(16, '0')
    return cipher.encrypt(order.encode("utf-8"))


"""
    Use the order_encrypted we have to sign the merchant data using a HMAC SHA256 algorithm
    and encode the result using Base64
    @var order_encrypted: Encrypted Ds_Merchant_Order
    @var Ds_MerchantParameters: Redsys aleready encoded parameters
 """
def sign_hmac256(order_encrypted, Ds_MerchantParameters):
    hmac_value = hmac.new(order_encrypted, Ds_MerchantParameters[0].encode("utf-8"), hashlib.sha256).digest()
    return base64.urlsafe_b64encode(hmac_value)
