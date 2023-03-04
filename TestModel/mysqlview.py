from .models import *


class ViewOrderDetail(models.Model):
    goodsid = models.CharField(primary_key=True, max_length=20)
    orderid = models.CharField(max_length=20)
    num = models.IntegerField(blank=True, null=True)
    price = models.DecimalField(max_digits=20, decimal_places=0, blank=True, null=True)
    name = models.CharField(max_length=20)
    type = models.CharField(max_length=20, blank=True, null=True)

    class Meta:
        db_table = 'view_orderdetail'
        unique_together = (('goodsid', 'orderid'),)


class ViewOldSchedule(models.Model):
    oid = models.CharField(max_length=20)
    actid = models.ForeignKey(Arrangeact, models.DO_NOTHING, primary_key=True, db_column='actid')
    number = models.IntegerField(blank=True, null=True)
    year = models.CharField(max_length=20)
    month = models.CharField(max_length=20, blank=True, null=True)
    day = models.CharField(max_length=20, blank=True, null=True)
    shour = models.CharField(max_length=20)
    smin = models.CharField(max_length=20)
    ehour = models.CharField(max_length=20)
    emin = models.CharField(max_length=20)
    site = models.ForeignKey('Place', models.DO_NOTHING, db_column='site', blank=True, null=True)
    activity = models.ForeignKey(Activity, models.DO_NOTHING, db_column='activity', blank=True, null=True)
    name = models.CharField(max_length=20, blank=True, null=True)
    type = models.CharField(max_length=20, blank=True, null=True)
    notes = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        db_table = 'view_oldschedule'
        unique_together = (('oid', 'actid'),)


class Viewactivity(models.Model):
    title = models.CharField(max_length=20, blank=True, null=True)
    content = models.CharField(max_length=255, blank=True, null=True)
    note = models.CharField(max_length=255, blank=True, null=True)
    day = models.DateField(blank=True, null=True)
    time1 = models.TimeField(blank=True, null=True)
    time2 = models.TimeField(blank=True, null=True)
    location = models.CharField(max_length=255, blank=True, null=True)
    name = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        db_table = 'viewactivity'


class Viewactnum(models.Model):
    id = models.IntegerField(blank=True, null=True)
    cid = models.ForeignKey('Carer', models.DO_NOTHING, db_column='cid',primary_key=True)
    task = models.CharField(max_length=255, blank=True, null=True)
    name = models.CharField(max_length=20)
    title = models.CharField(max_length=20, blank=True, null=True)
    day = models.DateField(blank=True, null=True)
    time1 = models.TimeField(blank=True, null=True)
    time2 = models.TimeField(blank=True, null=True)
    class Meta:
        db_table = 'viewactnum'

class Viewocg(models.Model):
    idcard = models.CharField(primary_key=True, max_length=20)
    name = models.CharField(max_length=20)
    gender = models.CharField(max_length=2, blank=True, null=True)
    birthday = models.DateField(blank=True, null=True)
    address = models.CharField(max_length=255, blank=True, null=True)
    tele = models.CharField(max_length=20, blank=True, null=True)
    oid = models.ForeignKey('Old', models.DO_NOTHING, db_column='oid', blank=True, null=True)
    oldname = models.CharField(max_length=20)
    cid = models.CharField( max_length=20)

    class Meta:
        db_table = 'viewocg'