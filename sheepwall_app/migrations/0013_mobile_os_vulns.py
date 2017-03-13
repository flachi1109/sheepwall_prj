# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sheepwall_app', '0012_auto_20170310_0720'),
    ]

    operations = [
        migrations.CreateModel(
            name='mobile_os_vulns',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('os_type', models.CharField(max_length=10, null=True)),
                ('version_num', models.CharField(max_length=10, null=True)),
                ('vulns_detail', models.CharField(max_length=60, null=True)),
            ],
        ),
    ]
