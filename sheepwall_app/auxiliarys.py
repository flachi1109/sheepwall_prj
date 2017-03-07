# -*- coding:utf-8 -*-
from models import AppBehaviorLog
import SocketServer

class SyslogHandler(SocketServer.BaseRequestHandler):
    '''
    Extract key field from syslog message and store in AppBehavior database
    '''

    def handle(self):
       syslog = self.request[]

    def make_syslog_dict(self, syslog_msg):
        syslog_msg_list = syslog_msg.split('')
        if syslog_msg_list[6].find('AUDIT') > -1:
            syslog_msg_dict['access_time'] = syslog_msg_list[3]
            behavior_log =
        else:
            return False


def start_syslog_server(host, port, syslog_handler):

    syslog_server = SocketServer.UDPServer((host, port), SyslogHandler)
    syslog_server.serve_forever()