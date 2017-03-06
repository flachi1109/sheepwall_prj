# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sheepwall_app', '0005_auto_20170306_0721'),
    ]

    operations = [
        migrations.AddField(
            model_name='wifiuser',
            name='mac_addr',
            field=models.CharField(default=0, max_length=20),
            preserve_default=False,
        ),
    ]
