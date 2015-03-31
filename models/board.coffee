Node = require('./node')

class Board

  joined: false

  constructor: (@pieces) ->

  find_words: (points) ->
    @join() unless @joined
    best = []
    for point in points
      words = @pieces[point[0]][point[1]].iterate()
      best.push word if word.isWord() for word in words
    best

  join: ->
    @joined = true
    for r,row of @pieces
      r = parseInt(r, 10)
      for c,letter of row
        c = parseInt(c, 10)
        @pieces[r][c] = new Node(letter, r, c)

        if @pieces[r][c-1]
          @pieces[r][c].sibs.left = @pieces[r][c-1]
          @pieces[r][c-1].sibs.right = @pieces[r][c]

        if @pieces[r-1]
          @pieces[r][c].sibs.up = @pieces[r-1][c]
          @pieces[r-1][c].sibs.down = @pieces[r][c]

          if @pieces[r-1][c+1]
            @pieces[r][c].sibs.top_right = @pieces[r-1][c+1]
            @pieces[r-1][c+1].sibs.bottom_left = @pieces[r][c]

          if @pieces[r-1][c-1]
            @pieces[r][c].sibs.top_left = @pieces[r-1][c-1]
            @pieces[r-1][c-1].sibs.bottom_right = @pieces[r][c]

module.exports = Board
