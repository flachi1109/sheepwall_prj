# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sheepwall_app', '0006_wifiuser_mac_addr'),
    ]

    operations = [
        migrations.AlterField(
            model_name='appbehaviorlog',
            name='access_time',
            field=models.CharField(max_length=15),
        ),
    ]
