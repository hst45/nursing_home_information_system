from django.shortcuts import render, redirect
from django.db.models import Q
from TestModel.models import *
from .forms import *

# Create your views here.

# show
def show_old(request):
    list = Old.objects.all
    return render(request, 'sysadmin/oldinfo.html', {"list": list})

def show_guardian(request):
    list = Guardian.objects.all
    return render(request,'sysadmin/guardianinfo.html',{"list": list})

def show_carer(request):
    list = Carer.objects.all
    return render(request, 'sysadmin/carerinfo.html', {"list": list})

def show_goods(request):
    list = Goods.objects.all
    return render(request, 'sysadmin/goods.html', {"list" : list})

def show_order(request):
    list = Order.objects.all
    return render(request, 'sysadmin/order.html', {"list" : list})

def show_dailychek(request):
    list = Dailycheck.objects.all
    return render(request, 'sysadmin/dailycheck.html', {"list" : list})

def show_dailyschedule(request):
    list = Schedule.objects.all
    return render(request, 'sysadmin/dailyschedule.html', {"list" : list})

def show_dailycall(request):
    list = Call.objects.all
    return render(request, 'sysadmin/dailycall.html', {"list" : list})

def show_actcontent(request):
    list = Activity.objects.all
    return render(request, 'sysadmin/activitycontent.html', {"list" : list})

def show_actplace(request):
    list = Place.objects.all
    return render(request, 'sysadmin/activityplace.html', {"list" : list})

def show_actarrange(request):
    if request.method == 'GET':
        id = request.GET.get ('id')
        obj_list = Arrangeact.objects.filter(activity = id  )
    return render (request, 'sysadmin/activityarrange.html', {"list": obj_list})

# edit
def old_edit(request):
    nid = request.GET.get ('idcard')
    if request.method == 'GET':
        obj = Old.objects.filter(idcard = nid).first()
        model_form = OldInfoForm(instance = obj)
        return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '修改老人信息'})
    elif request.method == 'POST':
        obj = Old.objects.filter (idcard = nid).first ()
        model_form = OldInfoForm(request.POST, instance = obj)
        if model_form.is_valid():
            model_form.save()
            return redirect('/sysadmin/oldinfo')
        else:
            return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '修改老人信息'})

def guardian_edit(request):
    nid = request.GET.get ('idcard')
    if request.method == 'GET':
        obj = Guardian.objects.filter(idcard = nid).first()
        model_form = GuardianInfoForm(instance = obj)
        return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '修改监护人信息'})
    elif request.method == 'POST':
        obj = Guardian.objects.filter (idcard = nid).first ()
        model_form = GuardianInfoForm(request.POST, instance = obj)
        if model_form.is_valid():
            model_form.save()
            return redirect('/sysadmin/guardianinfo')
        else:
            return render (request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '修改监护人信息'})


def carer_edit(request):
    nid = request.GET.get ('idcard')
    if request.method == 'GET':
        obj = Carer.objects.filter(idcard = nid).first ()
        model_form = CarerInfoForm(instance = obj)
        return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '修改护工信息'})
    elif request.method == 'POST':
        obj = Carer.objects.filter (idcard = nid).first ()
        model_form = CarerInfoForm(request.POST, instance = obj)
        if model_form.is_valid():
            model_form.save()
            return redirect('/sysadmin/carerinfo')
        else:
            return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '修改护工信息'})


def goods_edit(request):
    id = request.GET.get ('id')
    if request.method == 'GET':
        obj = Goods.objects.filter(id = id).first()
        model_form = GoodsInfoForm(instance = obj)
        return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '修改商品信息'})
    elif request.method == 'POST':
        obj = Goods.objects.filter (id = id).first ()
        model_form = GoodsInfoForm(request.POST, instance = obj)
        if model_form.is_valid():
            model_form.save()
            return redirect('/sysadmin/goods')
        else:
            return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '修改商品信息'})


def order_edit(request):
    id = request.GET.get ('id')
    if request.method == 'GET':
        obj = Order.objects.filter(id = id).first()
        model_form = OrderInfoForm(instance = obj)
        return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '修改订单信息'})
    elif request.method == 'POST':
        obj = Order.objects.filter (id = id).first ()
        model_form = OrderInfoForm(request.POST, instance = obj)
        if model_form.is_valid():
            model_form.save()
            return redirect('/sysadmin/order')
        else:
            return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '修改订单信息'})


def check_edit(request):
    id = request.GET.get ('id')
    if request.method == 'GET':
        obj = Dailycheck.objects.filter(id = id).first()
        model_form = CheckInfoForm(instance = obj)
        return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '修改体检信息'})
    elif request.method == 'POST':
        obj = Dailycheck.objects.filter (id = id).first()
        model_form = CheckInfoForm(request.POST, instance = obj)
        if model_form.is_valid():
            model_form.save()
            return redirect('/sysadmin/dailycheck')
        else:
            return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '修改体检信息'})


def call_edit(request):
    id = request.GET.get ('id')
    if request.method == 'GET':
        obj = Call.objects.filter(id = id).first()
        model_form = CallInfoForm(instance = obj)
        return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '修改传呼信息'})
    elif request.method == 'POST':
        obj = Call.objects.filter (id = id).first ()
        model_form = CallInfoForm(request.POST, instance = obj)
        if model_form.is_valid():
            model_form.save()
            return redirect('/sysadmin/dailycall')
        else:
            return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '修改传呼信息'})


def schedule_edit(request):
    oid = request.GET.get ('oid')
    actid = request.GET.get ('actid')
    if request.method == 'GET':
        obj = Schedule.objects.filter(oid = oid, actid = actid).first()
        model_form = ScheInfoForm(instance = obj)
        return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '修改日程'})
    elif request.method == 'POST':
        obj = Schedule.objects.filter (oid = oid, actid = actid).first()
        model_form = ScheInfoForm(request.POST, instance = obj)
        if model_form.is_valid():
            model_form.save()
            return redirect('/sysadmin/dailysched')
        else:
            return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '修改日程'})


def activity_edit(request):
    id = request.GET.get ('id')
    if request.method == 'GET':
        obj = Activity.objects.filter(id = id).first()
        model_form = ActivityInfoForm(instance = obj)
        return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '修改活动信息'})
    elif request.method == 'POST':
        obj = Activity.objects.filter (id = id).first ()
        model_form = ActivityInfoForm(request.POST, instance = obj)
        if model_form.is_valid():
            model_form.save()
            return redirect('/sysadmin/actcontent')
        else:
            return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '修改活动信息'})


def place_edit(request):
    id = request.GET.get ('id')
    if request.method == 'GET':
        obj = Place.objects.filter(id = id).first()
        model_form = PlaceInfoForm(instance = obj)
        return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '修改活动室信息'})
    elif request.method == 'POST':
        obj = Place.objects.filter (id = id).first ()
        model_form = PlaceInfoForm(request.POST, instance = obj)
        if model_form.is_valid():
            model_form.save()
            return redirect('/sysadmin/actplace/?id='+str(id))
        else:
            return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '修改活动室信息'})


def arrange_edit(request):
    id = request.GET.get ('id')
    if request.method == 'GET':
        obj = Arrangeact.objects.filter(id = id).first()
        model_form = ArrangeInfoForm(instance = obj)
        return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '修改活动安排'})
    elif request.method == 'POST':
        obj = Arrangeact.objects.filter (id = id).first ()
        model_form = ArrangeInfoForm(request.POST, instance = obj)
        if model_form.is_valid():
            model_form.save()
            return redirect('/sysadmin/actarran/?id='+str(id))
        else:
            return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '修改活动安排'})



# add
def old_add(request):
    if request.method == 'GET':
        model_form = OldInfoForm()
        return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '添加老人信息'})
    elif request.method == 'POST':
        model_form = OldInfoForm(request.POST)
        if model_form.is_valid():
            model_form.save()
            return redirect('/sysadmin/oldinfo')
        else:
            return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '添加老人信息'})


def guardian_add(request):
    if request.method == 'GET':
        model_form = GuardianInfoForm ()
        return render (request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '添加监护人信息'})
    elif request.method == 'POST':
        model_form = GuardianInfoForm(request.POST)
        if model_form.is_valid():
            model_form.save()
            return redirect('/sysadmin/guardianinfo')
        else:
            return render (request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '添加监护人信息'})


def carer_add(request):
    if request.method == 'GET':
        model_form = CarerInfoForm()
        return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '添加护工信息'})
    elif request.method == 'POST':
        model_form = CarerInfoForm(request.POST)
        if model_form.is_valid():
            model_form.save()
            return redirect('/sysadmin/carerinfo')
        else:
            return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '添加护工信息'})


def goods_add(request):
    if request.method == 'GET':
        model_form = GoodsInfoForm()
        return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '添加商品信息'})
    elif request.method == 'POST':
        model_form = GoodsInfoForm(request.POST)
        if model_form.is_valid():
            model_form.save()
            return redirect('/sysadmin/goods')
        else:
            return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '添加商品信息'})


def order_add(request):
    if request.method == 'GET':
        model_form = OrderInfoForm()
        return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '添加订单信息'})
    elif request.method == 'POST':
        model_form = OrderInfoForm(request.POST)
        if model_form.is_valid():
            model_form.save()
            return redirect('/sysadmin/order')
        else:
            return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '添加订单信息'})


def check_add(request):
    if request.method == 'GET':
        model_form = CheckInfoForm()
        return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '添加体检信息'})
    elif request.method == 'POST':
        model_form = CheckInfoForm(request.POST)
        if model_form.is_valid():
            model_form.save()
            return redirect('/sysadmin/dailycheck')
        else:
            return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '添加体检信息'})


def call_add(request):
    if request.method == 'GET':
        model_form = CallInfoForm()
        return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '添加传呼信息'})
    elif request.method == 'POST':
        model_form = CallInfoForm(request.POST)
        if model_form.is_valid():
            model_form.save()
            return redirect('/sysadmin/dailycall')
        else:
            return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '添加传呼信息'})


def schedule_add(request):
    if request.method == 'GET':
        model_form = ScheInfoForm()
        return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '添加日程'})
    elif request.method == 'POST':
        model_form = ScheInfoForm(request.POST)
        if model_form.is_valid():
            model_form.save()
            return redirect('/sysadmin/dailysched')
        else:
            return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '添加日程'})


def activity_add(request):
    if request.method == 'GET':
        model_form = ActivityInfoForm()
        return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '添加活动信息'})
    elif request.method == 'POST':
        model_form = ActivityInfoForm(request.POST)
        if model_form.is_valid():
            model_form.save()
            return redirect('/sysadmin/actcontent')
        else:
            return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '添加活动信息'})


def place_add(request):
    if request.method == 'GET':
        model_form = PlaceInfoForm()
        return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '添加活动室信息'})
    elif request.method == 'POST':
        model_form = PlaceInfoForm(request.POST)
        if model_form.is_valid():
            model_form.save()
            return redirect('/sysadmin/actplace')
        else:
            return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '添加活动室信息'})

def arrange_add(request):
    id = request.GET.get ('id')
    if request.method == 'GET':
        model_form = ArrangeInfoForm()
        return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '添加活动安排信息'})
    elif request.method == 'POST':
        model_form = ArrangeInfoForm(request.POST)
        if model_form.is_valid():
            model_form.save()
            return redirect('/sysadmin/actarran/?id='+str(id))
        else:
            return render(request, 'sysadmin/common_edit.html', {'model_form': model_form, 'title': '添加活动室信息'})


# delete
def old_delete(request):
    if request.method == 'GET':
        nid = request.GET.get('idcard')
        obj = Old.objects.filter(idcard=nid).first()
        obj.delete()
    return redirect('/sysadmin/oldinfo')

def guardian_delete(request):
    if request.method == 'GET':
        nid = request.GET.get('idcard')
        obj = Guardian.objects.filter(idcard=nid).first()
        obj.delete()
    return redirect('/sysadmin/guardianinfo')

def carer_delete(request):
    if request.method == 'GET':
        nid = request.GET.get('idcard')
        obj = Carer.objects.filter(idcard=nid).first()
        obj.delete()
    return redirect('/sysadmin/carerinfo')

def carer_delete(request):
    if request.method == 'GET':
        nid = request.GET.get('idcard')
        obj = Carer.objects.filter(idcard=nid).first()
        obj.delete()
    return redirect('/sysadmin/carerinfo')

def goods_delete(request):
    if request.method == 'GET':
        gid = request.GET.get('id')
        obj = Goods.objects.filter(id=gid).first()
        obj.delete()
    return redirect('/sysadmin/goods')

def order_delete(request):
    if request.method == 'GET':
        id = request.GET.get('id')
        obj = Order.objects.filter(id=id).first()
        obj.delete()
    return redirect('/sysadmin/order')

def check_delete(request):
    if request.method == 'GET':
        id = request.GET.get('id')
        obj = Dailycheck.objects.filter(id=id).first()
        obj.delete()
    return redirect('/sysadmin/dailycheck')

def call_delete(request):
    # if request.method == 'GET':
    id = request.GET.get('id')
    print('----------------------------------------')
    print(id)
    obj = Call.objects.filter(id=id).first()
    obj.delete()
    return redirect('/sysadmin/dailycall')

def schedule_delete(request):
    if request.method == 'GET':
        id = request.GET.get('id')
        obj = Schedule.objects.filter(id=id).first()
        obj.delete()
    return redirect('/sysadmin/dailysched')

def act_delete(request):
    if request.method == 'GET':
        id = request.GET.get('id')
        obj = Activity.objects.filter(id=id).first()
        obj.delete()
    return redirect('/sysadmin/actcontent')

def act_delete(request):
    if request.method == 'GET':
        id = request.GET.get('id')
        obj = Activity.objects.filter(id=id).first()
        obj.delete()
    return redirect('/sysadmin/actcontent')

def place_delete(request):
    if request.method == 'GET':
        id = request.GET.get('id')
        obj = Place.objects.filter(id=id).first()
        obj.delete()
    return redirect('/sysadmin/actplace')

def arrange_delete(request):
    if request.method == 'GET':
        id = request.GET.get('id')
        obj = Arrangeact.objects.filter(id=id).first()
        obj.delete()
    return redirect('/sysadmin/actarran')


# search
def old_search(request):
    if request.method == 'GET':
        search = request.GET.get('search')
        obj_list = Old.objects.filter( Q(id=search) | Q(idcard=search) | Q(name=search))
    return render(request, 'sysadmin/oldinfo.html', {"list": obj_list})

def carer_search(request):
    if request.method == 'GET':
        search = request.GET.get('search')
        obj_list = Carer.objects.filter(Q(cid=search) | Q(idcard=search) | Q(name=search))
    return render(request, 'sysadmin/carerinfo.html', {"list": obj_list})


def guardian_search(request):
    if request.method == 'GET':
        search = request.GET.get('search')
        obj_list = Guardian.objects.filter(Q(idcard=search) | Q(name=search))
    return render(request, 'sysadmin/guardianinfo.html', {"list": obj_list})


def goods_search(request):
    if request.method == 'GET':
        search = request.GET.get('search')
        obj_list = Goods.objects.filter(name=search)
    return render(request, 'sysadmin/goods.html', {"list": obj_list})

def order_search(request):
    if request.method == 'GET':
        search = request.GET.get('search')
        obj_list = Order.objects.filter(Q(id=search) | Q(oid=search))
    return render(request, 'sysadmin/order.html', {"list": obj_list})


def check_search(request):
    if request.method == 'GET':
        search = request.GET.get('search')
        obj_list = Dailycheck.objects.filter(oid = search)
    return render(request, 'sysadmin/dailycheck.html', {"list": obj_list})


def call_search(request):
    if request.method == 'GET':
        search = request.GET.get('search')
        obj_list = Call.objects.filter(Q(old=search) | Q(carer=search) | Q(id=search))
    return render(request, 'sysadmin/dailycall.html', {"list": obj_list})


def schedule_search(request):
    if request.method == 'GET':
        search = request.GET.get('search')
        obj_list = Schedule.objects.filter(Q(oid=search) | Q(actid=search) | Q(id=search))
    return render(request, 'sysadmin/dailyschedule.html', {"list": obj_list})


def activity_search(request):
    if request.method == 'GET':
        search = request.GET.get('search')
        obj_list = Activity.objects.filter(Q(name=search) | Q(type=search) | Q(id=search))
    return render(request, 'sysadmin/activitycontent.html', {"list": obj_list})


def place_search(request):
    if request.method == 'GET':
        search = request.GET.get('search')
        obj_list = Place.objects.filter(Q(name=search) | Q(type=search) | Q(id=search))
    return render(request, 'sysadmin/activityplace.html', {"list": obj_list})