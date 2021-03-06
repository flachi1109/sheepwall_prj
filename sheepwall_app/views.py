# -*- coding:utf-8 -*-

from django.shortcuts import render
from django.core.exceptions import ObjectDoesNotExist
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
import os

from models import *

# Create your views here.

def comp_wifiuser_num(web_shown_num):
    '''
    This is function compare the current wifi users' number in the database and foreground

    :param web_shown_num: the number of wifi users present on the foreground
    :return:  if the number of users storged in the database has more quantity return True.
    '''
    return True if WifiUser.objects.count()>web_shown_num else False

def resp_wifiuser_num():

    result = "{'wifiuser_num':%s}" % WifiUser.objects.count()
    return HttpResponse(result, content_type='application/json')

def update_wifiuser_ostype(latest_app_log):
    wifi_user = WifiUser.objects.get(local_ip=latest_app_log.src_ip_addr)
    if wifi_user.os_type == '' and latest_app_log.client != '':
        wifi_user.os_type = latest_app_log.client
        wifi_user.save()

def get_alluser_lastest_log():
    '''
    Get all the online users and their latest behavior log

    :param requet: HttpRequest Object
    :return: A dictionary containing the user info and corresponding log
    '''
    all_user_set = WifiUser.objects.all()
    result_set = {}
    for wifi_user in all_user_set:
        try:
            latest_app_log = AppBehaviorLog.objects.filter(src_ip_addr=wifi_user.local_ip).order_by('-access_date', '-access_time')[0]
            result_set[wifi_user] = latest_app_log
            update_wifiuser_ostype(latest_app_log)

        except (ObjectDoesNotExist, IndexError):
            result_set[wifi_user] = ''
    result_set = sorted(result_set.items(), key=lambda wifi_user:wifi_user[0].id, reverse=True)
    return result_set

def render_index(request):
    '''
    Return index.html page. It's the page 1 of the sheepwall
    :param request:
    :return:
    '''
    sheep_users = get_alluser_lastest_log()
    return render(request, 'index.html', {'sheep_users':sheep_users})

def render_wifiuser_table(request):
    sheep_users = get_alluser_lastest_log()
    return render(request, 'wifiuser_table.html', {'sheep_users': sheep_users})

def render_vulner_table(request):
    sheep_users = WifiUser.objects.all()
    return render(request, 'datatables.html', {'sheep_users': sheep_users})

def get_latest5_behavior(wifiuser_id):
    '''
    Get the users' last five logs;

    :param wifiuser_id: wechat user's id
    :return: The first five entries in the app behavior log. It is a List.
    '''
    wifiuser_item = WifiUser.objects.get(id=wifiuser_id)
    wechat_to_ip = wifiuser_item.local_ip

    latest_behavior = []
    latest_behavior_qs = AppBehaviorLog.objects.filter(src_ip_addr=wechat_to_ip).order_by('-access_date','-access_time')[0:4]
    for behavior_qs_item in latest_behavior_qs:
        behavior_with_value = {}
        behavior_with_value['行为'] = behavior_qs_item.behavior
        if behavior_qs_item.account and behavior_qs_item.account != 'None':
            behavior_with_value['帐号'] = behavior_qs_item.account
        if behavior_qs_item.content and behavior_qs_item.content != 'None':
            behavior_with_value['内容'] = behavior_qs_item.content
        if behavior_qs_item.keyword and behavior_qs_item.keyword != 'None':
            behavior_with_value['关键字'] = behavior_qs_item.keyword
        if behavior_qs_item.sender_addr and behavior_qs_item.sender_addr != 'None':
            behavior_with_value['发件人'] = behavior_qs_item.sender_addr
        if behavior_qs_item.receiver_addr and behavior_qs_item.receiver_addr != 'None':
            behavior_with_value['收件人'] = behavior_qs_item.receiver_addr
        if behavior_qs_item.subject and behavior_qs_item.subject != 'None':
            behavior_with_value['邮件主题'] = behavior_qs_item.subject
        if behavior_qs_item.body and behavior_qs_item.body != 'None':
            behavior_with_value['邮件正文'] = behavior_qs_item.body
        if behavior_qs_item.filename and behavior_qs_item.filename != 'None':
            behavior_with_value['文件名称'] = behavior_qs_item.filename
        if behavior_qs_item.filesize and behavior_qs_item.filesize != 'None':
            behavior_with_value['文件大小'] = behavior_qs_item.filesize
        if behavior_qs_item.softversion and behavior_qs_item.softversion != 'None':
            behavior_with_value['软件版本'] = behavior_qs_item.softversion 
        if behavior_qs_item.target_url and behavior_qs_item.target_url != 'None':
            behavior_with_value['目标网站'] = behavior_qs_item.target_url
        if behavior_qs_item.client and behavior_qs_item.client != 'None':
            behavior_with_value['客户端'] = behavior_qs_item.client
        
        latest_behavior.append((behavior_qs_item,behavior_with_value))

    return latest_behavior

def get_newest_sniff_pic(user_ip):
    img_path = '/home/ubuntu/sheepwall_prj/static/assets/images/wifiuserimgs/%s/' % user_ip
    try:
        sniff_imgs=os.listdir(img_path)
        sort_result = sniff_imgs.sort(key=lambda fn: os.path.getctime(img_path+"/"+fn) if not os.path.isdir(img_path+"/"+fn) else 0)
        sniff_imgs_sorted = sniff_imgs[-3:]
    except OSError, e:
        sniff_imgs_sorted = ['../../backgrounds/33333.jpg','../../backgrounds/33333.jpg','../../backgrounds/33333.jpg']

    return sniff_imgs_sorted
    
@csrf_exempt
def render_popup(request):
    '''
    Return popup-page.html page. It's the popup page for showing the latest five logs of some user.
    :param request:
    :return:
    '''
    next_userid = request.POST.get('next_userid', '')
    current_newuser_id = request.POST.get('current_newuser_id', '')
    
    if current_newuser_id and current_newuser_id!='NaN':
        current_newuser_id = int(current_newuser_id)
        if current_newuser_id < WifiUser.objects.last().id:
            latest5_behavior = get_latest5_behavior(WifiUser.objects.last().id)
            current_user = WifiUser.objects.get(id=WifiUser.objects.last().id)
            newest_sniff_imgs = get_newest_sniff_pic(current_user.local_ip)
            newest_user_id = WifiUser.objects.last().id
        else:
            if next_userid and next_userid!='NaN':
                next_userid = int(next_userid)
                if next_userid < 1:
                    next_userid = WifiUser.objects.last().id
            else:
                next_userid = WifiUser.objects.last().id
            while next_userid > 0:
                try:
                    latest5_behavior = get_latest5_behavior(next_userid)
                    current_user = WifiUser.objects.get(id=next_userid)
                    newest_sniff_imgs = get_newest_sniff_pic(current_user.local_ip)
                    break
                except ObjectDoesNotExist:
                    next_userid -= 1
            
            newest_user_id = current_newuser_id    
        
    else:
    
        if next_userid and next_userid!='NaN':
            next_userid = int(next_userid)
            if next_userid < 1:
                next_userid = WifiUser.objects.last().id
        else:
            next_userid = WifiUser.objects.last().id
        while next_userid > 0:
            try:
                latest5_behavior = get_latest5_behavior(next_userid)
                current_user = WifiUser.objects.get(id=next_userid)
                newest_sniff_imgs = get_newest_sniff_pic(current_user.local_ip)
                break
            except ObjectDoesNotExist:
                next_userid -= 1
        
        newest_user_id = current_newuser_id
        
    return render(request, 'popup-page.html', {'current_user':current_user, 'latest5_behavior':latest5_behavior, 'newest_sniff_imgs':newest_sniff_imgs, 'newest_user_id':newest_user_id})
