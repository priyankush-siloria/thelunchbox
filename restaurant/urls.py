# -*- coding: utf-8 -*-

"""restaurant URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-basd views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url,include
from django.contrib import admin
from django.conf import settings
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.conf.urls.static import static
from django.contrib.auth.decorators import login_required
from . import views as base
from userprofiles import views as profile
from dashboard.views import *
from login_register.views import *
from orders import views as order
from payments import urls as payments_urls
from django.views.i18n import javascript_catalog
from django.conf.urls.i18n import i18n_patterns
from mainapp.views import *
from pages.views import *
from carthandler.views import *
from mails.views import *
from mainapp.models import *
handler404 = handler404
import os
import mainapp



js_info_dict = {
    'packages': ('orders', 'restaurants', 'userprofiles',),
}




urlpatterns = [
    url(r'^jsi18n/$', javascript_catalog, js_info_dict,name='javascript-catalog'),
]

urlpatterns += i18n_patterns(
    url(r'^$', HomePage.as_view(), name='home_page'),
    url(r'^add_money/$', AddMoney.as_view(), name='add_money'),
    #url(r'^lunchbox/(?P<slug>[-\w]+)/$',CategoryLunchbox.as_view(), name='category_lunchbox'),
    url(r'^lunchbox/(?P<slug>.*)/$',CategoryLunchbox.as_view(), name='category_lunchbox'),
    url(r'^details/(?P<slug>.*)/(?P<pk>\d+)/$',IndividualLunchbox.as_view(), name='individual_lunchbox'),
    url(r'^open/box/(?P<pk>\d+)/$',SingleBox.as_view(), name='single_box'),
    url(r'^restaurantbox/details/(?P<restaurant_id>\d+)/$',RestaurantLunchbox.as_view(), name='individual_lunchbox_restaurant'),
    url(r'^all/$',AllLunchbox.as_view(), name='all'),
    url(r'^faqs/$',FaqsView.as_view(), name='faqs'),
    url(r'^user/orders/$',UserOrders.as_view(), name='user_orders'),
    url(r'^invite/$',InviteFriend.as_view(), name='invite'),
    url(r'^evening/orders/$',EveningOrders.as_view(), name='evening_orders'),
    url(r'^accept/share/$',AcceptShare.as_view(), name='accept_share'),
    url(r'^invite/mail/$',InviteMail.as_view(), name='invite_mail'),
    url(r'^share/lunchbox/$',ShareLunchbox.as_view(), name='share_lunchbox'),
    url(r'^share/lunchbox/page/$',SharePage.as_view(), name='share_lunchbox_page'),
    url(r'^share/credit/$',ShareCredit.as_view(), name='share_credit'),
    url(r'^forget_password/$',ForgotPassword.as_view(), name='forget_password'),
    url(r'^wallet/history/$',WalletHistory.as_view(), name='wallet_history'),
    url(r'^user/notifications/$',UserNotifications.as_view(), name='customer_notification'),
    url(r'^accept/invite/(?P<code>[-\w]+)/$',AcceptInvite.as_view(), name='invite_accept'),
    url(r'^restaurant/lunchbox/(?P<restaurant_id>\d+)/(?P<type>\d+)/$',RestaurantProfileLunchboxes.as_view(), name='restaurant_lunchboxes_detail'),
    url(r'^user/order/detail/(?P<id>\d+)/$', UserOrderDetail.as_view(), name='user_order_detail'),
    url(r'^customer/profile/(?P<id>\d+)/$',CustomerProfile.as_view(), name='customer_profile'),
    url(r'^restaurant/profile/(?P<restaurant_id>\d+)/$',RestaurantProfile.as_view(), name='restaurant_profile'),
    url(r'^group/benifits/offer/$',GroupBenifits.as_view(), name='group_benifits'),
    url(r'^steps_to_healthy_lunch/$',StepsView.as_view(), name='steps'),
    url(r'^contactus/$',ContactUsView.as_view(), name='contactus'),
    url(r'^enjoy_your_box/$', order.EnjoyYourLunchbox.as_view(
        template_name='enjoy_your_box.html'), name='enjoy_your_lunchbox'),
    url(r'^payment/confirmation/$',PaymentConfirmation.as_view(), name='payment_confirmation'),
    url(r'^wallet/payment/confirmation/(?P<id>\d+)/$',ConfirmWalletPaid.as_view(), name='wallet_payment_confirmation'),
    url(r'^old_home$', base.Home.as_view(template_name='index.html'), name='home'),
    url(r'^login/$',LoginView.as_view(), name='login'),
    url(r'^confirm/visa/payment/$',ConfirmSermpaResponse.as_view(), name='visa_payment'),
    url(r'^mailorderdetail/$',MailDailyOrders.as_view(), name='mailorderdetail'),
    url(r'^achieve/usernotification/$',ArchieveUserNoti.as_view(), name='archieve_usernotification'),
    url(r'^mailuserorderdetail/$',MailUserOrders.as_view(), name='mailuserorderdetail'),
    url(r'^easycart/',include('cart.urls')),
    url(r'^user_registration/$', base.Registration.as_view(template_name="user_registration.html"), name='registration'),
    url(r'^user/registration/$', Registration.as_view(), name='uregistration'),
    url(r'^user/registration/(?P<code>[-\w]+)/$', AcceptInvite.as_view(), name='invite_registration'),
    url(r'^company_registration/$', base.CompanyRegistration.as_view(template_name="company_registration.html"), name='company_registration'),
    url(r'^restaurant_registration/$', base.RestaurantRegistration.as_view(template_name="restaurant_registration.html"), name='restaurant_registration'),
    url(r'^restaurant/registration/$', RestaurantRegistration.as_view(), name='resregistration'),
    url(r'^admin_registration/$', base.AdminRegistration.as_view(template_name="admin_registration.html"), name='admin_registration'),
    url(r'^check_user_profile/$', login_required(base.CheckUserProfile.as_view()), name='check_user_profile'),
    url(r'^edit_user_profile/$', login_required(base.EditUserProfile.as_view()), name='edit_user_profile'),
    url(r'^site_message/$', base.SiteMessage.as_view(template_name="site_message.html"), name='message'),
    url(r'^activation/(?P<code>[-\w]+)/$', base.Activate.as_view()),
    url(r'^save_money_wallet/$', base.SaveMoneyWallet.as_view(),name='save_money_wallet'),
    # url(r'^cart/',include('cart_handling.urls')),
    url(r'^tocart/$', AddToCart.as_view(), name='tocart'),
    url(r'^showcart/$', ShowCart.as_view(), name='showcart'),
    url(r'^checkout/$',Checkout.as_view(), name='checkout'),
    url(r'^logout/$',Logout.as_view(), name='logout'),
    url(r'^chlogin/$',CheckLoginView.as_view(), name='chlogin'),
    url(r'^checkoutaction/$',CheckoutCal.as_view(), name='checkoutaction'),
    url(r'^apply_promo_code_discount/$',CheckPromoCodeDiscount.as_view(), name='apply_promo_code_discount'),
    url(r'^checkoutdata/$',CheckoutData.as_view(), name='checkoutdata'),
    url(r'^orderpayment/$',OrderPayment.as_view(), name='orderpayment'),
    url(r'^remove_cart_item/$',RemoveCartItem.as_view(), name='remove_cart_item'),
    url(r'^search/$',Search.as_view(), name='search'),
    url(r'^recover_password/(?P<user_id>\d+)/(?P<activation_key>\w+)',ResetPassword.as_view(), name='reset'),
    url(r'^login_change_password/$',ChangePassword.as_view(), name='login_change_password'),
    url(r'^savemailorder/$',MailUserOrders.as_view(),name='savemailorder')
   
)

urlpatterns +=  i18n_patterns(
    
    url(r'^restaurant/(?P<slug>[-\w]+)/$', profile.RestaurantProfile.as_view(template_name="restaurant_profile.html"), name='restaurant'),
    url(r'^get_coupon/(?P<restaurant_id>\d+)/$', login_required(profile.GetCoupon.as_view()), name='get_coupon'),
    url(r'^profile/$', login_required(profile.UserProfile.as_view(template_name="user_profile.html")), name='profile'),
    url(r'^add_to_cart/$', login_required(order.AddToCart.as_view()), name='to_cart'),
    # url(r'^add_to_cart$', order.addtocart, name='to_cart'),
    # url(r'^add_to_catering_cart/$', order.AddToCateringCart.as_view(), name='to_catering_cart'),
    # url(r'^add_to_catering_cart/(?P<item_id>\d+)/$', order.AddToCateringCart.as_view(), name='to_catering_cart'),
    url(r'^ask_restaurant/$', login_required(profile.AskRestaurant.as_view()), name='ask_restaurant'),
    url(r'^communication_with_restaurant/$', login_required(profile.CommunicationWithRestaurant.as_view()), name='communication_with_restaurant'),
    url(r'^leave_review/$', login_required(profile.LeaveReview.as_view()), name='leave_review'),
    url(r'^restaurant_reply/$', login_required(profile.RestaurantReply.as_view()), name='restaurant_reply'),
    url(r'^archive_notification/$', login_required(profile.ArchiveNotification.as_view()), name='archive_notification'),
    url(r'^archive/notification/$', login_required(ArchiveNotification.as_view()), name='archive_noti'),
    url(r'^rate_lunchbox/$', login_required(profile.RateLunchbox.as_view()), name='rate_lunchbox'),
    url(r'^request_lunchbox/$', login_required(profile.RequestLunchbox.as_view()), name='request_lunchbox'),
    url(r'^remove_from_cart/(?P<item_id>\d+)/$', order.RemoveFromCart.as_view(), name='remove_from_cart'),
    url(r'^update_item_qty/$', order.UpdateOrderItemQty.as_view(), name='update_order_item_qty'),
    # url(r'^remove_from_catering_cart/(?P<item_id>\d+)/$', order.RemoveFromCateringCart.as_view(), name='remove_from_catering_cart'),
    url(r'^cart/$', order.Cart.as_view(template_name="cart.html"), name='cart'),
    # url(r'^catering_cart/$', order.CateringCart.as_view(template_name="catering_cart.html"), name='catering_cart'),
    url(r'^get_promo_code_discount/$', login_required(order.GetPromoCodeDiscount.as_view()), name='get_promo_code_discount'),
    url(r'^service_rating/$', login_required(order.RateService.as_view()), name='rate_service'),
    url(r'^check_restaurant_availability', order.restaurant_is_open, name='restaurant_open'),
    url(r'^ckeditor/', include('ckeditor_uploader.urls')),
    url(r'^ratings/$', RateService.as_view(), name='ratings'),
    url(r'^pay_wallet/$', PayWallet.as_view(), name='pay_wallet'),
)

urlpatterns +=   i18n_patterns(url(r'^blog/', include('django_blog_it.urls')))
urlpatterns += [url(r'^accounts/', include('allauth.urls'))]

urlpatterns +=  i18n_patterns(
    url(r'^lang/(?P<lng>[-\w]+)/$', base.ChangeLang.as_view(), name='change_lang'),
    url(r'^i18n/', include('django.conf.urls.i18n')),
    url(r'^admin/', admin.site.urls),
    url(r'^dashboard/restaurant/coupan/(?P<restaurant_id>\d+)/$',Coupan.as_view(), name='coupan'),
    url(r'^dashboard/get/data/$',DashboardGetTable.as_view(), name='get_table_data_admin'),
    url(r'^control/$', login_required(profile.Control.as_view()), name='control'),
    url(r'^control/(?P<restaurant_id>\d+)/$', login_required(profile.Control.as_view()), name='admin_control'),
    url(r'^control/restaurant/$', login_required(profile.ControlRestaurant.as_view()), name='restaurant_info'),
    url(r'^control/restaurant/(?P<restaurant_id>\d+)/$', login_required(profile.ControlRestaurant.as_view()), name='admin_restaurant_info'),
    url(r'^control/restaurants/$', login_required(profile.ControlRestaurants.as_view()), name='restaurants'),
    url(r'^dashboard/restaurants/$', login_required(DashboardRestaurants.as_view()), name='dashrestaurants'),
    url(r'^dashboard/add/restaurant/$', login_required(DashboardAddRestaurant.as_view()), name='admin_restaurant_add'),
    url(r'^control/orders/$', login_required(profile.ControlOrders.as_view()), name='orders'),
    url(r'^control/billing/$', login_required(profile.ControlBilling.as_view()), name='billing'),
    url(r'^dashboard/lunchbox/management/(?P<restaurant_id>\d+)/$', login_required(LunchboxManagement.as_view()), name='lunchbox_management'),
  
    url(r'^dashboard/lunchbox/management/(?P<restaurant_id>\d+)/edit/(?P<lunchbox_id>\d+)/$', login_required(EditLunchbox.as_view()), name='edit_lunchboxes'),
    
    url(r'^dashboard/order/$', login_required(DashboardOrders.as_view()), name='dashorders'),
    url(r'^dashboard/billing/$', login_required(DashboardBilling.as_view()), name='dashbilling'),
    url(r'^dashboard/$', login_required(Dashboard.as_view()), name='dashboard_home'),
    url(r'^dashboard/admin/notifications/$', login_required(AdminNotifications.as_view()), name='admin_notifications'),
    url(r'^dashboard/restaurant/(?P<restaurant_id>\d+)/$', login_required(DashboardRestaurant.as_view()), name='admin_restaurant_information'),
    url(r'^dashboard/restaurant/$', login_required(DashboardRestaurant.as_view()), name='admin_restaurant_information'),
    url(r'^dashboard/set_order_process_status/$',login_required(DashboardSetOrderStatus.as_view()),name='process_status'),
    url(r'^control/set_order_process_status/$',
        login_required(profile.ControlSetOrderStatus.as_view()),
        name='order_process_status'),
    url(r'^dashboard/lunchbox/duplicate/(?P<box_id>\d+)/$', login_required(DuplicateLunchbox.as_view()), name='duplicate_box'),
    url(r'^dashboard/lunchbox/delete/(?P<id>\d+)/$', login_required(DeleteLunchbox.as_view()), name='del_lunchbox'),
    url(r'^dashboard/order/detail/(?P<id>\d+)/$', login_required(OrderDetail.as_view()), name='order_detail'),
    url(r'^control/contract/$', login_required(profile.ControlContract.as_view()), name='contract'),
    url(r'^control/restaurant/(?P<restaurant_id>\d+)/contract/$', login_required(profile.ControlContract.as_view()), name='admin_contract'),
    url(r'^dashboard/set_msg_priority/$', login_required(SetMsgPriority.as_view()), name='set_priority'),
    url(r'^control/notifications/$', login_required(profile.ControlNotifications.as_view()), name='notifications'),
    url(r'^control/set_msg_priority/$', login_required(profile.ControlSetMsgPriority.as_view()), name='set_msg_priority'),
    url(r'^control/remove_restaurant/$', login_required(profile.RemoveRestaurant.as_view()), name='remove_restaurant'),

    url(r'^control/lunchbox/create/$', login_required(profile.ControlCreateLunchbox.as_view()), name='create_lunchbox'),
    url(r'^control/restaurant/(?P<restaurant_id>\d+)/lunchbox/create/$', login_required(profile.ControlCreateLunchbox.as_view()), name='admin_create_lunchbox'),

    url(r'^control/lunchbox/edit/(?P<id>\d+)/$', login_required(profile.ControlEditLunchbox.as_view()), name='edit_lunchbox'),
    url(r'^control/restaurant/(?P<restaurant_id>\d+)/lunchbox/edit/(?P<id>\d+)/$', login_required(profile.ControlEditLunchbox.as_view()), name='admin_edit_lunchbox'),

    url(r'^control/lunchbox/archive/(?P<id>\d+)/$', login_required(profile.ControlArchiveLunchbox.as_view()), name='archive_lunchbox'),
    url(r'^control/restaurant/(?P<restaurant_id>\d+)/lunchbox/archive/(?P<id>\d+)/$', login_required(profile.ControlArchiveLunchbox.as_view()), name='admin_archive_lunchbox'),

    url(r'^control/lunchbox/delete/(?P<id>\d+)/$', login_required(profile.ControlDeleteLunchbox.as_view()), name='delete_lunchbox'),
    url(r'^control/lunchbox/duplicate/(?P<id>\d+)/$', login_required(profile.ControlDuplicateLunchbox.as_view()), name='duplicate_lunchbox'),
    url(r'^control/restaurant/(?P<restaurant_id>\d+)/lunchbox/duplicate/(?P<id>\d+)/$', login_required(profile.ControlDuplicateLunchbox.as_view()), name='admin_duplicate_lunchbox'),

    url(r'^control/saved_lunchboxes/$', login_required(profile.ControlSavedLunchboxes.as_view()), name='saved_lunchboxes'),
    url(r'^control/restaurant/(?P<restaurant_id>\d+)/saved_lunchboxes/$', login_required(profile.ControlSavedLunchboxes.as_view()), name='admin_saved_lunchboxes'),

    url(r'^control/published_lunchboxes/$', login_required(profile.ControlPublishedLunchboxes.as_view()), name='published_lunchboxes'),
    url(r'^control/restaurant/(?P<restaurant_id>\d+)/published_lunchboxes/$', login_required(profile.ControlPublishedLunchboxes.as_view()), name='admin_published_lunchboxes'),

    url(r'^control/archived_lunchboxes/$', login_required(profile.ControlArchivedLunchboxes.as_view()), name='archived_lunchboxes'),
    url(r'^control/restaurant/(?P<restaurant_id>\d+)/archived_lunchboxes/$', login_required(profile.ControlArchivedLunchboxes.as_view()), name='admin_archived_lunchboxes'),

    url(r'^get_lunchbox_admin_messages/$', login_required(profile.ControlLunchboxAdminMessages.as_view()), name='get_lunchbox_admin_messages')
)

urlpatterns += [url(r'^', include(payments_urls))]

# Static and media files (DEBUG MODE NOT PRODUCTION!)

print '433333333333333333333',settings.DEBUG

if settings.DEBUG:
    print settings.STATIC_URL
    urlpatterns += static(settings.MEDIA_URL,
                          document_root=settings.MEDIA_ROOT)
    urlpatterns += static(settings.STATIC_URL,
                          document_root=settings.STATIC_ROOT)
    urlpatterns += staticfiles_urlpatterns()
if settings.DEBUG is False:
    print 'ssssssssssssssssssssss'
    urlpatterns += static(settings.MEDIA_URL,
                          document_root=settings.MEDIA_ROOT)
    urlpatterns += static(settings.STATIC_URL,
                          document_root=settings.STATIC_ROOT)
    urlpatterns += staticfiles_urlpatterns()
