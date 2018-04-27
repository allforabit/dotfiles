const epc = require("elrpc");
const puppeteer = require("puppeteer");


(async () => {
  await epc.startServer();
  
  // Boot browser
  const browser = await puppeteer.launch();
  // Open page
  const page = await browser.newPage();

  server.defineMethod("scroll", async function(url, path) {
  });
  server.defineMethod("go", async function(url, path) {
  });
  server.wait();
})();
