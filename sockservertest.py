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
                pattern = re.compile(r'SrcIPAddr\(1003\)=(?P<from_ip>[0-9|\.]+);.+Application\(1002\)=(?P<app_name>\w+)'
                                     r';Behavior\(1001\)=(?P<app_action>\w+);BehaviorContent\(1102\)={(Sender_addr\(1106\)=(?P<mail_from>.*))?'
                                     r'(,Receiver_addr\(1107\)=(?P<mail_to>.*))?(,Subject\(1108\)=(?P<subject>.*))?'
                                     r'(,Body\(1109\)=(?P<body>.*))?(Account\(1103\)=(?P<app_acount>.*))?(,Content\(1104\)=(?P<app_keyword>.*))?'
                                     r'(,FileName\(1097\)=(?P<file_name>.*))?(,FileSize\(1105\)=(?P<file_siet>.*))?}'
                                     r'.*;Client\(1110\)=(?P<os_type>\w*);SoftVersion\(1111\)=(?P<app_version>.*);Action\(1053\)')
                # Format behavior_log
                behavior_log = res.group('behavior').replace('\"','').replace('\'','')
                behavior_log = re.sub(r'(\(\d+\)=)(.*?)([}|;|,|{][;|}|A-Z])', '\g<1>\"\g<2>\"\g<3>', behavior_log)
                behavior_log = re.sub(r'(\w+)(\(\d+\))=', '"\g<1>\"=', behavior_log)
                behavior_log = behavior_log.replace('\"\"{','{').replace(';}','}').replace(';',',')
                behavior_log = re.sub(r'(\"=)([a-zA-Z]+),$', '\g<1>\"\g<2>\"', behavior_log)
                behavior_log = '{' + behavior_log + '}'
                behavior_log = behavior_log.replace('=', ':')

                # Generate behavior_log dictionary
                behavior_log_dict = eval(behavior_log)
                behavior_log_dict['access_time'] = syslog_type_msg.split(' ')[3]  # Save access_time to the dict

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
            print behavior_log_dict


def start_syslog_server(host, port):
    syslog_server = SocketServer.UDPServer((host, port), SyslogHandler)
    syslog_server.serve_forever()

if __name__ == '__main__':
    host, port = "localhost", 9999
    start_syslog_server(host, port)
