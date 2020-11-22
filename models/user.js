const pool = require('./pool');
const {logger} = require('../logger');
const bcrypt = require('bcrypt');

function User() {};

User.prototype = {
    find: async function(email, callback) 
    {
        logger.debug("User Function called with email: " + email);
        
        let sql_userinfo = "select count(a.user_email) as cnt, a.user_email, a.user_password, b.users_id, b.user_name from user_credentials a, users b where a.user_email = ? and a.status = 1 and a.user_id=b.users_id;";
        
        let resp = {"resp_msg" : "Response Successful", "resp_status": true} ;

        try{
            const users = await pool.query(sql_userinfo, email);
            callback(users[0]);
            
        }catch(err){
            logger.error("Error from find function: " + err);
            resp = {"resp_msg" : "User not found", "resp_status": false};
            //cal
            callback(null, resp);
        }
        
    },

    create: async function(email, full_name, password, callback){
        
        logger.debug("Email: " + email + " Full name: " + full_name + " Password: " + password);
        let resp = {"resp_msg" : "Response Successful", "resp_status": true} ;
        password = bcrypt.hashSync(password, 10);

        let sql_user = "insert into users (user_name, user_email) values (?, ?);";
        let sql_user_credentials = "insert into user_credentials (user_email, user_password) value (?, ?);";

        try{
            const users = await pool.query(sql_user, [full_name, email]);
            const user_credentials = await pool.query(sql_user_credentials, [email, password]);
            callback(user_credentials.insertId, resp);
            
            
        }catch(err){
            logger.error("Error from find function: " + err);
            resp = {"resp_msg" : "User not found", "resp_status": false};
            callback(null, resp);
        }
    },

    forget_password: async function(email, password, callback)
    {
        logger.debug("Email: " + email + " Password: " + password);
        let resp = {"resp_msg" : "Response Successful", "resp_status": true} ;
        password = bcrypt.hashSync(password, 10);

        let sql_new_password = "update user_credentials set user_password = ? where user_email = ?;";

        try
        {
            const change_password = await pool.query(sql_new_password, [password, email])
            callback(change_password[0], resp);

        }catch(err){
            logger.error("Error from find function: " + err);
            resp = {"resp_msg" : "User not found", "resp_status": false};
            callback(null, resp);
        }
    } 
}
module.exports = User;