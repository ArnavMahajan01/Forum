var express = require("express");

var router = express.Router();


router.get("/login", function(req, res) {
    res.render("accounts/login");
});

router.post("/login", (req, res, next) => {
    let email = req.body.my_email;
    let password = req.body.my_password;
    //res.render("accounts/login");
    console.log("This is post login page. Email is "+ email+" and password is "+ password);
    //console.log("Login post page");
});

router.get("/forget_password",function(req,res){
    res.render("accounts/forget_password");
});

router.get("/signup",function(req,res){
    res.render("accounts/signup");
});



module.exports = router;