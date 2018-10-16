from mainapp.models import Category,HomeContent

def categories(request):
	categories = Category.objects.all()
	homecontent = HomeContent.objects.all()
	return {'categories':categories,'homecontent':homecontent}


