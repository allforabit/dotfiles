const express = require('express');
const app = express();
const chokidar = require('chokidar');
const watcher = chokidar.watch('./app');

require("./app/epc-server");

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
app.listen(9001);

