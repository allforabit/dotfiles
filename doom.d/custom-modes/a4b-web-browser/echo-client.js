var elrpc = require("elrpc");

(async function boot() {
  const client = await elrpc.startProcess(["node", "echo.js"]);
  const result = await client.callMethod("echo", "3 hello OK");
  console.log(result);
  client.stop();
})();
