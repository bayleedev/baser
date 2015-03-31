Word = require('./word')

class Node

  visited: false

  letter: null

  sibs: {}

  constructor: (@letter, @row, @column) ->
    @sibs = {}

  iterate: (word = new Word) ->
    word.push(@)
    return [] unless word.isPossible()
    @visited = true
    words = [word]
    for index,sib of @sibs
      words = words.concat(sib.iterate(word.clone())) unless sib.visited
    @visited = false
    words

module.exports = Node
