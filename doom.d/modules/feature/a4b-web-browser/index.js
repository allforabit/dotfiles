const h = require('@thi.ng/hiccup');
const micro = require('micro');

// https://gist.github.com/companje/eea17988257a10dcbf04

const browserSystem = require('./puppeteer-browser');

const {send} = require('micro')

function stuff(ssBase64) {
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
                       ["div.yo", "Oh hi there how are you there??", 
                        ["div", ["a", {href: "http://google.ie"}, "A link to google yo"], ["img", {src: `data:image/png;base64, ${ssBase64}`}]],
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

// Async iffe
(async () => {
  
  const browser = await browserSystem();

  const server = micro(async (req, res) => {

    const statusCode = 200;

    const ss = await browser.getScreenshot("https://clojurescript.org");
    const base64EncodedSS = ss.toString('base64');

    res.setHeader('content-type', 'text/html');

    console.log('Serving index.html');
    res.end(stuff(base64EncodedSS));
  });

  const io = require('socket.io')(server);

  // socket-io handlers are in websocket-server.js
  require('./websocket-server.js')(browser)(io);

  server.listen(4000);

})();
