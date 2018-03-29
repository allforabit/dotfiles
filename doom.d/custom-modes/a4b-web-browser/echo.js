var epc = require("elrpc");

epc.startServer().then(function(server) {
	server.defineMethod("echo", function(args) {
		return args;
	});
	server.wait();
});
