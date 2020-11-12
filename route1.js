const { response } = require("express");
var express = require("express");
var path = require("path");

var router = express.Router();

router.get("/", function(req, res){
    console.log("The starting page!!!!");
    res.render("index");
})
router.get("/about", function(req, res){
    res.render("about");
})

router.get("/login", function(req, res){
    res.render("accounts/login");
})

router.get("/signup", function(req, res){
    res.render("accounts/signup");
})

router.get("/forgetpassword", function(req, res){
    res.render("accounts/forgetpassword");
})

module.exports = router;