# -*- coding:utf-8 -*-
import SocketServer
import re
from sheepwall_app.models import AppBehaviorLog

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
        '''
        Convert keyword in syslog to key in dictionary
        :param syslog_msg: syslog message got from upd packet
        :return: syslog keyword dictionary
        '''
        try:
            res = re.search(r'(?P<syslog_type>.*)(?P<behavior>Protocol\(1001\).*)', syslog_msg)
            syslog_type_msg = res.group('syslog_type')

            if syslog_type_msg.find('AUDIT') > -1:  # Find whether there is keyword 'AUDIT' in the syslog

                behavior_log_dict = {}
                behavior_log_dict['access_time'] = syslog_type_msg.split(' ')[3]  # Save access_time to the dict

                pattern = re.compile(r'SrcIPAddr\(1003\)=(?P<src_ip_addr>[0-9|\.]+);.+Application\(1002\)=(?P<application>\w+);'
                                     r'Behavior\(1101\)=(?P<behavior>\w+);BehaviorContent\(1102\)={(Sender_addr\(1106\)'
                                     r'=(?P<sender_addr>.*?))?(,Receiver_addr\(1107\)=(?P<receiver_addr>.*?))?(,Subject\(1108\)'
                                     r'=(?P<subject>.*?))?(,Body\(1109\)=(?P<body>.*?))?(Keyword\(1095\)=(?P<keyword>.*?))?(Account\(1103\)=(?P<account>.*?))'
                                     r'?(,Content\(1104\)=(?P<content>.*?))?(,FileName\(1097\)=(?P<filename>.*?))?'
                                     r'(,FileSize\(1105\)=(?P<filesize>.*?))?}.*;Client\(1110\)=(?P<client>\w*?)'
                                     r';SoftVersion\(1111\)=(?P<softversion>.*?);Action\(1053\)')
                behavior_log = pattern.search(res.group('behavior'))

                behavior_log_dict['src_ip_addr'] = behavior_log.group('src_ip_addr')
                behavior_log_dict['application'] = behavior_log.group('application')
                behavior_log_dict['behavior'] = BEHAVIOR_TYPE_DES[behavior_log.group('behavior')]
                behavior_log_dict['sender_addr'] = behavior_log.group('sender_addr')
                behavior_log_dict['receiver_addr'] = behavior_log.group('receiver_addr')
                behavior_log_dict['mail_subject'] = behavior_log.group('subject')
                behavior_log_dict['body'] = behavior_log.group('body')
                behavior_log_dict['account'] = behavior_log.group('account')
                behavior_log_dict['content'] = behavior_log.group('content')
                behavior_log_dict['filename'] = behavior_log.group('filename')
                behavior_log_dict['filesize'] = behavior_log.group('filesize')
                behavior_log_dict['keyword'] = behavior_log.group('keyword')
                behavior_log_dict['client'] = behavior_log.group('client')
                behavior_log_dict['softversion'] = behavior_log.group('softversion')

                return behavior_log_dict
            else:
                return False
        except Exception, e:
            print e.message
            return False

    def handle(self):
        '''
        Save syslog dictionary to database
        :return: no return
        '''
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