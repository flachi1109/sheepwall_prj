import socket
import sys

HOST, PORT = "127.0.0.1", 9999
data = " ".join(sys.argv[1:])

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

sock.sendto(data + "\n", (HOST,PORT))
received = sock.recv(1024)

print "sent: {}".format(data)
print "Received: {}".format(received)
