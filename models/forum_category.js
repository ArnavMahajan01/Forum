const pool = require('./pool');
const {logger} = require('../logger');
const bcrypt = require('bcrypt');

function Forum_category() {};

Forum_category.prototype = {
    findCatergories: async function(callback) 
    {
        logger.debug("Findcategories Function called ");
        
        let sql_categories = "select forum_category_id, forum_category_name, forum_category_description, forum_icon from forum_category where status = 1";
        
        try{
            const users = await pool.query(sql_categories);
            callback(users);
            
        }catch(err){
            logger.error("Error from find function: " + err);
            resp = {"resp_msg" : "User not found", "resp_status": false};
            callback(null, resp);
        }
    },
    findCatergoryDetails: async function(forum_id, callback) 
    {
        logger.debug("Findcategories Function called ");
        
        let sql_categories = "select forum_category_id, forum_category_name, forum_category_description, forum_icon from forum_category where forum_category_id=? and status = 1";
        
        try{
            const users = await pool.query(sql_categories, forum_id);
            callback(users);
            
        }catch(err){
            logger.error("Error from find function: " + err);
            resp = {"resp_msg" : "User not found", "resp_status": false};
            callback(null, resp);
        }
    }
}

module.exports = Forum_category;