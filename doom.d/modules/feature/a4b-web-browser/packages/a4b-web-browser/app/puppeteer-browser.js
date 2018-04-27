const puppeteer = require('puppeteer');

var browser;

async function getBrowser() {
  const browser = await puppeteer.launch({
    // headless: false,
    executablePath: "C:/Users/Admin/AppData/Local/Chromium/Application/chrome.exe",
    args: [
      '--remote-debugging-port=9222'
    ],
    
  });
  return browser;
}

async function getPage(browser) {
  const page = await browser.newPage();
  page.on('console', msg => console.log('PAGE LOG:', msg.text()));
  return page;
}

async function getScreenshot(browser, url) {
  const page = await getPage(browser);
  await page.goto(url);
  page.evaluate(_ => {
    window.scrollBy(0, window.innerHeight);
    window.scrollBy(0, window.innerHeight);
    window.scrollBy(0, window.innerHeight);
  });
  const ss = page.screenshot();
  // Return the screenshot buffer
  return ss;
}

async function restartBrowser(browser) {
  await browser.close();
  return await puppeteer.launch();
}

// A singleton that holds the browser
module.exports = async () => {
  if(!browser){
    console.log("setup browser");
    browser = await getBrowser();
  }
  // if(!page){
  //   console.log("setup page");
  //   browser = await getPage();
  // }
  
  // An api to the browser system
  return {
    getScreenshot: async (url) => getScreenshot(browser, url),
    restartBrowser: async () => {
      browser = await restartBrowser(browser);
    },
    yScrollTo: async (x) => {
      console.log(`Scroll to ${x}`);
    }
  }
}
