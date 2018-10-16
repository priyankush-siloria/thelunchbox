from django.contrib import messages
from django.contrib.auth import login, authenticate, logout
from django.shortcuts import render, HttpResponseRedirect
from django.views.generic import *
from userprofiles.forms import *
from userprofiles.models import *
from django.template import Context
from django.template.loader import get_template
from django.core.mail import EmailMessage
from django.conf import settings
from django.contrib.auth.models import Group
from django.utils import translation
from django.utils.translation import ugettext_lazy as _
import uuid
from django.http import HttpResponse
from django.conf import settings
from payments.models import MoneyToWallet
import json


class Home(TemplateView):
    form_class = AuthForm

    def get(self, request, *args, **kwargs):
        #session_key = getattr(settings, 'EASYCART_SESSION_KEY', 'easycart')
        #print session_key
        #print request.session[session_key]
        if request.user.is_authenticated():
            user = User.objects.get(id=request.user.id)
            if user.is_staff or user.groups.filter(name="Restaurant"):
                return HttpResponseRedirect('/control/')

            if not user.profile.is_filled() and not user.is_staff:
                return HttpResponseRedirect('/edit_user_profile/')

        restaurants = Restaurant.objects.all()
        filled_restaurants = []
        for r in restaurants:
            if r.is_filled():
                filled_restaurants.append(r)

        form = AuthForm()

        return render(request, self.template_name, locals())

    def post(self, request, *args, **kwargs):
        form = self.form_class(request.POST)
        restaurants = Restaurant.objects.all()

        if form.is_valid():
            try:
                user = User.objects.get(email=form.cleaned_data.get('email'))
                auth_user = authenticate(username=user.username, password=form.cleaned_data.get('password'))

                if not user.is_active:
                    messages.error(request, 'Please activate your account by Email link!')
                    return render(request, self.template_name, locals())

                if auth_user:
                    lng = user.profile.lang
                    translation.activate(lng)
                    request.session[translation.LANGUAGE_SESSION_KEY] = lng
                    login(request, auth_user)

                    if user.profile.is_restaurant()or user.profile.is_employee() or user.is_staff:
                        return HttpResponseRedirect('/control')

                    return HttpResponseRedirect('/')
                else:
                    messages.error(request, 'Login or password are incorrect!')
            except User.DoesNotExist:
                messages.error(request, 'User is not registered! Please register!')
            return render(request, self.template_name, locals())
        else:
            return render(request, self.template_name, locals())










class Registration(TemplateView):
    form_class = UserRegistrationForm

    def get(self, request, *args, **kwargs):
        form = UserRegistrationForm()
        return render(request, self.template_name, locals())

    def post(self, request, *args, **kwargs):
        form = self.form_class(request.POST)
        if form.is_valid():
            first_name = form.cleaned_data.get('first_name')
            last_name = form.cleaned_data.get('last_name')
            email = form.cleaned_data.get('email')
            password1 = form.cleaned_data.get('password1')
            password2 = form.cleaned_data.get('password2')
            phone = form.cleaned_data.get('phone')
            company = form.cleaned_data.get('company')
            lang_en = request.POST.get('lang_en')
            lang_es = request.POST.get('lang_es')

            try:
                user = User.objects.get(email=email)
                messages.error(request, 'User is registered as {}! Try login or activate your account.'.format(user.profile.get_user_status()))
                return HttpResponseRedirect('/user_registration')
            except User.DoesNotExist:
                if password1 and password2 and password1 != password2:
                    messages.error(request, 'password_mismatch!')
                    return HttpResponseRedirect('/user_registration')

                user = User.objects.create_user(
                        username=email,
                        email=email,
                        password=password1
                )

                user.first_name = first_name
                user.last_name = last_name
                user.is_active = False
                user.save()

                activation_key = str(uuid.uuid4())[:15]

                subject = 'La Fiambrera - Complete Activation'
                from_email = settings.EMAIL_HOST_USER
                to_email = [email]

                template = get_template("activation_email.html")
                c = Context({
                    'username': user.username,
                    'site': settings.SITE_URL,
                    'activation_key': activation_key
                })
                mail_content = template.render(c)

                email = EmailMessage(subject, mail_content, from_email, to_email)
                email.content_subtype = 'html'
                email.send()

                code = Activation.objects.create(user=user, email=user.email, key=activation_key)
                code.save()

                profile = Profile.objects.create(user=user)
                profile.phone = phone

                if company != '0':
                    profile.company = Company.objects.get(id=company)

                if lang_en == 'on':
                    profile.lang = 'en'
                else:
                    profile.lang = 'es'

                profile.save()

                return render(request, 'site_message.html', {
                    'title': 'Thank you!',
                    'msg': 'Activation link has been sent to your email.'
                })
        else:
            return render(request, self.template_name, locals())


class CompanyRegistration(TemplateView):
    form_class = CompanyRegistrationForm

    def get(self, request, *args, **kwargs):
        form = CompanyRegistrationForm()
        return render(request, self.template_name, locals())

    def post(self, request, *args, **kwargs):
        form = self.form_class(request.POST)
        if form.is_valid():
            first_name = form.cleaned_data.get('first_name')
            last_name = form.cleaned_data.get('last_name')
            email = form.cleaned_data.get('email')
            password1 = form.cleaned_data.get('password1')
            password2 = form.cleaned_data.get('password2')
            phone = form.cleaned_data.get('phone')
            company_name = form.cleaned_data.get('company_name', '')
            company_street = form.cleaned_data.get('company_street', '')
            # company_city = form.cleaned_data.get('company_city', '')
            # company_state_full = form.cleaned_data.get('company_state_full', '')
            company_zipcode = form.cleaned_data.get('company_zipcode', '')
            company_phone = form.cleaned_data.get('company_phone', '')
            lang_en = request.POST.get('lang_en')
            lang_es = request.POST.get('lang_es')

            try:
                company = Company.objects.get(name=company_name.capitalize())
                if company.is_confirmed:
                    messages.error(request, 'Company `{}` already exist! Try register with your company.'.format(company_name.capitalize()))
                else:
                    messages.error(request, 'Company is registered and is waiting approval.')
                return HttpResponseRedirect('/company_registration')
            except Company.DoesNotExist:
                company = Company.objects.create()
                company.name = company_name
                company.street = company_street
                # company.city = company_city
                # company.state = company_state_full
                company.zip_code = company_zipcode
                company.phone = company_phone
                company.save()

                try:
                    user = User.objects.get(email=email)
                    messages.error(request, 'User is registered as {}! Try login or activate your account.'.format(user.profile.get_user_status()))
                    return HttpResponseRedirect('/company_registration')
                except User.DoesNotExist:
                    if password1 and password2 and password1 != password2:
                        messages.error(request, 'password_mismatch!')
                        return HttpResponseRedirect('/company_registration')

                    user = User.objects.create_user(
                            username=email,
                            email=email,
                            password=password1
                    )
                    user.first_name = first_name
                    user.last_name = last_name
                    user.is_active = False
                    user.save()

                    activation_key = str(uuid.uuid4())[:15]

                    subject = 'La Fiambrera - Complete Activation'
                    from_email = settings.EMAIL_HOST_USER
                    to_email = [email]

                    template = get_template("activation_email.html")
                    c = Context({
                        'username': user.username,
                        'site': settings.SITE_URL,
                        'activation_key': activation_key
                    })
                    mail_content = template.render(c)

                    email = EmailMessage(subject, mail_content, from_email, to_email)
                    email.content_subtype = 'html'
                    email.send()

                    code = Activation.objects.create(user=user, email=user.email, key=activation_key)
                    code.save()

                    profile = Profile.objects.create(user=user)
                    profile.phone = phone
                    profile.is_company_rep = True

                    if lang_en == 'on':
                        profile.lang = 'en'
                    else:
                        profile.lang = 'es'

                    profile.company = company
                    profile.save()

                return render(request, 'site_message.html', {
                    'title': 'Thank you!',
                    'msg': 'Activation link has been sent to your email.'
                })
        else:
            return render(request, self.template_name, locals())


class RestaurantRegistration(TemplateView):
    form_class = RestaurantRegistrationForm

    def get(self, request, *args, **kwargs):
        form = RestaurantRegistrationForm()
        return render(request, self.template_name, locals())

    def post(self, request, *args, **kwargs):
        form = self.form_class(request.POST)
        if form.is_valid():
            first_name = form.cleaned_data.get('first_name')
            last_name = form.cleaned_data.get('last_name')
            email = form.cleaned_data.get('email')
            password1 = form.cleaned_data.get('password1')
            password2 = form.cleaned_data.get('password2')
            phone = form.cleaned_data.get('phone')
            restaurant_name = form.cleaned_data.get('restaurant_name')
            restaurant_address = form.cleaned_data.get('restaurant_address')
            # restaurant_city = form.cleaned_data.get('restaurant_city', 'Barcelona')
            # restaurant_state = form.cleaned_data.get('restaurant_state', 'Catalonia')
            restaurant_zip_code = form.cleaned_data.get('restaurant_zip_code')
            restaurant_phone = form.cleaned_data.get('restaurant_phone')
            lang_en = request.POST.get('lang_en')
            lang_es = request.POST.get('lang_es')

            try:
                user = User.objects.get(email=email)
                messages.error(request, 'User is registered as {}! Try activate your account.'.format(user.profile.get_user_status()))
                return HttpResponseRedirect('/restaurant_registration/')
            except User.DoesNotExist:
                if password1 and password2 and password1 != password2:
                    messages.error(request, 'password_mismatch!')
                    return HttpResponseRedirect('/restaurant_registration/')

                user = User.objects.create_user(
                        username=email,
                        email=email,
                        password=password1
                )
                user.first_name = first_name
                user.last_name = last_name
                user.is_active = False
                user.save()

                group = Group.objects.get(name='Restaurant')
                group.user_set.add(user)

                profile = Profile.objects.create(user=user)
                profile.phone = phone

                if lang_en == 'on':
                    profile.lang = 'en'
                else:
                    profile.lang = 'es'

                profile.save()

                try:
                    restaurant = Restaurant.objects.get(name=restaurant_name)
                    messages.error(request, 'Restaurant already exist! Try to login with your email address!')
                    return HttpResponseRedirect('/restaurant_registration/')
                except Restaurant.DoesNotExist:
                    restaurant = Restaurant.objects.create()
                    restaurant.user = user
                    restaurant.name = restaurant_name
                    restaurant.address = restaurant_address
                    # restaurant.city = restaurant_city
                    # restaurant.state = restaurant_state
                    restaurant.zip_code = restaurant_zip_code
                    restaurant.phone = restaurant_phone
                    restaurant.save()

                activation_key = str(uuid.uuid4())[:15]

                subject = 'La Fiambrera - Complete Activation'
                from_email = settings.EMAIL_HOST_USER
                to_email = [email]

                template = get_template("activation_email.html")
                c = Context({
                    'username': user.username,
                    'site': settings.SITE_URL,
                    'activation_key': activation_key
                })
                mail_content = template.render(c)

                email = EmailMessage(subject, mail_content, from_email, to_email)
                email.content_subtype = 'html'
                email.send()

                code = Activation.objects.create(user=user, email=user.email, key=activation_key)
                code.save()

                return render(request, 'site_message.html', {
                    'title': 'Thank you!',
                    'msg': 'Activation link has been sent to your email.'
                })
        else:
            return render(request, self.template_name, locals())


class AdminRegistration(TemplateView):
    # Not used!
    form_class = AdminRegistrationForm

    def get(self, request, *args, **kwargs):
        form = AdminRegistrationForm()
        return render(request, self.template_name, locals())

    def post(self, request, *args, **kwargs):
        form = self.form_class(request.POST)
        if form.is_valid():
            first_name = form.cleaned_data.get('first_name')
            last_name = form.cleaned_data.get('last_name')
            email = form.cleaned_data.get('email')
            password1 = form.cleaned_data.get('password1')
            password2 = form.cleaned_data.get('password2')
            phone = form.cleaned_data.get('phone')
            lang_en = request.POST.get('lang_en')
            lang_es = request.POST.get('lang_es')

            try:
                user = User.objects.get(email=email)
                messages.error(request, 'User is registered as {}! Try activate your account.'.format(user.profile.get_user_status()))
                return HttpResponseRedirect('/admin_registration')
            except User.DoesNotExist:
                if password1 and password2 and password1 != password2:
                    messages.error(request, 'password_mismatch!')
                    return HttpResponseRedirect('/admin_registration')

                user = User.objects.create_user(
                        username=email,
                        email=email,
                        password=password1
                )
                user.first_name = first_name
                user.last_name = last_name
                user.is_active = False
                user.save()

                group = Group.objects.get(name='Employee')
                group.user_set.add(user)

                activation_key = str(uuid.uuid4())[:15]

                subject = 'La Fiambrera - Complete Activation'
                from_email = settings.EMAIL_HOST_USER
                to_email = [email]

                template = get_template("activation_email.html")
                c = Context({
                    'username': user.username,
                    'site': settings.SITE_URL,
                    'activation_key': activation_key
                })
                mail_content = template.render(c)

                email = EmailMessage(subject, mail_content, from_email, to_email)
                email.content_subtype = 'html'
                email.send()

                code = Activation.objects.create(user=user, email=user.email, key=activation_key)
                code.save()

                profile = Profile.objects.create(user=user)
                profile.phone = phone

                if lang_en == 'on':
                    profile.lang = 'en'
                else:
                    profile.lang = 'es'

                profile.save()

                return render(request, 'site_message.html', {
                    'title': 'Thank you!',
                    'msg': 'Activation link has been sent to your email.'
                })
        else:
            return render(request, self.template_name, locals())


class Logout(RedirectView):
    def get(self, request, *args, **kwargs):
        logout(request)
        return HttpResponseRedirect('/')


class SiteMessage(TemplateView):
    def get(self, request, *args, **kwargs):
        return render(request, self.template_name, locals())


class Activate(TemplateView):
    def get(self, request, *args, **kwargs):
        code = kwargs.get('code')
        try:
            activation = Activation.objects.get(key=code)
            user = User.objects.get(email=activation.email)
            user.is_active = True
            user.save()
            activation.delete()
            userid=user.id
            username=user.username
            gettype=user.groups.all()
            usertype=gettype[0]
            request.session['user_id'] = userid
            request.session['user_type'] = str(usertype)
            request.session['user_name'] = str(username)
        except Activation.DoesNotExist:
            return render(request, "site_message.html", {'title': 'Failed!', 'msg': 'User is not registered!'})
        return render(request, "site_message.html",
                      {'title': 'Success!', 'msg': 'User is activated! Now you can enter to site'})


class ChangeLang(RedirectView):
    def get(self, request, *args, **kwargs):
        lng = self.kwargs.get('lng')
        translation.activate(lng)
        request.session[translation.LANGUAGE_SESSION_KEY] = lng
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))


class CheckUserProfile(RedirectView):
    def get(self, request, *args, **kwargs):
        user = User.objects.get(id=request.user.id)
        if user.profile.is_filled() or user.profile.is_restaurant():
            return HttpResponseRedirect('/')
        else:
            if not user.is_staff and not user.profile.is_restaurant():
                return HttpResponseRedirect('/edit_user_profile')
            else:
                return HttpResponseRedirect('/')

class EditUserProfile(TemplateView):
    template_name="edit_user_profile.html"


# class EditUserProfile(TemplateView):
#     template_name = "edit_user_profile.html"
#     # user_form_class = EditProfileForm
#     # restaurant_form_class = RestaurantEditProfileForm

#     def get(self, request, *args, **kwargs):
#         try:
#             user = User.objects.get(id=request.user.id)
#             if not user.profile.is_filled():
#                 if user.profile.is_restaurant():
#                     form = self.restaurant_form_class(initial={
#                         'first_name': user.first_name,
#                         'last_name': user.last_name,
#                         'email': user.email,
#                         'phone': user.profile.phone,
#                     })
#                 else:
#                     form = EditProfileForm(initial={
#                         'first_name': user.first_name,
#                         'last_name': user.last_name,
#                         'email': user.email,
#                         'phone': user.profile.phone,
#                         # 'company': user.profile.company_id,
#                     })
#             else:
#                 return HttpResponseRedirect('/')
#         except User.DoesNotExist:
#             return HttpResponseRedirect('/')
#         return render(request, self.template_name, locals())

#     def post(self, request, *args, **kwargs):
#         user = User.objects.get(id=request.user.id)

#         if user.profile.is_restaurant():
#             form = self.restaurant_form_class(request.POST)
#         else:
#             form = self.user_form_class(request.POST)

#         if form.is_valid():
#             first_name = form.cleaned_data.get('first_name')
#             last_name = form.cleaned_data.get('last_name')
#             email = form.cleaned_data.get('email')
#             phone = form.cleaned_data.get('phone')
#             lang_en = request.POST.get('lang_en')
#             lang_es = request.POST.get('lang_es')

#             profile = user.profile
#             profile.phone = phone
#             user.email = email
#             user.save()
#             profile.save()

#             if not user.profile.is_restaurant():
#                 company = form.cleaned_data.get('company')
#                 company_name = form.cleaned_data.get('company_name', '')
#                 company_street = form.cleaned_data.get('company_street', '')
#                 # company_city = form.cleaned_data.get('company_city', '')
#                 # company_state_full = form.cleaned_data.get('company_state_full', '')
#                 company_zipcode = form.cleaned_data.get('company_zipcode', '')
#                 company_phone = form.cleaned_data.get('company_phone', '')

#                 if company == '0' and not company_name and not company_phone and not company_street:
#                     messages.error(request, 'You need fill company information!')
#                     return HttpResponseRedirect('/edit_user_profile')

#                 if company != '0':
#                     profile.company = Company.objects.get(id=company)
#                 else:
#                     if company_name and company_street and company_phone:
#                         try:
#                             company = Company.objects.get(name=company_name)
#                             messages.error(request, 'Company already exist! Try register with your company.')
#                             return HttpResponseRedirect('/company_registration')
#                         except Company.DoesNotExist:
#                             company = Company.objects.create()
#                             company.name = company_name
#                             company.street = company_street
#                             # company.city = company_city
#                             # company.state = company_state_full
#                             company.zip_code = company_zipcode
#                             company.phone = company_phone
#                             company.save()
#                             profile.company = company

#             if lang_en == 'on':
#                 profile.lang = 'en'
#             else:
#                 profile.lang = 'es'

#             profile.save()

#             return render(request, 'site_message.html', {
#                 'title': 'Thank you!',
#                 'msg': 'Your profile is filled. Now You can login!'
#             })
#         else:
#             return render(request, self.template_name, locals())


def csrf_failure(request, reason=""):
    return HttpResponseRedirect('/')


class SaveMoneyWallet(View):

    def post(self, request, *args, **kwargs):
        # user_id=request.GET.get('user')
        amount=request.POST.get('euro')
        amount=float(amount)
        credit=request.POST.get('la_euros')
        # user_id=request.GET.get('user')
        try:
            user=User.objects.get(id=request.user.id)
            wallet = MoneyToWallet.objects.create(user=user,amount=amount,lafiambera_credit=credit, status=False)
            response_data={}
            response_data['success']=wallet.id
            return HttpResponse(json.dumps(response_data), content_type='application/json')
        except Exception as r:
            return HttpResponse(r)



        

    
