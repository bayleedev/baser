expect = require('chai').expect
sinon = require('sinon')
Node = require('../../models/node')

describe 'Node', ->
    node = {}

    describe '.new', ->

      describe 'given a real letter', ->

        beforeEach ->
            node = new Node('G', 0, 0)

        it 'to retain the letter value', ->
          expect(node.letter).to.equal 'G'

      describe 'given a bad letter', ->

        beforeEach ->
            node = new Node(null, 0, 0)

        it 'to not retain its value', ->
          expect(node.letter).to.equal '!'
