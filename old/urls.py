"""old URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.urls import path, include
from . import views
from django.conf.urls import handler404, handler500

#
# handler404 = ".views.page_not_found"
# handler500 = ".views.page_error"


urlpatterns = [

    path('oldindex/', views.old_index, name="index"),
    path('oldinfo/', views.oldinfo, name="oldinfo"),
    path('oldcall/', views.old_call, name="call"),

    path('order/', views.order, name="order"),
    path('goodlist/', views.goodlist, name="goodlist"),
    path('dailycheck/', views.dailycheck, name="dailycheck"),
    # path('appointment/', views.appointment, name="appointment"),
    # path('todolist/', views.todolist, name="todolist"),
    # path('activity/', views.activity, name="activity"),
    # path('newactivity/', views.newactivity, name="newactivity"),
    # path('dele/', views.dele),
    # path('procedure.html/', views.procedure),

    path('index/addcall/', views.add_call),
    path('index/addnote/', views.add_note),
    path('goodlist/addorder/', views.order),
    path('detail/', views.order),
    path('oldcalendar.html/', views.old_calendar, name="calender"),
    path('actlist/', views.actlist, name="actlist"),
    path('actlist/addact/', views.add_act),
    # path('activity/', views.dailycheck),

    path('index/',views.index),
    path('index0/', views.index0),
    path('dele/',views.dele),
    path('call/',views.call),
    path('procedure.html/',views.procedure),
    path('edit.html/',views.edit),
    path('edit2.html/',views.edit2),
    path('calendar.html/',views.calendar),
    path('chart.html/',views.chart),
    path('place.html/',views.place),
    path('form.html/',views.form),
    path('orderdone/', views.orderdone, name="orderdone"),
    path('orderdone/orderstate/', views.orderdone, name="orderdone"),
    path('detaildone/', views.orderdone),
    path('activitynum.html/', views.activitynum),
    path('signin.html/',views.signin),
    path('logout/',views.logout),

    path('sysadmin/', include('sysadmin.urls'))


]
