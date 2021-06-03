# Generated by Django 3.1.6 on 2021-03-11 07:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('TestModel', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='ViewOrderDetail',
            fields=[
                ('goodsid', models.CharField(max_length=20, primary_key=True, serialize=False)),
                ('orderid', models.CharField(max_length=20)),
                ('num', models.IntegerField(blank=True, null=True)),
                ('price', models.DecimalField(blank=True, decimal_places=0, max_digits=20, null=True)),
                ('name', models.CharField(max_length=20)),
            ],
            options={
                'db_table': 'view_orderdetail',
                'unique_together': {('goodsid', 'orderid')},
            },
        ),
    ]
