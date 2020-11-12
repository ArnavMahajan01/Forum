var express = require("express");
var router = express.Router();

router.use("/",require("./home"));
router.use("/",require("./account"));
//router.use("/",require("./forum"));

module.exports = router;