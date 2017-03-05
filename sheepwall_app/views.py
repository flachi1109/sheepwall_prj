from django.shortcuts import render
from django.core.exceptions import ObjectDoesNotExist

from models import *

# Create your views here.

def comp_wifiuser_num(web_shown_num):
    '''
    This is function compare the current wifi users' number in the database and foreground

        @param web_shown_num: the number of wifi users present on the foreground
        @return:  if the number of users storged in the database has more quantity return True.
    '''
    return True if WifiUser.objects.count()>web_shown_num else False

def get_alluser_lastest_log(requet):
    all_user_set = WifiUser.objects.all()
    latest_log_set = []
    for wifi_user in all_user_set:
        try:
            latest_log_set.append(wifi_user.appbehaviorlog_set.all().latest())
        except ObjectDoesNotExist:
            pass

    return render(requet, 'testurl.html', {'all_user_set':all_user_set, 'latest_log_set':latest_log_set})

