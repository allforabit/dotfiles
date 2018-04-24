const h = require('@thi.ng/hiccup');
const micro = require('micro');
// const files = 

const {send} = require('micro')

// module.exports = async (req, res) => {
//     const statusCode = 200;
//     res.setHeader('content-type', 'text/html');
//     send(res, statusCode, h.serialize(["html", ["head"], ["body", ["div.yo", "hi ho"]]]));
// }

const server = micro(async (req, res) => {
  await sleep(500);
  return 'Hello world';
});

server.listen(3000);
