from django.db import models

# The wechat users who access the wifi network
class WifiUser(models.Model):
    wechat_nickname = models.CharField(max_length=40)
    wechat_head_img = models.FilePathField()
    mac_addr = models.CharField(max_length=20)
    os_type = models.CharField(max_length=10)
    phone_num = models.CharField(max_length=15)

class WechatToLocalIP(models.Model):
    local_ip = models.GenericIPAddressField()
    wifi_user = models.ForeignKey(WifiUser, on_delete=models.CASCADE)

# Record the online users' app behavior log
class AppBehaviorLog(models.Model):
    from_ip = models.GenericIPAddressField()
    app_name = models.CharField(max_length=30)
    app_action = models.CharField(max_length=20)
    app_account = models.CharField(max_length=20)
    app_content = models.CharField(max_length=50)
    app_keyword = models.CharField(max_length=25)
    mail_from = models.CharField(max_length=20)
    mail_to = models.CharField(max_length=20)
    trans_filename = models.CharField(max_length=40)
    target_url = models.URLField()
    access_date = models.DateField(auto_now=True)
    access_time = models.CharField(max_length=15)
    class Meta:
        get_latest_by = 'access_time'