var express = require("express");
var router = express.Router();
var Forum_category = require("../../models/forum_category");

const {logger} = require("../../logger");
const forum_category = new Forum_category();

router.get("/", function(req, res) {
    forum_category.findCatergories(function(result){
        logger.debug("Category result: " + JSON.stringify(result));
        res.render("index",{list:result});  
    })
    //res.render("index");
})

module.exports = router;