#!/usr/bin/env python
import os
import sys



if __name__ == "__main__":
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "sheepwall_prj.settings")

    from django.core.management import execute_from_command_line

    execute_from_command_line(sys.argv)
    from  sheepwall_app.auxiliarys import *
    host, port = "localhost", 9999
    start_syslog_server(host, port)