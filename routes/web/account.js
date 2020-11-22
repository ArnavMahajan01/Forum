var express = require("express");
var User = require("../../models/user");
var bcrypt = require("bcrypt");

var router = express.Router();
const {logger} = require("../../logger");

const user = new User();

router.get("/login", function(req, res) {
    res.render("accounts/login", {"res_msg":"","res_status": false});
});

router.post("/login", (req, res, next) => {
    let email = req.body.my_email;
    let password = req.body.my_password;
    //res.render("accounts/login");
    console.log("This is post login page. Email is "+ email+" and password is "+ password);
    //console.log("Login post page");

    if(email && password)
    {
        user.find(email, function(result){
            logger.debug("user find result:" + JSON.stringify(result));
            console.log("User Password: " + result.user_password);

            let compare_password = bcrypt.compareSync(password, result.user_password);

            if(compare_password == true)
            {
                logger.debug("Passwords are same and name: " + result.user_name + "and email: " + result.user_email + " user_id:" + result.users_id);
                logger.debug(result.user_email);
                console.log(result.user_email);
                req.session.user_email = result.user_email;
                req.session.user_name = result.user_name;
                req.session.user_id = result.users_id;
                logger.debug("login completed:" + req.session);
                console.log("login completed" + req.session);
                res.redirect("/");
            }
            else
            {
                console.log("Password do not match");
                res.render("accounts/login",{"res_msg":"User credentials are invalid","res_status":false});
            }
        })
    }
    else
    {

    }
    
});

router.get("/forget_password",function(req,res){
    res.render("accounts/forget_password",  {"res_msg": " ", "res_status": false});
});


router.post("/forget_password", (req, res, next) => {
    let email = req.body.email;
    let new_password = req.body.new_password;
    let confirm_new_password = req.body.confirm_new_password;

    if(email && new_password && confirm_new_password)
    {
        if(new_password != confirm_new_password)
        {
            logger.debug("Passwords do not match");
            res.render("accounts/forget_password", {"res_msg": "Passwords does not match", "res_status": true});
        }
        else
        {
            user.find(email, function(result){
                logger.debug("user find result:" + JSON.stringify(result));
                console.log("Changing password");

                if(result)
                {
                    user.forget_password(email, new_password, function(result){
                        console.log("Password changed");
                        res.redirect("/");
                    })
                }
                else
                {
                    logger.debug("Invalid Email-ID");
                    res.render("accounts/forget_password", {"res_msg": "Invalid user", "res_status": true});
                }
                
            })
        }
    }
})

router.get("/change_password", function(req,res){
    res.render("accounts/change_password");
});

router.post("/change_password", (req,res,next) => {
    let email = req.body.email;
    let old_password = req.body.old_password;
    let new_password = req.body.new_password;
    let confirm_new_password = req.body.confirm_new_password;

    if(email && new_password && confirm_new_password && old_password)
    {
        if(new_password != confirm_new_password)
        {
            logger.debug("Passwords do not match");
            res.render("accounts/change_password", {"res_msg": "Passwords does not match", "res_status": true});
        }
        else
        {
            user.find(email,function(result){
                logger.debug("user find result:" + JSON.stringify(result));
                if(bcrypt.compareSync(old_password, result.user_password) == false)
                {
                    logger.debug("Wrong old password");
                }
                else
                {
                    if(result)
                    {
                        user.forget_password(email, new_password, function(result){
                            console.log("Password changed");
                            res.redirect("/");
                        })
                    }
                    else
                    {
                        logger.debug("Invalid Email-ID");
                        res.render("accounts/forget_password", {"res_msg": "Invalid user", "res_status": true});
                    }
                }
            })
            
        }
    }
})

router.get("/signup",function(req,res){
    res.render("accounts/signup");
});

router.post("/signup", (req, res, next) => {
    console.log("calling post signup method");
    let email=req.body.email;
    let full_name = req.body.full_name;
    let password = req.body.password;
    let confirm_password = req.body.confirm_password;
    let tnc = req.body.tnc;

    logger.debug("Email: "+ email + " Full name: " + full_name + " Password: " + password + " Confirm Password: " + confirm_password + " Terms & Condition: " + tnc);
    if(email && full_name && password && confirm_password && tnc ) 
    {
        if(password != confirm_password)
        {
            logger.debug("Passwords do not match");
            res.redirect("/signup");
            
        }
        else
        {
            user.find(email, function(result){
                logger.debug("user find result:" + JSON.stringify(result));
                if(result.cnt > 0) 
                {
                    logger.debug("user already exists");
                    res.render("accounts/signup");
                }
                else
                {
                    console.log("new user");
                    user.create(email, full_name, password, function(result)
                    {
                        if(result)
                        {
                            console.log("user inserted");
                            res.redirect("/login");
                        }
                        else{
                            console.log("error in inserting user");
                            res.render("accounts/signup");
                        }
                    })
    
                }
            })
        }        
    }
    else
    {
        logger.debug("Please fill all the required information");
        res.render("accounts/signup");
    }
});

module.exports = router;