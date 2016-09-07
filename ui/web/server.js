var express = require('express');
var app = express();

app.use("/app", express.static("app"));
app.use("/bower_components", express.static("bower_components"));
app.use("/dist", express.static("dist"));
app.use("/node_modules", express.static("node_modules"));
app.use("/js", express.static("js"));
app.use("/partials", express.static("partials"));
app.use("/imagenes", express.static("imagenes"));

app.get('/*', function (req, res) {
  res.sendfile('index.html');
});

app.listen(3000, function () {
  console.log('Example app listening on port 3000!');
});
