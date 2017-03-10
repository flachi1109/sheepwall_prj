# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sheepwall_app', '0010_remove_appbehaviorlog_app_content'),
    ]

    operations = [
        migrations.RenameField(
            model_name='appbehaviorlog',
            old_name='app_account',
            new_name='account',
        ),
        migrations.RenameField(
            model_name='appbehaviorlog',
            old_name='app_name',
            new_name='application',
        ),
        migrations.RenameField(
            model_name='appbehaviorlog',
            old_name='app_action',
            new_name='behavior',
        ),
        migrations.RenameField(
            model_name='appbehaviorlog',
            old_name='mail_body',
            new_name='body',
        ),
        migrations.RenameField(
            model_name='appbehaviorlog',
            old_name='mail_subject',
            new_name='filename',
        ),
        migrations.RenameField(
            model_name='appbehaviorlog',
            old_name='trans_filename',
            new_name='filesize',
        ),
        migrations.RenameField(
            model_name='appbehaviorlog',
            old_name='app_keyword',
            new_name='keyword',
        ),
        migrations.RenameField(
            model_name='appbehaviorlog',
            old_name='mail_from',
            new_name='receiver_addr',
        ),
        migrations.RenameField(
            model_name='appbehaviorlog',
            old_name='mail_to',
            new_name='sender_addr',
        ),
        migrations.RenameField(
            model_name='appbehaviorlog',
            old_name='trans_filesize',
            new_name='softversion',
        ),
        migrations.RenameField(
            model_name='appbehaviorlog',
            old_name='from_ip',
            new_name='src_ip_addr',
        ),
        migrations.AddField(
            model_name='appbehaviorlog',
            name='content',
            field=models.CharField(max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='appbehaviorlog',
            name='subject',
            field=models.CharField(max_length=40, null=True),
        ),
    ]
