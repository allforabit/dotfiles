var elrpc = require("elrpc");

elrpc.startProcess(["node", "echo.js"]).then(function(client) {
	client.callMethod("echo", "3 hello OK").then(function(ret) {
		console.log(ret);
		client.stop();
	});
	console.log("2 call hello");
});


console.log("1 start");
(async function boot() {
  const client = await elrpc.startProcess(["node", "echo.js"]);
  const result = await client.callMethod("echo", "3 hello OK");
  console.log(result);
  client.stop();
})();
