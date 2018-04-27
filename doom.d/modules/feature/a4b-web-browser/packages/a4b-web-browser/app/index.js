const h = require('@thi.ng/hiccup');
const micro = require('micro');

const express = require('express')
const router = express.Router()
const puppeteer = require('puppeteer');
const epc = require("elrpc");


var requestCount = 0;
// For now hold browser in a global
var browser;
var browserPage;

var pageMessage = "";

function stuff(params) {
  return h.serialize(["html",
                      ["head",
                       ["title", "Hello world"],
                       ["style", `
                            * { margin: 0; padding: 0; box-sizing: border-box; }
                            body { font: 13px Helvetica, Arial; }
                            form { background: grey; padding: 10px; position: fixed; bottom: 0; width: 100%; }
                            form input { border: 0; padding: 10px; width: 90%; margin-right: .5%; }
                            form button { width: 9%; background: rgb(130, 224, 255); border: none; padding: 10px; }
                            #messages { list-style-type: none; margin: 0; padding: 0; }
                            #messages li { padding: 5px 10px; }
                            #messages li:nth-child(odd) { background: #eee; }
                        `]
                      ],
                      ["body",
                       {
                         style: {
                           background: "white"
                         }
                       },
                       ["div.yo", `Request count: ${params.requestCount}`, 
                        ["div", ["div.messages", `MSG: ${params.msg}`], ["img", {src: `data:image/png;base64, ${params.ssBase64}`}]],
                        ["section",
                         {
                           style: {
                             background: "blue", 
                             color: "grey"
                           }
                         }
                         , 
                         ["ul#messages"],
                         ["form", {action: ""},
                          ["input", {id: "m",
                                     autocomplete: "off"}]],
                         ["script", {
                           src: "https://cdnjs.cloudflare.com/ajax/libs/socket.io/1.7.3/socket.io.min.js"
                         }],
                         ["script", {
                           src: "https://code.jquery.com/jquery-1.11.1.js"
                         }],
                         ["script", `
                              var iAmAGlobal = "Hello I am a global";
                              $(() => {
                                  var socket = io()
                                  $('form').submit(() => {
                                      socket.emit('chat message', $('#m').val())
                                      $('#m').val('')
                                      return false
                                  })
                                  socket.on('chat message', msg => {
                                      $('#messages').append($('<li>').text(msg))
                                  })
                              });
                          `],
                        ],
                       ]]]);
}

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

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

async function goToUrl(page, url){
  page.goto(url);
}

async function getScreenshot(page) {
  const ss = await page.screenshot();
  // Return the screenshot buffer
  return ss;
}

router.get('/', async (req, res) => {
  try{
    
    const browserInstance = await getBrowser();
    const pageInstance = await getBrowserPage(browserInstance);
    
    const ss = await getScreenshot(pageInstance);

    requestCount++;

    res.send(stuff({
      ssBase64: ss.toString("base64"),
      requestCount: requestCount,
      msg: pageMessage
    }));
    
    // if(req.query.url){
    //   goToUrl(pageInstance, req.query.url);
    // }else{
    //   res.send("Please provide a url");
    // }

  }catch(err) {
    console.error('There was an error reading the file!', err);
    res.send("There was an error.");
  }
});


// Let emacs join the party
module.exports = router;

// https://gist.github.com/companje/eea17988257a10dcbf04

// const browserSystem = require('./puppeteer-browser');

// const {send} = require('micro')

(async () => {
  const server = await epc.startServer();
  
  server.defineMethod("helloWorld", (msg) => console.log(`Hello world: ${msg}`));

  const browserInstance = await getBrowser();
  const pageInstance = await getBrowserPage(browserInstance);

  server.defineMethod("scrollTo", async function(xPos, yPos) {
    pageMessage = `Scroll to (${xPos}, ${yPos})`;
    pageInstance.evaluate(yPos => {
      window.scrollBy(0, yPos);
    }, yPos);
  });

  server.defineMethod("goto", async (url) => {
    pageInstance.goto(url);
    pageMessage = `Went to yo ${url}`;
    console.log(pageMessage);
  });

  server.wait();

})();

