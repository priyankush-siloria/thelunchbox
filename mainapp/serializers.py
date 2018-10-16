from rest_framework import serializers
from carthandler.models import *
from userprofiles.models import *
from django.conf import settings


class ReturnSerializer(serializers.ModelSerializer):
	
	delivery_date = serializers.SerializerMethodField('date')
	def date(self,obj):
		date1=obj.delivery_date
		date2=obj.delivery_time
		date3=str(date1)+" "+str(date2)
		return str(date3)

	class Meta:
		model = Cart
		fields=('lunchbox_id','delivery_date','qty')
