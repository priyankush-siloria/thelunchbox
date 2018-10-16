# -*- coding: utf-8 -*-
from django import forms
from django.forms import BaseFormSet, BaseInlineFormSet
from django.forms import widgets
from .models import *
from mainapp.models import Category
from django.utils.translation import ugettext_lazy as _
from easy_thumbnails.fields import ThumbnailerImageField
import re

CHOICES = [
    ('0', _('CHOOSE COMPANY') + ' *'),
]

LANGUAGES = [
    ('en', 'ENGLISH'),
    ('es', 'ESPAÑOL')
]


class AuthForm(forms.Form):
    email = forms.EmailField(widget=widgets.TextInput(attrs={'type': 'email', 'placeholder': _('Email'), 'class': 'form-control auth_email', 'tabindex': '-1', 'autofocus': 'True'}), required=True)
    password = forms.CharField(widget=widgets.PasswordInput(attrs={'placeholder': _('Password'), 'class': 'form-control'}), required=True)


class UserRegistrationForm(forms.Form):
    first_name = forms.CharField(widget=widgets.TextInput(
        attrs={'placeholder': _('First name') + ' *', 
               'class': 'form-control ff', 'tabindex': '-1', 
               'autofocus': 'True'}), min_length=3, required=True)
    last_name = forms.CharField(widget=widgets.TextInput(
        attrs={'placeholder': _('Family name') + ' *', 
               'class': 'form-control ff'}), min_length=3, required=True)
    email = forms.EmailField(widget=widgets.EmailInput(
        attrs={'placeholder': _('Email address') + ' *', 
               'class': 'form-control'}), required=True)
    password1 = forms.CharField(widget=widgets.PasswordInput(
        attrs={'placeholder': _('Password') + ' *', 
               'class': 'form-control ff'}), required=True)
    password2 = forms.CharField(widget=widgets.PasswordInput(
        attrs={'placeholder': _('Password again') + ' *', 
               'class': 'form-control ff'}), required=True)
    phone = forms.CharField(widget=widgets.TextInput(
        attrs={'type': 'tel', 'placeholder': _('Phone number') + ' *', 
               'class': 'form-control'}), min_length=5, required=True)
    company = forms.ChoiceField(widget=widgets.Select(
        choices=(), attrs={'class': 'form-control'}), required=True)
    city = forms.CharField(widget=widgets.TextInput(
        attrs={'placeholder': _('City') + ' *', 
               'class': 'form-control unselectable', 'editable': 'false',
               'readonly':'True'}), initial='Barcelona', required=False)

    def clean_company(self):
        data = self.cleaned_data['company']
        if int(data) == 0:
            raise forms.ValidationError(_("This field is required"))
        return data

    def clean_phone(self):
        data = self.cleaned_data['phone']

        result = re.match('[a-zA-Z]+', data)
        if result:
            raise forms.ValidationError(
                _('Phone can contain only numbers and spaces!'))
        return data

    def __init__(self, *args, **kwargs):
        super(UserRegistrationForm, self).__init__(*args, **kwargs)

        CHOICES = [
            ('0', _('CHOOSE COMPANY') + ' *'),
        ]

        try:
            company = [(x.id, x.name) for x in Company.objects.all()]
            CHOICES += company
            CHOICES += [(0, _('+ ADD YOUR COMPANY'))]
        except Company.DoesNotExist:
            pass

        self.fields['company'].choices = CHOICES


class CompanyRegistrationForm(forms.Form):
    first_name = forms.CharField(widget=widgets.TextInput(
        attrs={'placeholder': _('First name') + ' *', 
               'class': 'form-control ff', 'tabindex': '-1', 
               'autofocus': 'True'}), min_length=3, required=True)
    last_name = forms.CharField(widget=widgets.TextInput(
        attrs={'placeholder': _('Family name') + ' *', 
               'class': 'form-control ff'}), min_length=3, required=True)
    email = forms.EmailField(widget=widgets.EmailInput(
        attrs={'placeholder': _('Email address') + ' *', 
               'class': 'form-control'}), required=True)
    password1 = forms.CharField(widget=widgets.PasswordInput(
        attrs={'placeholder': _('Password') + ' *', 
               'class': 'form-control ff'}), required=True)
    password2 = forms.CharField(widget=widgets.PasswordInput(
        attrs={'placeholder': _('Password again') + ' *', 
               'class': 'form-control ff'}), required=True)
    phone = forms.CharField(widget=widgets.TextInput(
        attrs={'type': 'tel', 'placeholder': _('Your phone number') + ' *', 
               'class': 'form-control'}), min_length=5, required=True)
    company_name = forms.CharField(widget=widgets.TextInput(
        attrs={'placeholder': _('Company name') + ' *', 
               'class': 'form-control'}), required=True)
    company_street = forms.CharField(widget=widgets.TextInput(
        attrs={'placeholder': 'Company address * (street, building, floor, door)',
               'class': 'form-control'}), required=True)
    company_city = forms.CharField(widget=widgets.TextInput(
        attrs={'placeholder': _('City') + ' *', 
               'class': 'form-control ff unselectable', 'editable': 'false',
               'readonly': 'True'}), initial='Barcelona', required=False)
    company_zipcode = forms.CharField(widget=widgets.TextInput(
        attrs={'type': 'tel', 'placeholder': _('Postal code') + ' *', 
               'class': 'form-control ff'}), required=True)
    company_phone = forms.CharField(widget=widgets.TextInput(
        attrs={'type': 'tel', 'placeholder': _('Office phone number') + ' *', 
               'class': 'form-control'}), required=True)

    def clean_phone(self):
        data = self.cleaned_data['phone']

        result = re.match('[a-zA-Z]+', data)
        if result:
            raise forms.ValidationError(
                _('Phone can contain only numbers and spaces!'))
        return data

    def clean_company_zipcode(self):
        data = self.cleaned_data['company_zipcode']

        result = re.match('[a-zA-Z]+', data)
        if result:
            raise forms.ValidationError(_('Zip code can contain only numbers!'))
        return data

    def clean_company_phone(self):
        data = self.cleaned_data['company_phone']

        result = re.match('[a-zA-Z]+', data)
        if result:
            raise forms.ValidationError(
                _('Company phone can contain only numbers and spaces!'))
        return data


class ProfileCompanyForm(forms.Form):
    first_name = forms.CharField(widget=widgets.TextInput(attrs={'placeholder': _('First name') + ' *', 'class': 'form-control ff unselectable', 'readonly':'True'}), min_length=3, required=True)
    last_name = forms.CharField(widget=widgets.TextInput(attrs={'placeholder': _('Family name') + ' *', 'class': 'form-control ff unselectable', 'readonly':'True'}), min_length=3, required=True)
    company_name = forms.CharField(widget=widgets.TextInput(attrs={'placeholder': _('Company name') + ' *', 'class': 'form-control unselectable', 'readonly':'True'}), required=True)
    company_street = forms.CharField(widget=widgets.TextInput(attrs={'placeholder': _('Company address * (street, building, floor, door)'), 'class': 'form-control unselectable', 'readonly':'True'}), required=True)
    company_city = forms.CharField(widget=widgets.TextInput(attrs={'placeholder': _('City') + ' *', 'class': 'form-control tt unselectable', 'readonly':'True'}), initial='Barcelona', required=False)
    company_state_full = forms.CharField(widget=widgets.TextInput(attrs={'placeholder': _('Region') + ' *', 'class': 'form-control tt unselectable', 'readonly':'True'}), initial='Catalonia', required=False)
    company_zipcode = forms.CharField(widget=widgets.TextInput(attrs={'type': 'tel', 'placeholder': _('Postal code') + ' *', 'class': 'form-control tt unselectable', 'readonly':'True'}), required=True)
    company_phone = forms.CharField(widget=widgets.TextInput(attrs={'type': 'tel', 'placeholder': _('Office phone number') + ' *', 'class': 'form-control unselectable', 'readonly':'True'}), required=True)


class ProfileCateringForm(forms.Form):
    c_first_name = forms.CharField(widget=widgets.TextInput(attrs={'placeholder': _('First name') + ' *', 'class': 'form-control ff unselectable', 'readonly':'True', 'tabindex': '-1', 'autofocus': 'True'}), min_length=3, required=False)
    c_last_name = forms.CharField(widget=widgets.TextInput(attrs={'placeholder': _('Family name') + ' *', 'class': 'form-control ff unselectable', 'readonly':'True'}), min_length=3, required=False)
    c_address = forms.CharField(widget=widgets.TextInput(attrs={'placeholder': _('Address * (street, building, floor, door)'), 'class': 'form-control unselectable', 'readonly':'True'}), required=False)
    c_city = forms.CharField(widget=widgets.TextInput(attrs={'placeholder': _('City') + ' *', 'class': 'form-control tt unselectable', 'readonly':'True', 'disabled': 'true'}), initial='Barcelona', required=False)
    c_state_full = forms.CharField(widget=widgets.TextInput(attrs={'placeholder': _('Region') + ' *', 'class': 'form-control tt unselectable', 'readonly':'True', 'disabled': 'true'}), initial='Catalonia', required=False)
    c_zipcode = forms.CharField(widget=widgets.TextInput(attrs={'type': 'tel', 'placeholder': _('Postal code') + ' *', 'class': 'form-control tt unselectable', 'readonly':'True'}), required=False)
    c_phone = forms.CharField(widget=widgets.TextInput(attrs={'type': 'tel', 'placeholder': _('Phone number') + ' *', 'class': 'form-control unselectable', 'readonly':'True'}), required=False)


class ProfileCateringEmptyForm(forms.Form):
    c_first_name = forms.CharField(widget=widgets.TextInput(attrs={'placeholder': _('First name') + ' *', 'class': 'form-control ff', 'tabindex': '-1', 'autofocus': 'True'}), min_length=3, required=True)
    c_last_name = forms.CharField(widget=widgets.TextInput(attrs={'placeholder': _('Family name') + ' *', 'class': 'form-control ff'}), min_length=3, required=True)
    c_address = forms.CharField(widget=widgets.TextInput(attrs={'placeholder': _('Address * (street, building, floor, door)'), 'class': 'form-control'}), required=True)
    c_city = forms.CharField(widget=widgets.TextInput(attrs={'placeholder': _('City') + ' *', 'class': 'form-control tt unselectable', 'readonly':'True'}), initial='Barcelona', required=True)
    c_state_full = forms.CharField(widget=widgets.TextInput(attrs={'placeholder': _('Region') + ' *', 'class': 'form-control tt unselectable', 'readonly':'True'}), initial='Catalonia', required=True)
    c_zipcode = forms.CharField(widget=widgets.TextInput(attrs={'type': 'tel', 'placeholder': _('Postal code') + ' *', 'class': 'form-control tt'}), required=True)
    c_phone = forms.CharField(widget=widgets.TextInput(attrs={'type': 'tel', 'placeholder': _('Phone number') + ' *', 'class': 'form-control'}), required=True)


class RestaurantRegistrationForm(forms.Form):
    restaurant_first_name = forms.CharField(widget=widgets.TextInput(attrs={'placeholder': _('First name') + ' *', 'class': 'form-control ff', 'tabindex': '-1', 'autofocus': 'True'}), min_length=3, required=True)
    restaurant_last_name = forms.CharField(widget=widgets.TextInput(attrs={'placeholder': _('Family name') + ' *', 'class': 'form-control ff'}), min_length=3, required=True)
    restaurant_email = forms.EmailField(widget=widgets.EmailInput(attrs={'placeholder': _('Email address') + ' *', 'class': 'form-control'}), required=True)
    restaurant_password1 = forms.CharField(widget=widgets.PasswordInput(attrs={'placeholder': _('Password') + ' *', 'class': 'form-control ff'}), required=True)
    restaurant_password2 = forms.CharField(widget=widgets.PasswordInput(attrs={'placeholder': _('Password again') + ' *', 'class': 'form-control ff'}), required=True)
    restaurant_owner_phone = forms.CharField(widget=widgets.TextInput(attrs={'type': 'tel', 'placeholder': _('Phone number') + ' *', 'class': 'form-control'}), min_length=5, required=True)
    restaurant_name = forms.CharField(widget=widgets.TextInput(attrs={'placeholder': _('Restaurant name') + ' *', 'class': 'form-control'}), required=True)
    restaurant_address = forms.CharField(widget=widgets.TextInput(attrs={'placeholder': _('Restaurant address *(street, building, floor, door)') + ')', 'class': 'form-control'}), required=True)
    restaurant_city = forms.CharField(widget=widgets.TextInput(attrs={'placeholder': 'Barcelona', 'class': 'form-control ff unselectable', 'editable': 'false', 'readonly':'True'}), initial='Barcelona', required=False)
    restaurant_street = forms.CharField(widget=widgets.TextInput(attrs={'class': 'form-control ff unselectable', 'editable': 'false', 'readonly':'True'}), initial='Unknown', required=False)
    restaurant_country = forms.CharField(widget=widgets.TextInput(attrs={'class': 'form-control ff unselectable', 'editable': 'false', 'readonly':'True'}), initial='Spain', required=False)
    restaurant_state = forms.CharField(widget=widgets.TextInput(attrs={'class': 'form-control ff unselectable', 'editable': 'false', 'readonly':'True'}), initial='Barcelona', required=False)
    restaurant_zip_code = forms.CharField(widget=widgets.TextInput(attrs={'type': 'tel', 'placeholder': _('Postal code') + ' *', 'class': 'form-control ff'}), required=False)
    restaurant_phone = forms.CharField(widget=widgets.TextInput(attrs={'type': 'tel', 'placeholder': _('Restaurant phone number') + ' *', 'class': 'form-control'}), required=True)

    def clean_phone(self):
        data = self.cleaned_data['restaurant_owner_phone']

        result = re.match('[a-zA-Z]+', data)
        if result:
            raise forms.ValidationError(_('Phone can contain only numbers and spaces!'))
        return data

    def clean_restaurant_phone(self):
        data = self.cleaned_data['restaurant_phone']

        result = re.match('[a-zA-Z]+', data)
        if result:
            raise forms.ValidationError(_('Restaurant phone can contain only numbers and spaces!'))
        return data

    def clean_restaurant_zip_code(self):
        data = self.cleaned_data['restaurant_zip_code']

        result = re.match('[a-zA-Z]+', data)
        if result:
            raise forms.ValidationError(_('Zip code can contain only numbers!'))
        return data


class AdminRegistrationForm(forms.Form):
    first_name = forms.CharField(widget=widgets.TextInput(attrs={'placeholder': _('First name') + ' *', 'class': 'form-control ff'}), min_length=3, required=True)
    last_name = forms.CharField(widget=widgets.TextInput(attrs={'placeholder': _('Family name') + ' *', 'class': 'form-control ff'}), min_length=3, required=True)
    email = forms.EmailField(widget=widgets.EmailInput(attrs={'placeholder': _('Email address') + ' *', 'class': 'form-control'}), required=True)
    password1 = forms.CharField(widget=widgets.PasswordInput(attrs={'placeholder': _('Password') + ' *', 'class': 'form-control ff'}), required=True)
    password2 = forms.CharField(widget=widgets.PasswordInput(attrs={'placeholder': _('Password again') + ' *', 'class': 'form-control ff'}), required=True)
    phone = forms.CharField(widget=widgets.TextInput(attrs={'type': 'tel', 'placeholder': _('Phone number') + ' *', 'class': 'form-control'}), min_length=5, required=True)


class EditProfileForm(forms.Form):
    first_name = forms.CharField(widget=widgets.TextInput(attrs={'placeholder': _('First name') + ' *', 'class': 'form-control ff'}), min_length=3, required=True)
    last_name = forms.CharField(widget=widgets.TextInput(attrs={'placeholder': _('Family name') + ' *', 'class': 'form-control ff'}), min_length=3, required=True)
    email = forms.EmailField(widget=widgets.EmailInput(attrs={'placeholder': _('Email address') + ' *', 'class': 'form-control'}), required=True)
    phone = forms.CharField(widget=widgets.TextInput(attrs={'type': 'tel', 'placeholder': _('Phone number') + ' *', 'class': 'form-control'}), min_length=5, required=True)
    company = forms.ChoiceField(widget=widgets.Select(choices=CHOICES, attrs={'class': 'form-control'}), required=True)
    company_name = forms.CharField(widget=widgets.TextInput(attrs={'placeholder': _('Company name') + ' *', 'class': 'form-control c_hidden'}), required=False)
    company_street = forms.CharField(widget=widgets.TextInput(attrs={'placeholder': _('Company address * (street, building, floor, door)'), 'class': 'form-control c_hidden'}), required=False)
    company_city = forms.CharField(widget=widgets.TextInput(attrs={'placeholder': _('City') + ' *', 'class': 'form-control tt unselectable c_hidden', 'disabled': 'true','readonly':'True'}), initial='Barcelona', required=False)
    company_state_full = forms.CharField(widget=widgets.TextInput(attrs={'placeholder': _('Region') + ' *', 'class': 'form-control tt unselectable c_hidden', 'disabled': 'true','readonly':'True'}), initial='Catalonia', required=False)
    company_zipcode = forms.CharField(widget=widgets.TextInput(attrs={'placeholder': _('Postal code') + ' *', 'class': 'form-control tt c_hidden'}), required=False)
    company_phone = forms.CharField(widget=widgets.TextInput(attrs={'placeholder': _('Office Phone number') + ' *', 'class': 'form-control c_hidden mb__20'}), required=False)

    def __init__(self, *args, **kwargs):
        super(EditProfileForm, self).__init__(*args, **kwargs)

        CHOICES = [
            ('0', _('CHOOSE COMPANY') + ' *'),
        ]

        try:
            company = [(x.id, x.name) for x in Company.objects.all()]
            CHOICES += company
            CHOICES += [(0, _('+ ADD YOUR COMPANY'))]
        except Company.DoesNotExist:
            pass

        self.fields['company'].choices = CHOICES


class RestaurantEditProfileForm(forms.Form):
    first_name = forms.CharField(widget=widgets.TextInput(attrs={'placeholder': _('First name') + ' *', 'class': 'form-control ff'}), min_length=3, required=True)
    last_name = forms.CharField(widget=widgets.TextInput(attrs={'placeholder': _('Family name') + ' *', 'class': 'form-control ff'}), min_length=3, required=True)
    email = forms.EmailField(widget=widgets.EmailInput(attrs={'placeholder': _('Email address') + ' *', 'class': 'form-control'}), required=True)
    phone = forms.CharField(widget=widgets.TextInput(attrs={'type': 'tel', 'placeholder': _('Phone number') + ' *', 'class': 'form-control'}), min_length=5, required=True)


class RestaurantCreateForm(forms.ModelForm):
    class Meta:
        model = Restaurant
        fields = ['name', 'desc', 'address', 'phone', 'min_order', 'facebook', 'twitter', 'instagram', 'website', 'logo', 'photoshoot_requested', 'opening_hours']
        widgets = {
            'name': widgets.TextInput(attrs={'class': 'lb-name', 'placeholder': _('Name of the restaurant')}),
            'desc': widgets.Textarea(attrs={'class': 'lb-name', 'placeholder': _('DESCRIPTION: Describe your restaurant!')}),
            'address': widgets.TextInput(attrs={'class': 'lb-site', 'placeholder': _('Enter your address')}),
            'phone': widgets.TextInput(attrs={'class': 'lb-site', 'placeholder': _('Enter your phone number')}),
            'email': widgets.TextInput(attrs={'class': 'lb-site', 'placeholder': _('Enter your email address')}),
            'min_order': widgets.TextInput(attrs={'class': 'd2','placeholder': 'XX'}),
            'facebook': widgets.TextInput(attrs={'class': 'lb-site', 'placeholder': _('Enter your facebook address')}),
            'twitter': widgets.TextInput(attrs={'class': 'lb-site', 'placeholder': _('Your twitter')}),
            'instagram': widgets.TextInput(attrs={'class': 'lb-site', 'placeholder': _('Your instagram')}),
            'website': widgets.TextInput(attrs={'class': 'lb-site', 'placeholder': _('Your website')}),
            'logo': widgets.FileInput(attrs={
                'class': 'image_upload_btn'
            }),
            'opening_hours': widgets.Textarea(attrs={'class': 'lb-name',
                                                     'placeholder': _('Opening hours (example):\nMon: Closed\nTue - Thu: 10:00 - 00:00\nFri - Sun: 10:00 - 02:00')})
        }


class RestaurantEditForm(forms.ModelForm):
    class Meta:
        model = Restaurant
        fields = ['name', 'desc', 'min_order', 'facebook', 'twitter', 'instagram', 'website', 'logo', 'photoshoot_requested', 'opening_hours']
        widgets = {
            'name': widgets.TextInput(attrs={'class': 'lb-name', 'placeholder': _('Name of the restaurant')}),
            'desc': widgets.Textarea(attrs={'class': 'lb-name', 'placeholder': _('DESCRIPTION: Describe your restaurant!')}),
            'min_order': widgets.TextInput(attrs={'class': 'd2','placeholder': 'XX'}),
            'facebook': widgets.TextInput(attrs={'class': 'lb-site', 'placeholder': _('Enter your facebook address')}),
            'twitter': widgets.TextInput(attrs={'class': 'lb-site', 'placeholder': _('Your twitter')}),
            'instagram': widgets.TextInput(attrs={'class': 'lb-site', 'placeholder': _('Your instagram')}),
            'website': widgets.TextInput(attrs={'class': 'lb-site', 'placeholder': _('Your website')}),
            'logo': widgets.FileInput(attrs={
                'class': 'image_upload_btn'
            }),
            'opening_hours': widgets.Textarea(attrs={'class': 'lb-name',
                                                     'placeholder': _('Opening hours (example):\nMon: Closed\nTue - Thu: 10:00 - 00:00\nFri - Sun: 10:00 - 02:00')})
        }



class ShiftForm(forms.ModelForm):

    class Meta:
        model = Shift
        fields = ('start', 'end', 'week_day',)
        widgets = {
            'start': widgets.TextInput(attrs={'class': 'timepicker_d5'}),
            'end': widgets.TextInput(attrs={'class': 'timepicker_d4'}),
            'week_day': widgets.Select(attrs={'class': 'select_box'}),
        }


class ShiftsFormSet(BaseFormSet):

    def clean(self):
        """Assert start-time < end-time and overlapping time intervals"""
        if any(self.errors):
            return False
        week_days = {}
        errors_list = set()
        for form in self.forms:
            week_day = form.cleaned_data.get("week_day")
            if week_day and week_day not in week_days:
                week_days[week_day] = []
            if form.cleaned_data.get("start") and form.cleaned_data.get("end"):
                week_days[week_day].append(
                    [form.cleaned_data.get("start"),
                     form.cleaned_data.get("end")])

        for key, time_intervals in week_days.items():
            for indx, interval in enumerate(time_intervals):
                if interval[0] > interval[1]:
                    errors_list.add(_("The start-time must be earlier than "
                                    "the end-time"))
                for next_interval in time_intervals[indx + 1:]:
                    if ShiftsFormSet.is_overlaping(
                        interval[0], interval[1], next_interval[0],
                            next_interval[1]):
                        errors_list.add(
                            _("There are overlapping time intervals"))
                        break
        if errors_list:
            raise forms.ValidationError([error for error in errors_list])

    @staticmethod
    def is_overlaping(start_a, end_a, start_b, end_b):
        return max(start_a, start_b) < min(end_a, end_b)

    def save(self, restaurant):
        """On save delete all existing shifts and then create the new ones"""
        restaurant.shifts.all().delete()
        for form in self.forms:
            if form.cleaned_data.get("start") and form.cleaned_data.get("end")\
                    and form.cleaned_data.get("week_day"):
                Shift.objects.create(
                    start=form.cleaned_data.get("start"),
                    week_day=form.cleaned_data.get("week_day"),
                    end=form.cleaned_data.get("end"), restaurant=restaurant)


class PromoCodeForm(forms.ModelForm):
    class Meta:
        model = CheckoutPromoCode
        fields = '__all__'


class DeliveryCityForm(forms.Form):
    city = forms.ModelMultipleChoiceField(widget=forms.CheckboxSelectMultiple,
                                          queryset=City.objects.all())


class RestaurantImageForm(forms.ModelForm):
    class Meta:
        model = RestaurantImage
        fields = '__all__'
        widgets = {
            'image': widgets.FileInput(attrs={
                'class': 'image_upload_btn','id':'file-input'
            })
        }


class RestaurantDiscountCouponsForm(forms.ModelForm):
    class Meta:
        model = RestaurantDiscountCoupon
        fields = '__all__'
        widgets = {
            'available_from': widgets.TextInput(attrs={'class': 'datepicker'}),
            'available_till': widgets.TextInput(attrs={'class': 'datepicker'}),
            'time_from': widgets.TextInput(attrs={'class': 'timepicker'}),
            'time_till': widgets.TextInput(attrs={'class': 'timepicker'}),
            'percent': widgets.TextInput(attrs={'class': 'd2', 'placeholder': _('Add discount') + 'XX%'}),
        }


class LunchboxForm(forms.ModelForm):
    nutrition_facts = forms.CharField(widget=widgets.HiddenInput(attrs={'class': 'nf_input'}))
    discount1_percent = forms.FloatField(widget=widgets.TextInput(attrs={'class': 'd2', 'placeholder': 'XX'}), required=False)
    discount1_qty = forms.FloatField(widget=widgets.TextInput(attrs={'class': 'd2', 'placeholder': 'xx'}), required=False)
    discount2_percent = forms.FloatField(widget=widgets.TextInput(attrs={'class': 'd2', 'placeholder': 'XX'}), required=False)
    discount2_qty = forms.FloatField(widget=widgets.TextInput(attrs={'class': 'd2', 'placeholder': 'xx'}), required=False)
    discount3_percent = forms.FloatField(widget=widgets.TextInput(attrs={'class': 'd2', 'placeholder': 'XX'}), required=False)
    discount3_qty = forms.FloatField(widget=widgets.TextInput(attrs={'class': 'd2', 'placeholder': 'xx'}), required=False)
    photoshoot_done = forms.BooleanField(widget=widgets.CheckboxInput(),
                                         required=False)

    class Meta:
        model = Lunchbox
        fields = '__all__'
        widgets = {
            'name': widgets.TextInput(attrs={'class': 'lb-name', 'placeholder': _('Name of lunchbox')}),
            'desc': widgets.Textarea(attrs={'class': 'lb-name', 'placeholder': _('DESCRIPTION: Describe your lunchbox right now!')}),
            'available_from': widgets.TextInput(attrs={'class': 'datepicker'}),
            'available_till': widgets.TextInput(attrs={'class': 'datepicker'}),
            'price': widgets.TextInput(attrs={'class': 'd4','placeholder': 'XX.XX'}),
            'rate': widgets.TextInput(attrs={'class': 'd4', 'placeholder': 'XX.XX'}),
            'total_calories': widgets.TextInput(attrs={'class': 'd4', 'placeholder': 'XXX'}),
            'protein': widgets.TextInput(attrs={'class': 'd4', 'placeholder': 'XX'}),
            'carbohydrates': widgets.TextInput(attrs={'class': 'd4', 'placeholder': 'XX'}),
            'fat': widgets.TextInput(attrs={'class': 'd4', 'placeholder': 'XX'}),
            'sugar': widgets.TextInput(attrs={'class': 'd4', 'placeholder': 'XX'}),
            'sodium': widgets.TextInput(attrs={'class': 'd4', 'placeholder': 'XX'}),
            'min_order': widgets.TextInput(attrs={'class': 'd2','placeholder': 'XX'}),
            'photoshoot_requested': widgets.CheckboxInput(),
            'publishing_requested': widgets.CheckboxInput(),
            'published': widgets.CheckboxInput(),
        }

    def clean(self):
        available_from = self.cleaned_data.get('available_from')
        available_till = self.cleaned_data.get('available_till')
        price = self.cleaned_data.get('price')
        rate = self.cleaned_data.get('rate')

        errors_list = []

        if available_from and available_till:

            if available_till < datetime.date.today():
                errors_list.append(forms.ValidationError(
                    _('Availability: Dates must be later or equal than today'),
                    code='invalid dates interval'))
            if available_from > available_till:
                errors_list.append(forms.ValidationError(
                    _('Availability: End date must be later or equal than start'
                      ' date'), code='invalid dates interval'))

        if price and rate:

            if rate >= price:
                errors_list.append(forms.ValidationError(
                    _('La Fiambrera rate: Rate must be lower than the price'),
                    code='invalid rate'))

        if errors_list:
            raise forms.ValidationError(errors_list)


class LunchboxImageForm(forms.ModelForm):
    class Meta:
        model = LunchboxImage
        fields = '__all__'
        widgets = {
            'image': widgets.FileInput(attrs={
                'class': 'image_upload_btn'
            })
        }


class LunchboxPrivilegesForm(forms.ModelForm):
    class Meta:
        model = LunchboxPrivilegesItem
        fields = '__all__'
        widgets = {
            'privilege': widgets.Select()
        }


class LunchboxDiscountsForm(forms.ModelForm):
    class Meta:
        model = LunchboxDiscount
        fields = ['percent', 'qty']
        widgets = {
            'percent': widgets.TextInput(attrs={'class': 'd2', 'placeholder': 'XX'}),
            'qty': widgets.TextInput(attrs={'class': 'd2', 'placeholder': 'xx'})
        }
class LunchboxCategoryForm(forms.ModelForm):
    class Meta:
        model=Category
        fields='__all__'
        widgets={
            'privilege':widgets.Select()
        }

