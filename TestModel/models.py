# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Activity(models.Model):
    id = models.CharField(primary_key=True, max_length=20)
    name = models.CharField(max_length=20, blank=True, null=True)
    type = models.CharField(max_length=20, blank=True, null=True)
    note = models.CharField(max_length=255, blank=True, null=True)
    capacity = models.IntegerField(blank=True, null=True)
    content = models.CharField(max_length=255, blank=True, null=True)
    day = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'activity'


class Activitynum(models.Model):
    aid = models.ForeignKey('Arrangeact', models.DO_NOTHING, db_column='aid')
    cid = models.ForeignKey('Carer', models.DO_NOTHING, db_column='cid')
    task = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'activitynum'
#
# class Activitynum(models.Model):
#     aid = models.OneToOneField('Arrangeact', models.DO_NOTHING, db_column='aid', primary_key=True)    #
#     cid = models.ForeignKey('Carer', models.DO_NOTHING, db_column='cid')
#     task = models.CharField(max_length=255, blank=True, null=True)
#
#     class Meta:
#         managed = False
#         db_table = 'activitynum'
#         unique_together = (('aid', 'cid'),)


class Arrangeact(models.Model):
    number = models.IntegerField(blank=True, null=True)
    day = models.DateField(blank=True, null=True)
    time1 = models.TimeField(blank=True, null=True)
    time2 = models.TimeField(blank=True, null=True)
    site = models.ForeignKey('Place', models.DO_NOTHING, db_column='site', blank=True, null=True)
    activity = models.ForeignKey(Activity, models.DO_NOTHING, db_column='activity', blank=True, null=True)
    participants = models.PositiveIntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'arrangeact'


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Carer(models.Model):
    cid = models.CharField(primary_key=True, max_length=20)
    idcard = models.CharField(max_length=20)
    name = models.CharField(max_length=20)
    gender = models.CharField(max_length = 2, choices = (('M',' 男'), ('F', '女')))
    birthday = models.DateField(blank=True, null=True)
    address = models.CharField(max_length=255, blank=True, null=True)
    tele = models.CharField(max_length=20, blank=True, null=True)
    password = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'carer'


class Dailycheck(models.Model):
    oid = models.ForeignKey('Old', models.DO_NOTHING, db_column='oid', blank=True, null=True)
    time = models.DateField(blank=True, null=True)
    temperature = models.DecimalField(max_digits=5, decimal_places=0, blank=True, null=True)
    pulse = models.DecimalField(max_digits=5, decimal_places=0, blank=True, null=True)
    weight = models.FloatField(blank=True, null=True)
    highbp = models.DecimalField(max_digits=5, decimal_places=0, blank=True, null=True)
    lowbp = models.DecimalField(max_digits=5, decimal_places=0, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'dailycheck'



class Diagnoses(models.Model):
    id = models.CharField(primary_key=True, max_length=20)
    oid = models.ForeignKey('Old', models.DO_NOTHING, db_column='oid', blank=True, null=True)
    disease = models.CharField(max_length=255, blank=True, null=True)
    drugs = models.CharField(max_length=255, blank=True, null=True)
    time = models.CharField(max_length=255, blank=True, null=True)
    notes = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'diagnoses'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class GoSd(models.Model):
    id = models.CharField(primary_key=True, max_length=20)
    oid = models.ForeignKey('Old', models.DO_NOTHING, db_column='oid', blank=True, null=True)
    time = models.DateTimeField(blank=True, null=True)
    hospital = models.CharField(max_length=20, blank=True, null=True)
    reason = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'go_sd'


class Goods(models.Model):
    id = models.CharField(primary_key=True, max_length=20)
    name = models.CharField(max_length=20)
    price = models.DecimalField(max_digits=10, decimal_places=0, blank=True, null=True)
    type = models.CharField(max_length=20, blank=True, null=True)
    details = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'goods'


class Guardian(models.Model):
    idcard = models.CharField(primary_key=True, max_length=20)
    name = models.CharField(max_length=20)
    gender = models.CharField(max_length = 2, choices = (('M',' 男'), ('F', '女')))
    birthday = models.DateField(blank=True, null=True)
    address = models.CharField(max_length=255, blank=True, null=True)
    tele = models.CharField(max_length=20, blank=True, null=True)
    oid = models.ForeignKey('Old', models.DO_NOTHING, db_column='oid', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'guardian'


# class Oc(models.Model):
#     oid = models.OneToOneField('Old', models.DO_NOTHING, db_column='oid', primary_key=True)
#     cid = models.ForeignKey(Carer, models.DO_NOTHING, db_column='cid')
#     salary = models.DecimalField(max_digits=10, decimal_places=0, blank=True, null=True)
#     time = models.CharField(max_length=20, blank=True, null=True)
#
#     class Meta:
#         managed = False
#         db_table = 'oc'
#         unique_together = (('oid', 'cid'),)


class Old(models.Model):
    id = models.CharField(primary_key=True, max_length=20)
    password = models.CharField(max_length=255, blank=True, null=True)
    idcard = models.CharField(max_length=20)
    name = models.CharField(max_length=20)
    gender = models.CharField(max_length = 2, choices = (('M',' 男'), ('F', '女')))
    birthday = models.DateField(blank=True, null=True)
    bankcard = models.CharField(max_length=50, blank=True, null=True)
    carer = models.ForeignKey(Carer, models.DO_NOTHING, db_column='carer', blank=True, null=True)
    head = models.CharField(max_length=255, blank=True, null=True)
    dorm = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'old'


class Note(models.Model):
    me = models.ForeignKey('Old', models.DO_NOTHING, db_column='me', related_name='note_me')
    other = models.ForeignKey('Old', models.DO_NOTHING, db_column='other', related_name='note_other')
    note = models.CharField(max_length=255, blank=True, null=True)
    time = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'note'


class Order(models.Model):
    id = models.CharField(primary_key=True, max_length=20)
    oid = models.ForeignKey(Old, models.CASCADE, db_column='oid', blank=True, null=True)
    time = models.DateTimeField(blank=True, null=True)
    totalprice = models.DecimalField(max_digits=20, decimal_places=0, blank=True, null=True)
    location = models.CharField(max_length=255, blank=True, null=True)
    status = models.CharField(max_length=2, blank=True, null=True, choices = (('0','未送达'),('1', '已送达')))

    class Meta:
        managed = False
        db_table = 'order'


class Orderdetails(models.Model):
    goodsid = models.CharField(primary_key=True, max_length=20)
    orderid = models.CharField(max_length=20)
    num = models.IntegerField(blank=True, null=True)
    price = models.DecimalField(max_digits=20, decimal_places=0, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'orderdetails'
        unique_together = (('goodsid', 'orderid'),)


class TestmodelTest(models.Model):
    name = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'testmodel_test'


class ToDo(models.Model):
    oid = models.CharField(primary_key=True, max_length=20)
    time = models.DateTimeField(blank=True, null=True)
    todo = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'to_do'


# class Cart(models.Model):
#     C_user = models.ForeignKey(Old, on_delete=models.CASCADE)
#     C_goods = models.ForeignKey(Goods, on_delete=models.CASCADE)
#
#     C_goods_num = models.IntegerField(default=1)
#     C_is_select = models.BooleanField(default=True)
#
#     class Meta:
#         db_table = 'axf_cart'


# class Call(models.Model):
#     old = models.CharField(max_length=20)
#     carer = models.CharField(max_length=20, blank=True, null=True)
#     time = models.DateTimeField(blank=True, null=True)
#     location = models.CharField(max_length=20)
#     note = models.CharField(max_length=20, blank=True, null=True)
#     status = models.IntegerField(blank=True, null=True)
#
#     class Meta:
#         managed = False
#         db_table = 'call'
        

class Call(models.Model):
    id = models.IntegerField(blank=True, primary_key=True)
    old = models.ForeignKey('Old', models.CASCADE, db_column='old')
    carer = models.CharField(max_length=20, blank=True, null=True)
    time = models.DateTimeField(blank=True, null=True)
    location = models.CharField(max_length=20)
    note = models.CharField(max_length=20, blank=True, null=True)
    status = models.CharField(max_length=2, blank=True, null=True, choices = (('0','未回应'),('1', '已回应')))

    class Meta:
        managed = False
        db_table = 'call'


class Schedule(models.Model):
    oid = models.ForeignKey('Old', models.CASCADE, db_column='oid')
    actid = models.ForeignKey(Arrangeact, models.DO_NOTHING, db_column='actid')

    class Meta:
        managed = False
        db_table = 'schedule'


class Place(models.Model):
    id = models.CharField(primary_key=True, max_length=255)
    type = models.CharField(max_length=255, blank=True, null=True)
    capacity = models.IntegerField(blank=True, null=True)
    location = models.CharField(max_length=255, blank=True, null=True)
    image = models.CharField(max_length=255, blank=True, null=True)
    name = models.CharField(max_length=255, blank=True, null=True)
    state = models.CharField(max_length=2, blank=True, null=True, choices = (('0','空闲'),('1', '维护中')))

    class Meta:
        managed = False
        db_table = 'place'