expect = require('chai').expect
sinon = require('sinon')
Word = require('../../mOdels/word')
Node = require('../../models/node')

describe 'Word', ->
    word = {}

    beforeEach ->
        word = new Word()
        word.push new Node('G', 0, 0)
        word.push new Node('I', 0, 1)
        word.push new Node('T', 0, 2)

    describe '#word', ->
      it 'gives correct word back', () ->
          expect(word.word()).to.equal 'git'

    describe '#chart', ->
      it 'gives back words and cords', () ->
          expect(word.chart()).to.deep.equal [[0,0], [0,1], [0,2]]

    describe '#isWord', ->

      describe 'given it is a word', ->

        beforeEach ->
          word.dictionary =
            isWord: sinon.stub().returns(true)

        it 'gives back words and cords', () ->
            expect(word.isWord()).to.equal true

      describe 'given it is not a word', ->

        beforeEach ->
          word.dictionary =
            isWord: sinon.stub().returns(false)

        it 'gives back words and cords', () ->
            expect(word.isWord()).to.equal false

    describe '#isPossible', ->

      describe 'given it is a prefix', ->

        beforeEach ->
          word.dictionary =
            isWordPrefix: sinon.stub().returns(true)

        it 'is a prefix', () ->
            expect(word.isPossible()).to.equal true

      describe 'given it is not a prefix but is a word', ->

        beforeEach ->
          word.dictionary =
            isWord: sinon.stub().returns(true)
            isWordPrefix: sinon.stub().returns(false)

        it 'is a prefix', () ->
            expect(word.isPossible()).to.equal true

      describe 'given it is not a prefix and not a word', ->

        beforeEach ->
          word.dictionary =
            isWord: sinon.stub().returns(false)
            isWordPrefix: sinon.stub().returns(false)

        it 'is a prefix', () ->
            expect(word.isPossible()).to.equal false

    describe '#toJson', ->
      it 'gives back words and cords', () ->
          expect(word.toJson()).to.deep.equal {
            word: 'git',
            chart: [[0,0], [0,1], [0,2]]
          }
