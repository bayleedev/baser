_ = require('underscore')
dictionary = require('prefix-dictionary')

class Word

  nodes: []

  constructor: (nodes = []) ->
    @nodes = nodes

  length: ->
    @nodes.length

  highest_letter: ->
     _.inject(@nodes, ((memo, el) -> Math.min(memo, el.row)), 12)

  lowest_letter: ->
     _.inject(@nodes, ((memo, el) -> Math.max(memo, el.row)), 0)

  indexOf: ->
    @word().indexOf.apply(@word(), arguments)

  push: (node) ->
    @nodes.push node

  clone: ->
    new Word(@nodes.slice(0))

  word: ->
     _.inject(@nodes, ((memo, el) -> memo += el.letter), '').toLowerCase()

  toString: ->
    @word()

  chart: ->
     _.inject(@nodes, ((memo, el) -> memo.push([el.row, el.column]); memo), [])

  isWord: ->
    dictionary.isWord(@word())

  isPossible: ->
    dictionary.isWordPrefix(@word()) or @isWord()

module.exports = Word
