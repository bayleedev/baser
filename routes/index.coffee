express = require('express')
router = express.Router()
pry = require('pryjs')
_ = require('underscore')

### GET home page. ###
router.get '/', (req, res, next) ->
  res.render 'index', title: 'Express'

router.post '/board', (req, res, next) ->
  #board = new Board(req.params.board);
  eval pry.it
  res.send JSON.stringify(req.body)

module.exports = router
