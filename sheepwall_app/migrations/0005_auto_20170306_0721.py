# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sheepwall_app', '0004_auto_20170305_1324'),
    ]

    operations = [
        migrations.CreateModel(
            name='WechatToLocalIP',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('local_ip', models.GenericIPAddressField()),
            ],
        ),
        migrations.RenameField(
            model_name='wifiuser',
            old_name='wechat_id',
            new_name='wechat_nickname',
        ),
        migrations.RemoveField(
            model_name='appbehaviorlog',
            name='user',
        ),
        migrations.RemoveField(
            model_name='wifiuser',
            name='local_ip',
        ),
        migrations.AddField(
            model_name='wechattolocalip',
            name='wifi_user',
            field=models.ForeignKey(to='sheepwall_app.WifiUser'),
        ),
    ]
