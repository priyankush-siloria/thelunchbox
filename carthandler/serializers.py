from rest_framework import serializers
from carthandler.models import *
from userprofiles.models import *
from django.conf import settings


class ReturnSerializer(serializers.ModelSerializer):
	lunchbox_name = serializers.SerializerMethodField('name')
	def name(self,obj):
		try:
			a=Lunchbox.objects.get(id=obj.lunchbox_id)
			name=a.name
			return name
		except Lunchbox.DoesNotExist:
			Cart.objects.filter(lunchbox_id=obj.lunchbox_id).delete()
			return ""
	lunchbox_image = serializers.SerializerMethodField('image')
	def image(self,obj):
		a=Lunchbox.objects.get(id=obj.lunchbox_id)
		image=a.get_image()
		if image:
			picture = settings.MEDIA_URL+str(image.image)
			return picture
		else:
			picture=settings.STATIC_URL+"mainapp/img/lunchbox_chicken_1.png"
			return picture

	qty = serializers.SerializerMethodField('qty')
	def qty(self,obj):

		qty=obj.qty
		return qty

	lunchbox_price = serializers.SerializerMethodField('total_price')
	def total_price(self,obj):
		a=Lunchbox.objects.get(id=obj.lunchbox_id)
		lunchbox_price=a.price
		return lunchbox_price

	class Meta:
		model = Cart
		fields=('lunchbox_name','qty','lunchbox_image','lunchbox_id','lunchbox_price')
