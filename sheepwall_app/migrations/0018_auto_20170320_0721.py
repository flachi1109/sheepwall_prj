# -*- coding: utf-8 -*-
# Generated by Django 1.10.6 on 2017-03-20 07:21
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sheepwall_app', '0017_auto_20170317_0154'),
    ]

    operations = [
        migrations.AlterField(
            model_name='wifiuser',
            name='wechat_head_img',
            field=models.CharField(max_length=100, null=True),
        ),
    ]
