express = require('express')
router = express.Router()
pry = require('pryjs')
qs = require('qs')
_ = require('underscore')
Board = require('../models/board')

router.get '/', (req, res, next) ->
  res.render 'index'

router.post '/board', (req, res, next) ->
  board = new Board(qs.parse(qs.stringify(req.body)).board)
  board.find_words [[0,0], [0,1]], (words) ->
    res.send words: _.map(words, (el) -> el.toJson())

module.exports = router
