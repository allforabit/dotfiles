const h = require('@thi.ng/hiccup');
const micro = require('micro');

const {send} = require('micro')

function stuff() {
  return h.serialize(["html",
                      ["head",
                       ["title", "Hello world"]],
                      ["body",
                       {
                         style: {
                           background: "white"
                         }
                       },
                       ["div.yo", "Oh hi there how are you??", 
                        ["div", ["a", {href: "http://google.ie"}, "A link to google"], ["img", {src: "https://vignette.wikia.nocookie.net/vsbattles/images/8/82/The_thing_render_by_bobhertley-d5roo6y.png/revision/latest/scale-to-width-down/1000?cb=20170505072956"}]],
                        ["section",
                         {
                           style: {
                             background: "blue", 
                             color: "grey"
                           }
                         }
                         , "Here's a section!!!"]
                       ]]]);
}

module.exports = async (req, res) => {
    const statusCode = 200;
    res.setHeader('content-type', 'text/html');
    send(res, statusCode, stuff());
}


// const hello = "hi";


