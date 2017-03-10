from django.db import models

# The wechat users who access the wifi network
class WifiUser(models.Model):
    wechat_nickname = models.CharField(max_length=40, null=True)
    wechat_head_img = models.FilePathField()
    mac_addr = models.CharField(max_length=20, null=True)
    os_type = models.CharField(max_length=10, null=True)
    phone_num = models.CharField(max_length=15, null=True)

class WechatToLocalIP(models.Model):
    local_ip = models.GenericIPAddressField()
    wifi_user = models.ForeignKey(WifiUser, on_delete=models.CASCADE)

# Record the online users' app behavior log
class AppBehaviorLog(models.Model):
    from_ip = models.GenericIPAddressField()
    app_name = models.CharField(max_length=30, null=True)
    app_action = models.CharField(max_length=20, null=True)
    app_account = models.CharField(max_length=20, null=True)
    app_content = models.CharField(max_length=50, null=True)
    app_keyword = models.CharField(max_length=25, null=True)
    mail_from = models.CharField(max_length=20, null=True)
    mail_to = models.CharField(max_length=20, null=True)
    mail_subject = models.CharField(max_length=40, null=True)
    mail_body = models.CharField(max_length=60, null=True)
    trans_filename = models.CharField(max_length=40, null=True)
    trans_filesize = models.CharField(max_length=40, null=True)
    app_version = models.CharField(max_length=40, null=True)
    target_url = models.URLField()
    access_date = models.DateField(auto_now=True)
    access_time = models.TimeField(auto_now=True)
    class Meta:
        get_latest_by = 'access_time'