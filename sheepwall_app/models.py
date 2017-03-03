from django.db import models

# The users who access the wifi network
class WifiUser(models.Model):
    local_ip = models.IPAddressField()
    wechat_id = models.CharField(max_length=40)
    wechat_head_img = models.FilePathField()
    os_type = models.CharField(max_length=10)
    phone_num = models.CharField(max_length=15)

# Record the online users' app behavior log
class AppBehaviorLog(models.Model):
    user_id = models.ForeignKey(WifiUser, on_delete=models.CASCADE)
    from_ip = models.IPAddressField()
    app_name = models.CharField(max_length=30)
    app_action = models.CharField(max_length=20)
    access_time = models.TimeField()

# Record the online users' web browsing behavior log
class WebBehaviorLog(models.Model):
    user_id = models.ForeignKey(WifiUser, on_delete=models.CASCADE)
    from_ip = models.IPAddressField()
    website_name = models.CharField(max_length=30)
    access_url = models.URLField(max_length=30)
    access_time = models.TimeField()
    sniff_img = models.FilePathField()