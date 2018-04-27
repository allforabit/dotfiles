const express = require('express');
const app = express();
const chokidar = require('chokidar');
const watcher = chokidar.watch('./app');
watcher.on('ready', function() {
  watcher.on('all', function() {
    console.log("Clearing /dist/ module cache from server")
    Object.keys(require.cache).forEach(function(id) {
      if (/[\/\\]app[\/\\]/.test(id)) delete require.cache[id]
    })
  })
})
app.use(function (req, res, next) {
  require('./app/index')(req, res, next);
});
app.listen(9000);


// (async () => {
  
//   const browser = await browserSystem();

//   const server = micro(async (req, res) => {

//     const statusCode = 200;

//     const ss = await browser.getScreenshot("http://localhost:9000");
//     const base64EncodedSS = ss.toString('base64');

//     res.setHeader('content-type', 'text/html');

//     console.log('Serving index.html');
//     res.end(stuff(base64EncodedSS));
//   });

//   const io = require('socket.io')(server);

//   // socket-io handlers are in websocket-server.js
//   require('./websocket-server.js')(browser)(io);

//   server.listen(4000);

// })();
