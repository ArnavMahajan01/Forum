var express = require("express");
const session = require('express-session');
var path = require("path");

const {logger} = require("./logger");


var app = express();

app.use(express.urlencoded({extended:false}));

app.set("port", process.env.PORT || 3000);
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "ejs");

// session
app.use(session({
    secret:'forum_site',
    resave: false,
    saveUninitialized: false,
    cookie: {
        maxAge: 60 * 1000 * 30
    }
}));

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