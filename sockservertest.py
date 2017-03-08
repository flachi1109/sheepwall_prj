import SocketServer
import re
import logging

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
                                     r'=(?P<mail_subject>.*?))?(,Body\(1109\)=(?P<mail_body>.*?))?(Account\(1103\)=(?P<app_account>.*?))'
                                     r'?(,Content\(1104\)=(?P<app_keyword>.*?))?(,FileName\(1097\)=(?P<trans_filename>.*?))?'
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
                behavior_log_dict['trans_filename'] = behavior_log.group('trans_filename')
                behavior_log_dict['trans_filesize'] = behavior_log.group('trans_filesize')
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
            behavior_item = App


def start_syslog_server(host, port):
    syslog_server = SocketServer.UDPServer((host, port), SyslogHandler)
    syslog_server.serve_forever()

if __name__ == '__main__':
    host, port = "localhost", 9999
    start_syslog_server(host, port)
