# -*- coding: utf-8 -*-
# Generated by Django 1.10.6 on 2017-03-08 13:42
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sheepwall_app', '0008_auto_20170305_1443'),
    ]

    operations = [
        migrations.AddField(
            model_name='appbehaviorlog',
            name='mail_body',
            field=models.CharField(max_length=60, null=True),
        ),
        migrations.AddField(
            model_name='appbehaviorlog',
            name='mail_subject',
            field=models.CharField(max_length=40, null=True),
        ),
        migrations.AddField(
            model_name='appbehaviorlog',
            name='trans_filesize',
            field=models.CharField(max_length=40, null=True),
        ),
    ]