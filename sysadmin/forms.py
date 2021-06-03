from django.forms import ModelForm
from TestModel.models import *

class OldInfoForm(ModelForm):
    class Meta:
        model = Old
        fields = '__all__'
        labels = {
            'id': '老人编号',
            'idcard':'身份证号',
            'name': '姓名',
            'gender': '性别',
            'birthday': '生日',
            'guardian1': '监护人1',
            'guardian2': '监护人2',
            'bankcard': '银行卡号',
            'password': '密码',
            'carer': '护工',
            'head':'头像文件',
            'dorm':'宿舍号',
        }


class GuardianInfoForm(ModelForm):
    class Meta:
        model = Guardian
        fields = '__all__'
        labels = {
            'idcard':'身份证号',
            'name': '姓名',
            'gender': '性别',
            'birthday': '生日',
            'address': '地址',
            'tele': '电话',
            'oid': '老人编号',
        }


class CarerInfoForm(ModelForm):
    class Meta:
        model = Carer
        fields = '__all__'
        labels = {
            'cid': '护工编号',
            'idcard':'身份证号',
            'name': '姓名',
            'gender': '性别',
            'birthday': '生日',
            'address': '地址',
            'tele': '电话',
            'password': '密码',
        }


class GoodsInfoForm(ModelForm):
    class Meta:
        model = Goods
        fields = '__all__'
        labels = {
            'id': '商品编号',
            'name': '商品名称',
            'price': '商品价格/元',
            'type': '商品类别',
            'details': '商品描述',
        }


class OrderInfoForm(ModelForm):
    class Meta:
        model = Order
        fields = '__all__'
        labels = {
            'id': '订单编号',
            'oid': '下单老人编号',
            'time': '下单时间',
            'totalprice': '商品类别',
            'location': '商品描述',
            'status': '订单状态',
        }


class CheckInfoForm(ModelForm):
    class Meta:
        model = Dailycheck
        fields = '__all__'
        labels = {
            'oid': '老人编号',
            'time': '检查时间',
            'temparature': '体温',
            'pulse': '心率',
            'weight': '体重',
            'highbp': '血压高压',
            'lowbp': '血压低压',
        }


class CheckInfoForm(ModelForm):
    class Meta:
        model = Dailycheck
        fields = '__all__'
        labels = {
            'oid': '老人编号',
            'time': '检查时间',
            'temparature': '体温',
            'pulse': '心率',
            'weight': '体重',
            'highbp': '血压高压',
            'lowbp': '血压低压',
        }


class CallInfoForm(ModelForm):
    class Meta:
        model = Call
        fields = '__all__'
        labels = {
            'old': '老人编号',
            'carer': '护工编号',
            'time': '呼叫时间',
            'location': '房间号',
            'note': '备注',
            'status': '处理状态',
        }


class ScheInfoForm(ModelForm):
    class Meta:
        model = Schedule
        fields = '__all__'
        labels = {
            'old': '老人编号',
            'acid': '活动编号',
        }

class ActivityInfoForm(ModelForm):
    class Meta:
        model = Activity
        fields = '__all__'
        labels = {
            'id': '活动编号',
            'name': '活动名称',
            'type': '活动类型',
            'note': '活动说明',
            'capacity': '容纳人数',
            'content': '活动内容',
            'day': '持续天数',
        }

class ActivityInfoForm(ModelForm):
    class Meta:
        model = Activity
        fields = '__all__'
        labels = {
            'id': '活动编号',
            'name': '活动名称',
            'type': '活动类型',
            'note': '活动说明',
            'capacity': '容纳人数',
            'content': '活动内容',
            'day': '持续天数',
        }


class PlaceInfoForm(ModelForm):
    class Meta:
        model = Place
        fields = '__all__'
        labels = {
            'id': '序号',
            'name': '活动室名称',
            'type': '活动室类型',
            'capacity': '容纳人数',
            'location': '地址',
            'image': '描述图片',
            'state': '使用状态',
        }


class ArrangeInfoForm(ModelForm):
    class Meta:
        model = Arrangeact
        fields = '__all__'
        labels = {
            'activity': '活动编号',
            'site': '活动室编号',
            'number': '报名人数',
            'day': '活动日期',
            'time1': '开始时间',
            'time2': '结束时间',
        }