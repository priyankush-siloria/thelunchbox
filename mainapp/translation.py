from modeltranslation.translator import translator, TranslationOptions
# from django_blog_it.django_blog_it.models import *
from mainapp.models import Category,HomeContent,UserNotification
from userprofiles.models import Lunchbox,Restaurant
from pages.models import Faqs,LunchSteps,GroupBenifits
from django_blog_it.django_blog_it.models import *

class CategoryTranslationOptions(TranslationOptions):
    fields = ('title', 'description',)


translator.register(Category, CategoryTranslationOptions)


class LunchboxTranslationOptions(TranslationOptions):
	fields = ('desc',)

translator.register(Lunchbox, LunchboxTranslationOptions)


class RestaurantTranslationOptions(TranslationOptions):
	fields = ('desc',)

translator.register(Restaurant, RestaurantTranslationOptions)


class FaqsTranslationOptions(TranslationOptions):
    fields = ('title', 'description',)

translator.register(Faqs, FaqsTranslationOptions)


class LunchStepsTranslationOptions(TranslationOptions):
    fields = ('title', 'content',)

translator.register(LunchSteps, LunchStepsTranslationOptions)

class HomeContentTranslationOptions(TranslationOptions):
    fields = ('title', 'description','msg',)
    
translator.register(HomeContent, HomeContentTranslationOptions)


class BlogPostTranslation(TranslationOptions):
    fields = ('title', 'slug','content',)
    
translator.register(Post, BlogPostTranslation)

class GroupBenifitsTranslationOptions(TranslationOptions):
    fields = ('title', 'head','description',)
    
translator.register(GroupBenifits, GroupBenifitsTranslationOptions)

class UserNotificationTranslationOptions(TranslationOptions):
    fields = ( 'head','msg',)
    
translator.register(UserNotification, UserNotificationTranslationOptions)