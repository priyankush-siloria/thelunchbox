# Payment status choices

SUCCESS = "ok"
ERROR = "err"
SIGNATURE_ERROR = "ser"
PENDING = "pen"

PAYMENT_STATUS = (
    (SUCCESS, "Success"),
    (ERROR, "Error"),
    (SIGNATURE_ERROR, "Signature error"),
    (PENDING, "Pending")
)

# Payment type choices

PAYPAL = "pyp"
REDSYS = "rsy"
WALLET = "wlt"
ZERO_VALUE = "zvl"
PAYMENT_TYPES = (
    (PAYPAL, "Paypal"),
    (REDSYS, "Redsys"),
    (WALLET, "Wallet"),
    (ZERO_VALUE, "Zero value")
)
