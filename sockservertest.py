import SocketServer

class MyHandler(SocketServer.BaseRequestHandler):
	
	def handle(self):
		data = self.request[0].strip()
		socket = self.request[1]
		print self.request
		print self.client_address
		print "{} wrote".format(self.client_address[0])
		print data
		socket.sendto(data.upper(), self.client_address)	

if __name__ == '__main__':
	HOST, PORT = "localhost", 9999
	server = SocketServer.UDPServer((HOST,PORT), MyHandler)
	server.serve_forever()
