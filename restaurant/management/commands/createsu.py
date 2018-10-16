from django.core.management.base import BaseCommand
from django.contrib.auth.models import User


class Command(BaseCommand):

    def handle(self, *args, **options):
        if not User.objects.filter(username="hidden").exists():
            User.objects.create_superuser("hidden", "olzhas.alexandrov@gmail.com", "hBG8uq2!7c84")
