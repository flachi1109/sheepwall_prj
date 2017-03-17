# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sheepwall_app', '0016_auto_20170313_1244'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='wifiuser',
            name='phone_num',
        ),
        migrations.AddField(
            model_name='appbehaviorlog',
            name='client',
            field=models.CharField(max_length=10, null=True),
        ),
    ]
