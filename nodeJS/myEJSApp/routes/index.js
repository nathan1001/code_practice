var express = require('express');
var vd =require('../videodata.json');

var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { 
    title: 'Express',
    name:'Nathan Donkor',
    videodata:vd });
});

module.exports = router;
