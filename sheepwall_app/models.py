from django.db import models

# The users who access the wifi network
class WifiUser(models.Model):
    local_ip = models.GenericIPAddressField()
    wechat_id = models.CharField(max_length=40)
    wechat_head_img = models.FilePathField()
    os_type = models.CharField(max_length=10)
    phone_num = models.CharField(max_length=15)

# Record the online users' app behavior log
class AppBehaviorLog(models.Model):
    user = models.ForeignKey(WifiUser, on_delete=models.CASCADE)
    from_ip = models.GenericIPAddressField()
    app_name = models.CharField(max_length=30)
    app_action = models.CharField(max_length=20)
    target_url = models.URLField()
    access_date = models.DateField(auto_now=True)
    access_time = models.TimeField()
    class Meta:
        get_latest_by = 'access_time'