# -*- coding:utf-8 -*-
from sheepwall_app.models import AppBehaviorLog
from sheepwall_app.models import WifiUser
from sheepwall_app.models import Mac_IP

Mac_IP.objects.all().delete()
AppBehaviorLog.objects.filter(id__gt=101).delete()
WifiUser.objects.filter(id__gt=20).delete()
print '[Init Environment]Init Database done.'