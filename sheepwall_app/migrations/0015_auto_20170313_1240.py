# -*- coding: utf-8 -*-
# Generated by Django 1.10.6 on 2017-03-13 12:40
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('sheepwall_app', '0014_auto_20170313_1237'),
    ]

    operations = [
        migrations.CreateModel(
            name='WechatToLocalIP',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('local_ip', models.GenericIPAddressField()),
            ],
        ),
        migrations.RemoveField(
            model_name='wifiuser',
            name='local_ip',
        ),
        migrations.AddField(
            model_name='wechattolocalip',
            name='wifi_user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='sheepwall_app.WifiUser'),
        ),
    ]
