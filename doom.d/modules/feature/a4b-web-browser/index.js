const h = require('@thi.ng/hiccup');
const micro = require('micro');
const io = require('io');

const browserSystem = require('./puppeteer-browser');

const {send} = require('micro')

function stuff(ssBase64) {
  return h.serialize(["html",
                      ["head",
                       ["title", "Hello world"]],
                      ["body",
                       {
                         style: {
                           background: "white"
                         }
                       },
                       ["div.yo", "Oh hi there how are you there??", 
                        ["div", ["a", {href: "http://google.ie"}, "A link to google yo"], ["img", {src: `data:image/png;base64, ${ssBase64}`}]],
                        ["section",
                         {
                           style: {
                             background: "blue", 
                             color: "grey"
                           }
                         }
                         , "A section"]
                       ]]]);
}

const thing = "thing";

const server = micro(async (req, res) => {

    const browser = await browserSystem();
    const statusCode = 200;

    const ss = await browser.getScreenshot("https://clojurescript.org");
    const base64EncodedSS = ss.toString('base64');

    res.setHeader('content-type', 'text/html');
    send(res, statusCode, stuff(base64EncodedSS));

	console.log('Serving index.html');
	res.end(html);
});

const io = require('socket.io')(server);

// socket-io handlers are in websocket-server.js
require('./websocket-server.js')(io);

server.listen(3000);
