var express = require("express");
var path = require("path");

const {logger} = require("./logger");


var app = express();

app.use(express.urlencoded({extended:false}));

app.set("port", process.env.PORT || 3000);
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "ejs");

app.use("/static", express.static(__dirname + '/static'));
app.use("/", require("./routes/web"));

logger.info("This is information");
logger.error("This is error");
logger.debug("This is debug");

app.listen(app.get("port"), function(){
    console.log("Server starts at port " + app.get("port"));
    //console.log(__dirname);
})

// 