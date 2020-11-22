const pool = require('./pool');
const {logger} = require('../logger');
const bcrypt = require('bcrypt');

function Forum_questions() {};

Forum_questions.prototype = {
    findForumQuestions: async function(forum_id, callback) 
    {
        logger.debug("sql_questions Function called: " + forum_id);
        
        let sql_questions = 'select question_id, question_header, views_count, created_by, DATE_FORMAT(updated_dt, "%d %b, %Y") as updated_dt from forum_questions where forum_id=? and status = 1';
        
        let resp = {"resp_msg" : "Response Successful", "resp_status": true} ;

        try{
            const questions = await pool.query(sql_questions, forum_id);
            callback(questions);
            
        }catch(err){
            logger.error("Error from find function: " + err);
            resp = {"resp_msg" : "Questions not found", "resp_status": false};
            callback(null, resp);
        }
    },
    getQuestion: async function(question_id, callback)
    {
        logger.debug("question_id from model:" + question_id);
        let sql = "select a.id, a.question_id, a.question_detail, a.reply_level, a.user_id, a.created_dt, b.user_name, b.user_email, c.question_header, c.forum_id, d.forum_category_name from question_detail a, users b,  forum_questions c, forum_category d where a.question_id=1 and a.status=? and a.user_id = b.users_id and c.question_id=a.question_id and d.forum_category_id=c.forum_id order by a.created_dt asc;";

        try {
            const question = await pool.query(sql, question_id);
            logger.debug('question::::' + question);
            callback(question);
        } catch (err) {
            logger.error("Error from find function: " + err);
            resp = {"resp_msg" : "User not found", "resp_status": false};
            callback(null, resp);
        }
    },
    replyQuestion: async function(question_id, callback)
    {
        logger.debug("question_id from model:" + question_id);
        let sql = "select a.id, a.question_id, a.question_detail, a.reply_level, a.user_id, a.created_dt, b.user_name, b.user_email, c.question_header, c.forum_id, d.forum_category_name from question_detail a, users b,  forum_questions c, forum_category d where a.question_id=1 and a.status=? and a.user_id = b.users_id and c.question_id=a.question_id and d.forum_category_id=c.forum_id order by a.created_dt asc;";

        try {
            const question = await pool.query(sql, question_id);
            logger.debug('question::::' + question);
            callback(question);
        } catch (err) {
            logger.error("Error from find function: " + err);
            resp = {"resp_msg" : "User not found", "resp_status": false};
            callback(null, resp);
        }
    },
    submitReply: async function(question_id, reply, callback)
    {
        logger.debug("question_id from model:" + question_id);
        logger.debug("reply from model:" + reply);

        let sql = "insert into question_detail (question_id, question_detail, reply_level, user_id, created_dt)  values(?, ?, 1, 2, now());";

        try {
            const dbReply = await pool.query(sql, [question_id, reply]);
            logger.debug('question::::' + dbReply);
            callback(dbReply);

        } catch (err) {
            logger.error("Error from submitReply function: " + err);
            resp = {"resp_msg" : "User not found", "resp_status": false};
            callback(null, resp);
        }
    },
    newQuestion: async function(forum_id, question, question_detail, callback)
    {
        logger.debug("forum_id from model:" + forum_id);
        logger.debug("question from model:" + question);
        logger.debug("question_detail from model:" + question_detail);

        let sql_question_header = "insert into forum_questions(forum_id, question_header, created_dt) values(?, ?, now())";
        let sql_question_detail = "insert into question_detail (question_id, question_detail, reply_level, user_id, created_dt)  values(?, ?, 0, 2, now());"

        
        try {
            const qHeader = await pool.query(sql_question_header, [forum_id, question]);
            let quesId = qHeader.insertId;
            const qBody = await pool.query(sql_question_detail, [quesId, question_detail]);
            logger.debug('question::::' + qBody);
            callback(qBody);

        } catch (err) {
            logger.error("Error from newQuestion function: " + err);
            resp = {"resp_msg" : "User not found", "resp_status": false};
            callback(null, resp);
        }
    }
}

module.exports = Forum_questions;