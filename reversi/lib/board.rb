require_relative 'piece'

class Board
  def self.new_board
    Array.new(8) { Array.new(8) }
  end

  def initialize(board = Board.new_board)
    @board = board #why is a board object being initialized to a board object??
  end

  def make_piece(color)
    Piece.new(color)
  end

  def set_piece(piece, coord)
    @board[coord[0]][coord[1]] = piece
    # @board[*coord] = piece # why doesn't this work?
  end

  def [](*coord)
    @board[coord[0]][coord[1]]
  end

  def []=(*coord, value)
    @board[coord[0]][coord[1]] = value
  end


end