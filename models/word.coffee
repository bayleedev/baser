_ = require('underscore')
dictionary = require('prefix-dictionary')

class Word

  nodes: []

  constructor: (nodes = []) ->
    @nodes = nodes

  push: (node) ->
    @nodes.push node

  clone: ->
    new Word(@nodes.slice(0))

  word: ->
     _.inject(@nodes, ((memo, el) -> memo += el.letter), '').toLowerCase()

  toJson: ->
    {word: @word(), chart: @chart()}

  chart: ->
     _.inject(@nodes, ((memo, el) -> memo.push([el.row, el.column]); memo), [])

  isWord: ->
    dictionary.isWord(@word())

  isPossible: ->
    dictionary.isWordPrefix(@word()) or @isWord()

module.exports = Word
