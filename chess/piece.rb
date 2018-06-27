require_relative 'slidingpiece'
require_relative 'steppingpiece'
require 'Singleton'

class Piece

  attr_reader :color, :board
  attr_accessor :pos

  def initialize(color, pos, board)
    @color = color
    @pos = pos
    @board = board
  end

  def moves

  end
end

class RookPiece < Piece
  include SlidingPiece

  attr_reader :symbol

  def initialize(color, pos, board)
    super(color, pos, board)
    @symbol = :rook
  end

  def move_dirs
    horizontal_dirs
  end

end

class BishopPiece < Piece
  include SlidingPiece

  attr_reader :symbol

  def initialize(color, pos, board)
    super(color, pos, board)
    @symbol = :bishop
  end

  def move_dirs
    diagonal_dirs
  end

end

class QueenPiece < Piece
  include SlidingPiece

  attr_reader :symbol

  def initialize(color, pos, board)
    super(color, pos, board)
    @symbol = :queen
  end

  def move_dirs
    diagonal_dirs + horizontal_dirs
  end

end

class KingPiece < Piece
  include SteppingPiece

  attr_reader :symbol

  def initialize(color, pos, board)
    super(color, pos, board)
    @symbol = :king
  end

  def move_dirs
    diagonal_dirs + horizontal_dirs
  end

end

class KnightPiece < Piece
  include SteppingPiece
  attr_reader :symbol

  def initialize(color, pos, board)
    super(color, pos, board)
    @symbol = :knight
  end

  def move_dirs
    knight_dirs
  end

end

class PawnPiece < Piece
  attr_reader :symbol

  def initialize(color, pos, board)
    super(color, pos, board)
    @symbol = :pawn
  end

  def move_dirs
    row, col = pos
    possible_moves = [[row + forward_dir, col]]

    possible_moves.select! do |move|
      board.valid_pos?(move)
    end
    possible_moves << [row + forward_dir, col + 1] if board[[row + forward_dir, col + 1]].color != color
    possible_moves << [row + forward_dir, col - 1] if board[[row + forward_dir, col + 1]].color != color
    possible_moves << [row + 2 * forward_dir, col] if start_pos?

  end

  def forward_dir
    if color == :white
      return 1
    else
      return -1
    end
  end

  def start_pos?
    row, col = pos
    return true if row == 1 && color == :white
    return true if row == 6 && color == :black
    false
  end

end


class NullPiece
  include Singleton

 attr_reader :color, :symbol

end
