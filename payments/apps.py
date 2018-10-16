from django.apps import AppConfig


class SignalsConfig(AppConfig):

    """Import the signal handler once the app is ready"""

    name = 'payments'
    verbose_name = "Payments"

    def ready(self):
        import payments.signals.handlers
