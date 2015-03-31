var express = require('express');
var router = express.Router();
var pry = require('pryjs');
var _ = require('underscore');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});
router.post('/board', function(req, res, next) {
  //board = new Board(req.params.board);
  eval(pry.it);
  res.send(JSON.stringify(req.body));
});

module.exports = router;
