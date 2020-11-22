var express = require("express");
var router = express.Router();
var Forum_questions = require("../../models/forum_questions");
var Forum_category = require("../../models/forum_category");

const {logger} = require("../../logger");
const forum_questions = new Forum_questions();
const forum_category = new Forum_category();

router.get("/forum", function(req, res, next) {    
    let forum_id = req.query.id;
    logger.debug("forum_id:" + forum_id);
    console.log(req.query);
    console.log("forum_id:" + forum_id);
    
    forum_questions.findForumQuestions(forum_id, function(result){
        logger.debug("Questions result: " + JSON.stringify(result));
        let questions = result;

        forum_category.findCatergoryDetails(forum_id, function(result2){
            logger.debug("category details: " + JSON.stringify(result2));
            let category = result2;

            res.render("forum/forum_category",{list:questions, cat:category});  
        });

    });

});

router.get("/question", function(req,res,next){
    let question_id = req.query.id;
    let forum_id = req.query.forum;
    logger.debug("question_id from router:" + question_id);
    logger.debug("forum_id from router:" + forum_id);

    forum_questions.getQuestion(question_id, function(result){
        logger.debug("Questions result: " + JSON.stringify(result));

        res.render("forum/question_detail", {list:result,forum_id:forum_id});
    });
    
});

router.get("/reply", function(req,res,next){
    let question_id = req.query.id;
    let forum_id = req.query.forum;
    logger.debug("question_id from router:" + question_id);
    logger.debug("forum_id from router:" + forum_id);

    forum_questions.replyQuestion(question_id, function(result){
        logger.debug("Questions result: " + JSON.stringify(result));

        res.render("forum/question_reply", {list:result});
    });
    
});

router.post("/qreply", function(req,res,next){
    let question_id = req.body.question_id;
    let forum_id = req.body.forum_id;
    let reply = req.body.reply;
    logger.debug("question_id from router:" + question_id);
    logger.debug("forum_id from router:" + forum_id);
    logger.debug("reply from router:" + reply);

    forum_questions.submitReply(question_id, reply, function(result){
        logger.debug("Questions result: " + JSON.stringify(result));

        res.redirect("/");
    });
    
});

router.get("/newques", function(req,res,next){
    let forum_id = req.query.id;
    logger.debug("forum_id from router:" + forum_id);

    res.render("forum/new_question",{forum_id:forum_id});
});

router.post("/newques", function(req,res,next){
    let forum_id = req.body.forum_id;
    let question = req.body.question;
    let question_detail = req.body.question_detail;
    logger.debug("forum_id from router:" + forum_id);
    logger.debug("question from router:" + question);
    logger.debug("question_detail from router:" + question_detail);

    forum_questions.newQuestion(forum_id, question, question_detail, function(result){
        logger.debug("Questions result: " + JSON.stringify(result));

        res.redirect("/");
    });
    
});

module.exports = router;