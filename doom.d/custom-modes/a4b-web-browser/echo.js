const epc = require("elrpc");
const puppeteer = require("puppeteer");

epc.startServer().then(function(server) {

  server.defineMethod("ss", async function(url, path) {

    const browser = await puppeteer.launch();
    const page = await browser.newPage();
    await page.goto(url);
    await page.screenshot({path: path});

    await browser.close();
    return args;
  });
  server.wait();
});
