from django.shortcuts import render
from django.core.exceptions import ObjectDoesNotExist

from models import *

BEHAVIOR_CONTENT_DES = {'Version':'软件版本', 'Client':'操作系统', 'Account':'账号', 'Keyword':'关键字',\
                       'Content':'内容', 'Sender_addr':'发件人', 'Receiver_addr':'收件人', 'Subject':'邮件主题',\
                       'Body':'邮件正文', 'FileName':'文件名', 'FileSize':'文件大小', 'Target_url':'访问站点'}
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
            result_list.append(AppBehaviorLog.objects.filter(src_ip_addr=wechat_to_ip.local_ip).latest())
        except ObjectDoesNotExist:
            result_list.append('')
        result_set[wifi_user] = result_list

    return render(requet, 'testurl.html', {'result_set':result_set})

def get_latest5_behavior(wifiuser_id):
    '''
    Get the users' last five logs;

    :param wifiuser_id: wechat user's id
    :return: The first five entries in the app behavior log. It is a List.
    '''
    wifiuser_item = WifiUser.objects.get(id=wifiuser_id)
    wechat_to_ip = wifiuser_item.wechattolocalip_set.get().local_ip

    latest_behavior = []
    latest_behavior_qs = AppBehaviorLog.object.get(src_ip_addr=wechat_to_ip).order_by('-access_time')[0:5]
    for behavior_qs_item in latest_behavior_qs:
        behavior_with_value = {}
        behavior_with_value['IP地址'] = behavior_qs_item.src_ip_addr
        behavior_with_value['应用名称'] = behavior_qs_item.application
        behavior_with_value['行为'] = behavior_qs_item.behavior
        behavior_with_value['访问时间'] = behavior_qs_item.access_time
        behavior_with_value['访问日期'] = behavior_qs_item.access_data
        if behavior_qs_item.account and behavior_qs_item.account is not 'None':
            behavior_with_value[BEHAVIOR_CONTENT_DES.Account] = behavior_qs_item.account
        if behavior_qs_item.content and behavior_qs_item.content is not 'None':
            behavior_with_value[BEHAVIOR_CONTENT_DES.Content] = behavior_qs_item.content
        if behavior_qs_item.keyword and behavior_qs_item.keyword is not 'None':
            behavior_with_value[BEHAVIOR_CONTENT_DES.Keyword] = behavior_qs_item.keyword
        if behavior_qs_item.sender_addr and behavior_qs_item.sender_addr is not 'None':
            behavior_with_value[BEHAVIOR_CONTENT_DES.Sender_addr] = behavior_qs_item.sender_addr
        if behavior_qs_item.receiver_addr and behavior_qs_item.receiver_addr is not 'None':
            behavior_with_value[BEHAVIOR_CONTENT_DES.Receiver_addr] = behavior_qs_item.receiver_addr
        if behavior_qs_item.subject and behavior_qs_item.subject is not 'None':
            behavior_with_value[BEHAVIOR_CONTENT_DES.Subject] = behavior_qs_item.subject
        if behavior_qs_item.body and behavior_qs_item.body is not 'None':
            behavior_with_value[BEHAVIOR_CONTENT_DES.Body] = behavior_qs_item.body
        if behavior_qs_item.filename and behavior_qs_item.filename is not 'None':
            behavior_with_value[BEHAVIOR_CONTENT_DES.FileName] = behavior_qs_item.filename
        if behavior_qs_item.filesize and behavior_qs_item.filesize is not 'None':
            behavior_with_value[BEHAVIOR_CONTENT_DES.FileSize] = behavior_qs_item.filesize
        if behavior_qs_item.softversion and behavior_qs_item.softversion is not 'None':
            behavior_with_value[BEHAVIOR_CONTENT_DES.Version] = behavior_qs_item.softversion 
        if behavior_qs_item.target_url and behavior_qs_item.target_url is not 'None':
            behavior_with_value[BEHAVIOR_CONTENT_DES.Target_url] = behavior_qs_item.target_url
        
        latest_behavior.append(behavior_with_value)        