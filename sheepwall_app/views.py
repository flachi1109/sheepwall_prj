from django.shortcuts import render
from django.core.exceptions import ObjectDoesNotExist

from models import *

# Create your views here.

def comp_wifiuser_num(web_shown_num):
    '''
    This is function compare the current wifi users' number in the database and foreground

    :param web_shown_num: the number of wifi users present on the foreground
    :return:  if the number of users storged in the database has more quantity return True.
    '''
    return True if WifiUser.objects.count()>web_shown_num else False

def get_alluser_lastest_log(requet):
    '''
    Get all the online users and their latest behavior log

    :param requet: HttpRequest Object
    :return: A dictionary containing the user info and corresponding log
    '''
    all_user_set = WifiUser.objects.all()
    result_set = {}
    for wifi_user in all_user_set:

        result_list = []
        wechat_to_ip = wifi_user.wechattolocalip_set.get()
        result_list.append(wechat_to_ip)
        try:
            result_list.append(AppBehaviorLog.objects.filter(from_ip=wechat_to_ip.local_ip).latest())
        except ObjectDoesNotExist:
            result_list.append('')
        result_set[wifi_user] = result_list

    return render(requet, 'testurl.html', {'result_set':result_set})

def get_latest5_action(wifiuser_id):
    '''
     Get the users' last five logs;

    :param wifiuser_id: wechat user's id
    :return: The first five entries in the app behavior log. It is a QuerySet.
    '''
    wifiuser_item = WifiUser.objects.get(id=wifiuser_id)
    wechat_to_ip = wifiuser_item.wechattolocalip_set.get().local_ip

    return AppBehaviorLog.object.get(from_ip=wechat_to_ip).order_by('-access_time')[0:5]