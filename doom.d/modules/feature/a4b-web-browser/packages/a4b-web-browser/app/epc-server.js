const epc = require("elrpc");
const browser = require("./puppeteer-browser");

async function scrollTo(pageInstance, xPos, yPos) {
  pageMessage = `Scroll to (${xPos}, ${yPos})`;
  pageInstance.evaluate((xPos, yPos) => {
    window.scrollTo(xPos, yPos);
  }, xPos, yPos);
}

(async () => {
  const server = await epc.startServer();
  
  server.defineMethod("helloWorld", (msg) => console.log(`Hello world: ${msg}`));

  const browserInstance = await browser.get();
  const pageInstance = await browser.getPage(browserInstance);

  server.defineMethod("scrollTo", async (x, y) => scrollTo(pageInstance, x, y));

  server.defineMethod("goto", async (url) => {
    pageInstance.goto(url);
    pageMessage = `Went to yo ${url}`;
    console.log(pageMessage);
  });
  
  server.defineMethod("scrollToTop", async () => {
    pageMessage = `Scroll to top`;
    pageInstance.evaluate(() => {
      window.scrollTo(0, 0);
    });
  });
  

  server.defineMethod("click", async (x, y) => {
    pageMessage = `Click ${x}, ${y}`;
    console.log(pageMessage);
    pageInstance.mouse.click(x, y);
  });

  server.wait();

})();
