const puppeteer = require('puppeteer');

// For now hold browser in a global
var browser;
var browserPage;

async function getBrowser() {
  if(browser) {
    return browser;
  }
  browser = await puppeteer.launch({
    // headless: false,
    // executablePath: "C:/Users/Admin/AppData/Local/Chromium/Application/chrome.exe",
    // args: [
    //   '--remote-debugging-port=9222'
    // ]
  });
  return browser;
}

async function getBrowserPage(browser) {
  if(browserPage) {
    return browserPage;
  }
  browserPage = await browser.newPage();
  browserPage.on('console', msg => console.log('PAGE LOG:', msg.text()));
  return browserPage;
}

module.exports = {
  get: getBrowser,
  getPage: getBrowserPage
}
