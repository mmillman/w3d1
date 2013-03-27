require_relative 'piece'

class Board

  OFFSETS = [[-1, -1],
             [ 0, -1],
             [ 1, -1],
             [-1,  0],
             [ 1,  0],
             [-1,  1],
             [ 0,  1],
             [ 1,  1]]

  def self.new_board
    board = Array.new(8) { Array.new(8) }
    board[3][3, 2] = [Piece.new(:white), Piece.new(:black)]
    board[4][3, 2] = [Piece.new(:black), Piece.new(:white)]
    board
  end

  def initialize(board = Board.new_board)
    @board = board #why is a board object being initialized to a board object??
  end

  def new_piece(color)
    Piece.new(color)
  end

  def set_piece(piece, coord)
    @board[coord[0]][coord[1]] = piece
    # @board[*coord] = piece # why doesn't this work?
  end

  def valid_move?(color, coord)
    return false if off_board?(coord) || self[*coord].is_a?(Piece)
    return false if adjacent_squares(coord).all?(&:nil?)

  end

  def coords_to_flip(piece, coord)
    coords_to_flip = []

    OFFSETS.each do |offset|
      current_coord = coord
      loop do
        current_coord = next_coord(current_coord, offset)
        break if off_board?(current_coord)
        p current_coord
        content = self[*current_coord]
        current_color = content.is_a?(Piece) ? content.color : nil
        break if [piece.color, nil].include?(current_color)

        coords_to_flip << current_coord
      end
    end

    p coords_to_flip
    coords_to_flip
  end

  def adjacent_squares(coord)
    OFFSETS.map do |offset|
      neighbor = next_coord(coord, offset)
      self[*neighbor]
    end
  end

  def next_coord(coord, offset) # GET BETTER NAME
    [coord[0] + offset[0], coord[1] + offset[1]]
  end

  def off_board?(coord)
    coord.any? { |x| !x.between?(0, @board.length - 1) }
  end

  def [](*coord)
    @board[coord[0]][coord[1]]
  end

  def []=(*coord, value)
    @board[coord[0]][coord[1]] = value
  end


end