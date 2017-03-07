# -*- coding:utf-8 -*-
import SocketServer
import re
from models import AppBehaviorLog

class SyslogHandler(SocketServer.BaseRequestHandler):
    '''
    Extract key field from syslog message and store in AppBehavior database
    '''
    def make_syslog_dict(self, syslog_msg):
        syslog_msg_list = syslog_msg.split('')
        if syslog_msg_list[6].find('AUDIT') > -1:  #Find whether there is keyword 'AUDIT' in the syslog

            #Format behavior_log
            behavior_log = re.sub(r'\(\d+\)', '', syslog_msg_list[7])
            behavior_log = re.sub(r'(\w+)=', '"\g<1>\"=', behavior_log)
            behavior_log = re.sub(r'=([^{}]*?)(;|,)', '=\"\g<1>\"\g<2>', behavior_log)
            behavior_log = '{'+behavior_log[0:-1].replace(';', ',').replace('=}', '=\"\"}').replace('=',':')+'}'

            #Generate behavior_log dictionary
            behavior_log_dict = eval(behavior_log)
            behavior_log_dict['access_time'] = syslog_msg_list[3]  # Save access_time to the dict

            return behavior_log_dict
        else:
            return False

    def handle(self):
        syslog_msg = self.request[0].strip()
        behavior_log_dict = self.make_syslog_dict(syslog_msg)
        if behavior_log_dict:
            print behavior_log_dict




def start_syslog_server(host, port, syslog_handler):

    syslog_server = SocketServer.UDPServer((host, port), SyslogHandler)
    syslog_server.serve_forever()
