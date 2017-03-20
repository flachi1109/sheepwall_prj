from django.db import models

# The wechat users who access the wifi network
class WifiUser(models.Model):
    wechat_nickname = models.CharField(max_length=40, null=True)
    wechat_head_img = models.CharField(max_length=200, null=True)
    local_ip = models.GenericIPAddressField()
    mac_addr = models.CharField(max_length=20, null=True)
    os_type = models.CharField(max_length=10, null=True)


# Record the online users' app behavior log
class AppBehaviorLog(models.Model):
    src_ip_addr = models.GenericIPAddressField( )
    application = models.CharField(max_length=30, null=True)
    behavior = models.CharField(max_length=20, null=True)
    account = models.CharField(max_length=20, null=True)
    content = models.CharField(max_length=50, null=True)
    keyword = models.CharField(max_length=25, null=True)
    sender_addr = models.CharField(max_length=20, null=True)
    receiver_addr = models.CharField(max_length=20, null=True)
    subject = models.CharField(max_length=40, null=True)
    body = models.CharField(max_length=60, null=True)
    filename = models.CharField(max_length=40, null=True)
    filesize = models.CharField(max_length=40, null=True)
    client = models.CharField(max_length=10, null=True)
    softversion = models.CharField(max_length=40, null=True)
    target_url = models.URLField()
    access_date = models.DateField(auto_now=True)
    access_time = models.CharField(max_length=15, null=True)
    class Meta:
        get_latest_by = 'access_time'

    #mobile os vulnerability
    class mobile_os_vulns(models.Model):
        os_type = models.CharField(max_length=10, null=True)
        version_num = models.CharField(max_length=10, null=True)
        vulns_detail = models.CharField(max_length=60, null=True)
