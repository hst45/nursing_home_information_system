from TestModel.models import *
from TestModel.mysqlview import *
from django.shortcuts import render, redirect, HttpResponse
from django.http import JsonResponse,Http404,HttpResponse
import time
from datetime import datetime
from django.db.models import Q
# from django.shortcuts import render_to_response
#
# def page_not_found(request):
#     return render_to_response('404.html')
#
#
# def page_error(request):
#     return render_to_response('500.html')


def logout(request):
    # del request.session["is_login"] # 删除session_data里的一组键值对
    request.session.flush()  # 删除一条记录包括(session_key session_data expire_date)三个字段
    return redirect('/signin.html/')


def signin(request):
    if request.method == 'GET':
        return render(request, 'signin.html')
    elif request.method == 'POST':
        identity = request.POST.get('identity')
        id = request.POST.get('id')
        password = request.POST.get('password')
        print(identity, id, password)
        if identity == '1':
            obj = AuthUser.objects.filter(username=id,password=password).first()
            if not obj:
                return redirect("/signin.html/")
            else:
                request.session['is_login'] = True
                request.session['user1'] = id
                return redirect("/sysadmin/")
        elif identity == '2':
            obj = Old.objects.filter(id=id,password=password).first()
            if not obj:
                return redirect("/signin.html/")
            else:
                request.session['is_login'] = True
                request.session['user1'] = id
                return redirect("/oldindex/")
        elif identity=='3':
            obj=Carer.objects.filter(cid=id,password=password).first()
            if not obj:
                return redirect("/signin.html/")
            else:
                request.session['is_login'] = True
                request.session['user1'] = id
                return redirect("/index0/")
        else:
            return render(request, 'signin.html',{'script':'alert','wrong':'登录失败！'})






# def test(request):
#     if request.method == "POST":
#         obj = ([{'value': 3, 'name': '未执行'}, {'value': 8, 'name': '已执行'}], ['未执行', '已执行'])
#         bar = [120, 200, 150, 80, 70, 110, 130]
#         return JsonResponse({"obj": obj, 'bar': bar})
#     else:
#
#         return render(request, 'index.html', )


def old_index(request):
    me = request.session.get('user1')
    list = Old.objects.filter(id=me)#老人信息
    notmelist = Old.objects.exclude(id=me)
    calllist = Call.objects.filter(old=me,status=0)#传呼信息
    notelist = Note.objects.filter(me=me)
    # nid = '100801'
    obj = Dailycheck.objects.filter(oid=me)#体检数据
    name = Old.objects.get(id=me).name
    import pymysql
    conn = pymysql.connect(host='127.0.0.1', user='root', password='123456', database='dbdb', charset='utf8')
    cur = conn.cursor()
    cur.callproc('consume_procedure', (me,))#执行存储过程查询消费
    conn.commit()
    result = cur.fetchall()
    # print(result)
    conn.close()
    return render(request,'oldindex.html', {"list": list, "call": calllist, "chart": obj,'result':result, 'name':name,'note':notelist, 'notme':notmelist})


def old_call(request):
    me = request.session.get('user1')
    list = Call.objects.filter(old=me)
    # instance = Old.objects.get(id=me)
    notelist = Note.objects.filter(me=me,status=0)
    print(notelist)
    return render(request, {"call": list, 'note':notelist})


def order(request):
    me = request.session.get('user1')
    instance = Old.objects.get(id=me)
    list = Order.objects.filter(oid=instance)
    # details = Orderdetails.objects.all()

    import pymysql
    import decimal
    conn = pymysql.connect(host='127.0.0.1', user='root', password='123456', database='dbdb', charset='utf8')
    cur = conn.cursor()
    cur.callproc('consume_procedure', (me,))
    conn.commit()
    result = cur.fetchall()

    cur.callproc('month_report', (me,time.strftime("%Y",time.localtime(time.time()))))
    conn.commit()
    monthsum = cur.fetchall()
    conn.close()
    month=[0,0,0,0,0,0,0,0,0,0,0,0]
    for i in monthsum:
        month[i[0]-1]=float(decimal.Decimal(i[1]).quantize(decimal.Decimal('0.0')))
    if request.method == 'GET':
        orderid = request.GET.get('orderid')
        # list = Order.objects.filter(oid=instance)
        details = ViewOrderDetail.objects.filter(orderid=orderid)
        return render(request, 'order.html',{"orders":list, 'result':result, 'monthsum':month, "p": orderid, "details": details})
    if request.method == 'POST':
        goods_lst = request.POST.getlist('box')
        # print('address_id，’---->>>', address_id)
        # 获取选中商品的信息，传递到前端
        all_price = 0
        # price_lst = []
        order = {}
        order['location'] = request.POST['location']
        order['id'] = datetime.now().strftime('%Y%m%d%H%M%S')
        for item in goods_lst:
            price = Goods.objects.get(id=item).price
            # price_lst.append(price)
            all_price += price  # 设一个变量获取所有商品的总价钱
            record = Orderdetails(orderid=order['id'], goodsid=int(item), price=price, num=1)  #
            record.save()
        test1 = Order(id=order['id'], oid=instance, location=order['location'], totalprice=all_price, status='0',
                        time=time.strftime("%Y-%m-%d %X", time.localtime()))  #
        test1.save()
        # return redirect('/order/')
    return render(request, 'order.html',{"orders":list, 'result':result, 'monthsum':month})


def goodlist(request):
    list = Goods.objects.all()

    data = {
        "goods":list,
        "total_price": 3
            }
    return render(request, 'goodlist.html',context=data)


def add_call(request):
    me = request.session.get('user1')
    # name = Old.objects.get(id=me).name
    ctx = {}
    if request.POST:
        ctx['title'] = request.POST['title']
        ctx['content'] = request.POST['content']
        instance = Old.objects.get(id=me)
        test1 = Call(old=instance, location=ctx['title'], note=ctx['content'], time=time.strftime("%Y-%m-%d %X", time.localtime())
                     , status=0)        #
        test1.save()
    list = Old.objects.all()
    calllist = Call.objects.all()
    return redirect('/oldindex/')


def add_note(request):
    me = request.session.get('user1')
    if request.POST:
        other = request.POST['other']
        content = request.POST['content']
        instance = Old.objects.get(id=me)
        otherins = Old.objects.get(id=other)
        test1 = Note(other=instance, me=otherins, note=content, time=time.strftime("%Y-%m-%d %X", time.localtime()))        #
        test1.save()
    # list = Old.objects.all()
    # notelist = Note.objects.all()
    return redirect('/oldindex/')

def enter_order(request):
    me = request.session.get('user1')
    instance = Old.objects.get(id=me)
    if request.method == 'POST':
        goods_lst = request.POST.getlist('box')
        # print('address_id，’---->>>', address_id)
        # 获取选中商品的信息，传递到前端
        all_price = 0
        # price_lst = []
        order = {}
        order['location'] = request.POST['location']
        order['id'] = datetime.now().strftime('%Y%m%d%H%M%S')
        for item in goods_lst:
            price = Goods.objects.get(id=item).price
            # price_lst.append(price)
            all_price += price  # 设一个变量获取所有商品的总价钱
            record = Orderdetails(orderid=order['id'], goodsid=int(item), price=price, num=1)  #
            record.save()
        test1 = Order(id=order['id'], oid=instance, location=order['location'], totalprice=all_price, status='0',
                        time=time.strftime("%Y-%m-%d %X", time.localtime()))  #
        test1.save()
    list = Order.objects.all()
    return render(request, 'order.html', {"orders": list})


def order_detail(request):
    if request.method == 'GET':
        orderid = request.GET.get('orderid')
        list = Order.objects.all()
        details = ViewOrderDetail.objects.filter(orderid=orderid)
    return render(request, 'order.html', {"orders": list, "p": orderid, "details": details})


def dailycheck(request):
    me = request.session.get('user1')
    # nid = '100801'
    obj = Dailycheck.objects.filter(oid=me)
    return render(request, 'dailycheck.html', {"list": obj})


def old_calendar(request):
    # nid='100801'
    if request.method == 'GET':
        me = request.session.get('user1')
        list = ViewOldSchedule.objects.filter(oid=me)
        return render(request, 'oldcalendar.html', {"list":list, "p":list})
    else:
        return redirect("/oldcalendar.html")


def oldinfo(request):
    if request.method == 'GET':
        me = request.session.get('user1')
    # nid = "100801"
    obj = Old.objects.get(id=me)
    guardian = Guardian.objects.filter(oid=me).first
    return render(request, 'oldinfo.html', {'list': obj, 'guard':guardian})


def actlist(request):
    if request.method == 'GET':
        me = request.session.get('user1')
    list = Arrangeact.objects.all()
    # inlist = Schedule.objects.filter(oid=me).values('actid')
    inlist = [i[0] for i in Schedule.objects.filter(oid=me).values_list('actid')]
    # print(inlist)
    # list = Arrangeact.objects.exclude(id__in=inlist)

    data = {
        "act":list,
        'inlist':inlist
            }
    return render(request, 'actlist.html',context=data)


def add_act(request):
    me = request.session.get('user1')
    instance = Old.objects.get(id=me)
    if request.method == 'POST':
        actid = int(request.POST.get('box'))
        print(actid)
        inlist = [i[0] for i in Schedule.objects.filter(oid=me).values_list('actid')]
        actins = Arrangeact.objects.get(id=actid)
        print(inlist)
        if actid in inlist:
            Schedule.objects.filter(actid=actins,oid=instance).delete()
            obj = Arrangeact.objects.get(id=actid)
            obj.participants -= 1
            obj.save()
        else:
            test1 = Schedule(oid=instance, actid=actins)  #
            test1.save()
            obj = Arrangeact.objects.get(id=actid)
            obj.participants += 1
            obj.save()
    # nid = "100801"
    # if request.method == 'GET':
    me = request.session.get('user1')
    list = ViewOldSchedule.objects.filter(oid=me)
    return render(request, 'oldcalendar.html', {"list": list})


# 护工系统
def index(request):
    if request.method == 'GET':
        me=request.session.get('user1')
        print(me)
        list = Old.objects.filter(carer=me)
        item = Call.objects.filter(status=0)
        num=Call.objects.filter(status=0).count
        return render(request,'index.html',{"list":list,"item":item,"num":num})
    elif request.method == 'POST':
        search = request.POST.get('search')
        print(search)
        obj = Old.objects.filter(name=search)
        print(obj)
        return render(request,'index.html',{"list":obj})

def index0(request):
    me=request.session.get('user1')
    name = Carer.objects.get(cid=me).name
    item = Call.objects.filter(status=0)
    num = Call.objects.filter(status=0).count
    return render(request,'index0.html',{'name':name,"item":item,"num":num})


def place(request):
    list = Place.objects.all()
    print(list[0].image)
    return render(request, 'place.html', {"list":list})


def form(request):
    list = Activity.objects.all()
    list1 = Place.objects.all()
    carer = Carer.objects.all()
    me=request.session['user1']
    print(me,me,me)
    name=Carer.objects.filter(cid=me).first().name
    print(name)
    import pymysql
    conn = pymysql.connect(host='127.0.0.1', user='root', password='123456', database='dbdb', charset='utf8')
    cur = conn.cursor()
    cur.callproc('p')
    conn.commit()
    result = cur.fetchall()
    print(len(result))
    for i in result:
        print(i)
    #计算每有几种类型的场地
    placetypenum=int(len(result)/5)
    placetype=[]
    whole = []#存入整个场地统计信息
    for i in range(placetypenum):
        print(i)
        alist=[]
        alist.append(result[i][0])
        for j in range(i,len(result),placetypenum):
            alist.append(result[j][1])
        placetype.append(result[i][0])
        whole.append(alist)
    print(whole)
    print(placetype)
    if request.method == 'GET':
        return render(request, 'form.html', {"list": list, "list1": list1, 'carer':carer,'me':me,'name':name,'whole':whole})
    elif request.method == 'POST':
        number = request.POST.get('number')
        activity = request.POST.get('activity')
        obj1 = Activity.objects.filter(id=activity)     #obj1是个集合，之后使用的话要加下标
        day = request.POST.get('day')
        a=day.split('/')#获取日期数组
        print(a)
        day=a[2]+"-"+a[0]+'-'+a[1]#重新组合日期
        time1 = request.POST.get('time1')#开始时间
        time2 = request.POST.get('time2')#结束时间
        site = request.POST.get('site')
        obj = Place.objects.filter(id=site)#获取地点对象，因为外码中对应的是一个对象而不是一个id
        # orinum=Place.objects.filter(id=site).first().lent
        # orinum=orinum+1
        holder=request.POST.getlist('holder')#获取多个值用getlist
        #c=Arrangeact.objects.all().count()#获取活动安排的总数
        #n = Activitynum.objects.all().count()  # 获取活动安排的总数
        #c=c+1#新加入一条的id
        #n=n+1
        print(number,activity,day,time2,time1,site)
        print(holder)
        try:
            Arrangeact.objects.create(number=0, activity=obj1[0], day=day, time1=time1, time2=time2, site=obj[0], participants=0)
        except:
            return render(request, 'form.html', {"list": list, "list1": list1, 'carer':carer,'script': "alert", 'wrong': '该时间段该场地已被占用，请重新安排','whole':whole})
        try:
            ob=Arrangeact.objects.last()#修改人数
            ob.number=number
            ob.save()
            newest = Arrangeact.objects.last()
            for i in holder:  # 插入到人员安排表
                o = Carer.objects.filter(cid=i).first()
                Activitynum.objects.create(cid=o, aid=newest)
            # Place.objects.filter(id=site).update(lent=orinum)
            return render(request, 'form.html', {"list": list, "list1": list1, 'carer':carer,'script':'alert','wrong':'安排成功！','whole':whole})
        except:
            Arrangeact.objects.last().delete()
            return render(request, 'form.html', {"list": list, "list1": list1,'carer':carer, 'script': "alert", 'wrong': '活动人数超过场地容量！','whole':whole})


def dele(request):
    nid = request.GET.get('idcard')
    Guardian.objects.filter(idcard=nid).delete()
    me = request.session.get('user1')
    # print(me)
    list = Viewocg.objects.filter(cid=me)
    return render(request, 'procedure.html', {"list": list,'script':'alert','alert':'已删除！'})



def call(request):
    id=request.GET.get('id')
    me = request.session.get('user1')
    Call.objects.filter(id=id).update(status=1)
    # list = Old.objects.all()
    item = Call.objects.filter(status=0)
    num = Call.objects.filter(status=0).count
    name = Carer.objects.get(cid=me).name
    return render(request, 'index0.html', {'name':name,"item":item,"num":num,'script':'alert','alert':'完成传呼！'})



def edit(request):
    if request.method == 'GET':
        nid = request.GET.get('idcard')
        obj = Guardian.objects.filter(idcard=nid).first()
        return render(request, 'edit.html', {'list': obj})
    elif request.method == 'POST':
        nid = request.GET.get('idcard')
        name = request.POST.get('name')
        gender = request.POST.get('sex')
        birthday = request.POST.get('birthday')
        # 需要修改日期的格式
        a = birthday.replace('年', '-')
        birthday = a.replace('月', '-')
        e = len(birthday)
        birthday = birthday[0:e - 1]
        address = request.POST.get('address')
        tele = request.POST.get('phone')
        oid = request.POST.get('oid')
        print(birthday)
        print(nid)
        obj = Guardian.objects.filter(idcard=nid).first()
        print(obj)
        Guardian.objects.filter(idcard=nid).update(name=name,gender=gender,birthday=birthday,address=address,tele=tele,oid=oid)
        me = request.session.get('user1')
        print(me)
        list = Viewocg.objects.filter(cid=me)
        return render(request, 'procedure.html', {"list": list,'script':'alert','alert':'修改成功！'})


def edit2(request):
    if request.method == 'GET':
        nid = request.GET.get('idcard')
        print(nid)
        obj = Old.objects.filter(id=nid).first()
        print(obj.birthday)
        return render(request, 'edit2.html', {'list': obj})
    elif request.method == 'POST':
        nid = request.GET.get('idcard')
        name = request.POST.get('name')
        gender = request.POST.get('gender')
        birthday = request.POST.get('birthday')
        # head = request.POST.get('head')
        # print(head)
        #需要修改日期的格式
        a=birthday.replace('年','-')
        birthday=a.replace('月','-')
        e=len(birthday)
        birthday = birthday[0:e-1]
        print(a)
        print(birthday)
        dorm = request.POST.get('dorm')
        bankcard = request.POST.get('bankcard')
        print(birthday+'*(890')
        print(nid)
        obj = Old.objects.filter(idcard=nid).first()
        print(obj)
        Old.objects.filter(idcard=nid).update(name=name,gender=gender,birthday=birthday,dorm=dorm,bankcard=bankcard)
        me = request.session.get('user1')
        print(me)
        list = Old.objects.filter(carer=me)
        return render(request, 'index.html',{'script':'alert','alert':'修改成功','list':list})


def procedure(request):
    if request.method == 'GET':
        me=request.session.get('user1')
        print(me)
        list=Viewocg.objects.filter(cid=me)
        return render(request,'procedure.html',{"list":list})
    elif request.method == 'POST':
        search = request.POST.get('search')
        print(search)
        list = Viewocg.objects.filter(oldname=search)
        return render(request,'procedure.html',{"list":list})


def chart(request):
    import time
    today=time.strftime('%Y-%m-%d', time.localtime(time.time()))
    print(today)
    if request.method == 'GET':
        nid = request.GET.get('oid')
        # instance = Old.objects.get(id=nid)
        print("#$")
        print(nid)
        obj = Dailycheck.objects.filter(oid=nid).order_by("time")
        # for i in obj:
        #     print(i)
        return render(request, 'chart.html', {"list": obj,'time':today})
    elif request.method == 'POST':
        # nid = request.GET.get('oid')
        # print(nid)
        # print("*")
        # print(nid)
        time = request.POST.get('time')
        temperature = request.POST.get('temperature')
        highbp = request.POST.get('highbp')
        lowbp = request.POST.get('lowbp')
        weight = request.POST.get('weight')
        pulse = request.POST.get('pulse')
        nid = request.POST.get('id')
        instance = Old.objects.get(id=nid)
        print(time)
        print(nid)
        Dailycheck.objects.create(oid=instance, time=time, temperature=temperature,
                    highbp=highbp,lowbp=lowbp,weight=weight,pulse=pulse)

        return redirect(("/chart.html/?oid=%s")%(nid))


def calendar(request):
    if request.method == 'GET':
        list = Viewactivity.objects.all()
        print(list[0].title)
        for i in list:
            i.day=str(i.day)
            i.time1 = str(i.time1)
            i.time2 = str(i.time2)
            i.day = i.day.split('-')
            print(i.day)
            i.time2=i.time2.split(':')
            i.time1 = i.time1.split(':')
            print(i.time2,i.time1)
        return render(request, 'calendar.html',{'list':list})
    elif request.method == 'POST':
        title = request.POST.get('title')
        id = request.POST.get('id')
        content = request.POST.get('content')
        note = request.POST.get('note')
        day = int(request.POST.get('day'))
        Activity.objects.create(id=id,name=title,content=content,note=note,day=day)
        return redirect("/calendar.html")


def orderdone(request):
    import pymysql
    conn = pymysql.connect(host='127.0.0.1', user='root', password='123456', database='dbdb', charset='utf8')
    cur = conn.cursor()
    cur.callproc('g')
    conn.commit()
    result = cur.fetchall()
    print(len(result))
    for i in result:
        print(i)
    # 计算每有几种类型的商品
    placetypenum = int(len(result) / 5)
    placetype = []
    whole = []  # 存入整个场地统计信息
    for i in range(placetypenum):
        print(i)
        alist = []
        alist.append(result[i][0])
        for j in range(i, len(result), placetypenum):
            alist.append(result[j][1])
        placetype.append(result[i][0])
        whole.append(alist)
    print(whole)
    print(placetype)
    if request.method == 'GET':
        orderid = request.GET.get('orderid')
        list = Order.objects.all()
        details = ViewOrderDetail.objects.filter(orderid=orderid)
        return render(request, 'orderdone.html', {"orders": list, "p": orderid, "details": details,'whole':whole})
    if request.method=='POST':
        orderid = request.POST.get('state')
        Order.objects.filter(id=orderid).update(status=1)
        list = Order.objects.all()
        return render(request, 'orderdone.html', {"orders": list, 'p': orderid,'whole':whole,'script':'alert','alert':'修改状态成功！'})
    list = Order.objects.all()
    return render(request, 'orderdone.html',{"orders":list})


def activitynum(request):
    list = Viewactnum.objects.all()#活动安排视图
    item = Activitynum.objects.all()#活动人员安排表
    myid=request.session.get('user1')
    notme = Viewactnum.objects.filter(~Q(cid=myid))#数据库查找不相等的值
    me= Viewactnum.objects.filter(cid=myid)#数据库查找相等的值
    if request.method == 'GET':
        return render(request, 'activitynum.html', {'me': me,'notme':notme})
    elif request.method == 'POST':
        task = request.POST.getlist('task')#这里做了简化，默认一个护工目前在安排人员中只有一条记录
        # print(task[0][0])
        woo = Activitynum.objects.filter(cid=myid)
        # woo.task = task[0][0]
        # woo.save()
        # print(woo)
        for k, i in enumerate(woo):
            # print(i)
            # print(k)
            # print(task[k])
            # print(i.task)
            i.task = task[k]
            i.save()
        # print(task)
        # Activitynum.objects.filter(cid=myid).update(task=task)
        return render(request, 'activitynum.html', {'me': me,'notme':notme})