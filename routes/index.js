var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});
router.post('/board', function(req, res, next) {
  //board = new Board(req.params.board);
  //res.send(board.find());
});

module.exports = router;
