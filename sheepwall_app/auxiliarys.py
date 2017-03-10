# -*- coding:utf-8 -*-
import SocketServer
import re
from sheepwall_app.models import AppBehaviorLog

BEHAVIOR_CONTENT_DES = {'Version':'软件版本', 'Client':'操作系统', 'Account':'账号', 'Keyword':'关键字',\
                       'Content':'关键字', 'Sender_addr':'发件人', 'Receiver_addr':'收件人', 'Subject':'邮件主题',\
                       'Body':'邮件正文', 'FileName':'文件名', 'FileSize':'文件大小'}
BEHAVIOR_TYPE_DES = {'Login':'登录', 'SendText':'发消息', 'SendVideo':'发送视频', 'Audio':'语音', 'FileTransfer':'传文件',\
                    'SendPicture':'发送图片', 'Shake':'摇一摇', 'LBSFind':'附近的人', 'Bottle':'漂流瓶', \
                    'FriendCircle':'朋友圈', 'UploadFile':'上传文件', 'UploadAudio':'上传语音', 'Browser':'浏览',\
                    'Search':'搜索', 'Comment':'评论', 'Repost':'转发', 'SendMail':'发邮件', 'ReceiveMail':'收邮件',\
                    'Logout':'退出登录', 'Operation':'操作', 'Download':'下载', 'Refresh':'刷新', 'Pay':'支付',\
                    'ReceiveVideo':'接收视频', 'ReceivePicture':'接收图片', 'ReceiveFile':'接收文件', 'Post':'发帖', \
                    'Report':'发布', 'ReceiveText':'收消息', 'DownloadFile':'下载文件', 'QunText':'群消息',\
                    'OnlinePlay':'在线播放', 'Voip':'即时通话'}                      

class SyslogHandler(SocketServer.BaseRequestHandler):
    '''
    Extract key field from syslog message and store in AppBehavior database
    '''

    def make_syslog_dict(self, syslog_msg):
        try:
            res = re.search(r'(?P<syslog_type>.*)(?P<behavior>Protocol\(1001\).*)', syslog_msg)
            syslog_type_msg = res.group('syslog_type')

            if syslog_type_msg.find('AUDIT') > -1:  # Find whether there is keyword 'AUDIT' in the syslog

                behavior_log_dict = {}
                behavior_log_dict['access_time'] = syslog_type_msg.split(' ')[3]  # Save access_time to the dict

                pattern = re.compile(r'SrcIPAddr\(1003\)=(?P<from_ip>[0-9|\.]+);.+Application\(1002\)=(?P<app_name>\w+);'
                                     r'Behavior\(1101\)=(?P<app_action>\w+);BehaviorContent\(1102\)={(Sender_addr\(1106\)'
                                     r'=(?P<mail_from>.*?))?(,Receiver_addr\(1107\)=(?P<mail_to>.*?))?(,Subject\(1108\)'
                                     r'=(?P<mail_subject>.*?))?(,Body\(1109\)=(?P<mail_body>.*?))?(Keyword\(1095\)=(?P<app_keyword>.*?))?(Account\(1103\)=(?P<app_account>.*?))'
                                     r'?(,Content\(1104\)=(?P<app_content>.*?))?(,FileName\(1097\)=(?P<trans_filename>.*?))?'
                                     r'(,FileSize\(1105\)=(?P<trans_filesize>.*?))?}.*;Client\(1110\)=(?P<os_type>\w*?)'
                                     r';SoftVersion\(1111\)=(?P<app_version>.*?);Action\(1053\)')
                behavior_log = pattern.search(res.group('behavior'))

                behavior_log_dict['from_ip'] = behavior_log.group('from_ip')
                behavior_log_dict['app_name'] = behavior_log.group('app_name')
                behavior_log_dict['app_action'] = behavior_log.group('app_action')
                behavior_log_dict['mail_from'] = behavior_log.group('mail_from')
                behavior_log_dict['mail_to'] = behavior_log.group('mail_to')
                behavior_log_dict['mail_subject'] = behavior_log.group('mail_subject')
                behavior_log_dict['mail_body'] = behavior_log.group('mail_body')
                behavior_log_dict['app_account'] = behavior_log.group('app_account')
                behavior_log_dict['app_content'] = behavior_log.group('app_content')
                behavior_log_dict['trans_filename'] = behavior_log.group('trans_filename')
                behavior_log_dict['trans_filesize'] = behavior_log.group('trans_filesize')
                behavior_log_dict['app_keyword'] = behavior_log.group('app_keyword')
                behavior_log_dict['os_type'] = behavior_log.group('os_type')
                behavior_log_dict['app_version'] = behavior_log.group('app_version')

                return behavior_log_dict
            else:
                return False
        except Exception, e:
            print e.message
            return False

    def handle(self):
        syslog_msg = self.request[0].strip()
        behavior_log_dict = self.make_syslog_dict(syslog_msg)
        if behavior_log_dict:
            behavior_item = AppBehaviorLog()
            for key,value in behavior_log_dict.iteritems():
                exec_str = 'behavior_item.%s=\'%s\'' % (key, value)
                exec(exec_str)
            behavior_item.save()
            print 'Yes,saved'


def start_syslog_server(host, port):
    syslog_server = SocketServer.UDPServer((host, port), SyslogHandler)
    syslog_server.serve_forever()

if __name__ == '__main__':
    host, port = "localhost", 9999
    start_syslog_server(host, port)