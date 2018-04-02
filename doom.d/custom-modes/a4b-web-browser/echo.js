const epc = require("elrpc");
const puppeteer = require("puppeteer");

epc.startServer().then(async function(server) {

  // Boot browser
  const browser = await puppeteer.launch();
  // Open page
  const page = await browser.newPage();

  server.defineMethod("ss", async function(url, path) {
    await page.goto(url);
    await page.screenshot({path: path});

    await browser.close();
    return args;
  });
  server.wait();
});
