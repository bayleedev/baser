express = require('express')
router = express.Router()
_ = require('underscore')
Board = require('../models/board')

router.get '/', (req, res, next) ->
  res.render 'index'

router.post '/board', (req, res, next) ->
  board = new Board(req.body.board)
  board.find_words req.body.points, (words) ->
    res.send words: _.map(words, (el) -> el.toJson())

module.exports = router
