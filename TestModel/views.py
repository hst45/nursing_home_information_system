from django.shortcuts import render
from TestModel.models import Old, Guardian
from django.shortcuts import redirect
# Create your views here.


def index(request):
    list = Old.objects.all()
    return render(request, 'index.html', {"list":list})


def oldinfo(request):
    list = Old.objects.all()
    return render(request, 'oldinfo.html', {"list": list})