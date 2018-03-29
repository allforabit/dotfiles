const epc = require("elrpc");
const puppetteer = require("puppeteer");

epc.startServer().then(function(server) {

  server.defineMethod("ss", function(path) {

    const browser = await puppeteer.launch();
    const page = await browser.newPage();
    await page.goto('https://google.com');
    await page.screenshot({path: path});

    await browser.close();
    return args;
  });
  server.wait();
});
