const util = require('util');
const mysql = require('mysql');
const {logger} = require("../logger");

/**
 * Connection to the database.
 *  */
const pool = mysql.createPool({
    connectionLimit: 10,
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'new_forum'
});

pool.getConnection((err, connection) => {
    if(err) {
        if (err.code === 'PROTOCOL_CONNECTION_LOST') {
            logger.info("PROTOCOL_CONNECTION_LOST");
            console.error('Database connection was closed.')
          }
          if (err.code === 'ER_CON_COUNT_ERROR') {
            logger.info("ER_CON_COUNT_ERROR");
            console.error('Database has too many connections.')
          }
          if (err.code === 'ECONNREFUSED') {
            logger.info("ECONNREFUSED");
            console.error('Database connection was refused.')
          }
    }
    
    
    if(connection)
        connection.release();
    return;
});

pool.query = util.promisify(pool.query);

module.exports = pool;