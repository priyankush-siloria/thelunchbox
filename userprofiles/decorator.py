from django.shortcuts import redirect
from django.contrib import messages

def check_user(function):
	def wrap(request, *args, **kwargs):
		if request.user.is_authenticated():
			if request.user.profile.is_restaurant() or request.user.profile.is_employee() or request.user.is_staff:
				messages.error(request,'invalidforsite')
				return  redirect('/{}/dashboard/'.format(request.LANGUAGE_CODE))
		return function(request, *args, **kwargs)
	wrap.__doc__ = function.__doc__
	wrap.__name__ = function.__name__
	return wrap