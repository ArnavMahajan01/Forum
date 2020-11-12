var express = require("express");
var path = require("path");

var router = express.Router();

router.get("/arnav", function(req, res){
    console.log("The starting page!!!!");
    res.render("index");
})

var app = express();

app.set("port", process.env.PORT || 3000);
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "ejs");

app.use(router);

app.listen(app.get("port"), function(){
    console.log("Server starts at port " + app.get("port"));
    //console.log(__dirname);
})

// 