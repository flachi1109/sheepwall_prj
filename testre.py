import re 

teststr = '''
<190>Mar  7 02:27:12 2017 F1080 %%10AUDIT/6/AUDIT_RULE_MATCH_IM_IPV4_LOG: Protocol(1001)=UDP;SrcIPAddr(1003)=10.1.1.3;SrcPort(1004)=4008;DstIPAddr(1007)=123.151.13.176;DstPort(1008)=8000;SrcZoneName(1025)=Trust;DstZoneName(1035)=Untrust;UserName(1113)=10.1.1.3;PolicyName(1079)=shenjiall;Application(1002)=QQ;Behavior(1101)=Login;BehaviorContent(1102)={Account(1103)=714991632,Content(1104)=,FileName(1097)=,FileSize(1105)=};Client(1110)=PC;SoftVersion(1111)=;Action(1053)=Permit;.
'''

