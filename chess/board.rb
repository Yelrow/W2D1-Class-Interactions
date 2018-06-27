require_relative 'piece'
require_relative 'display'
require 'colorize'
require_relative 'slidingpiece'

class Board
  attr_reader :board

  def initialize
    @board = Array.new(8){[]}

    8.times do |row|
      8.times do |col|
        if row == 0 && col == 0 || row == 0 && col == 7
          @board[row][col] = RookPiece.new(:white, [row, col], self)
        elsif row == 0 && col == 1 || row == 0 && col == 6
          @board[row][col] = KnightPiece.new(:white, [row,col], self)
        elsif row == 0 && col == 2 || row == 0 && col == 5
          @board[row][col] = BishopPiece.new(:white, [row,col], self)
        elsif row == 0 && col == 3
          @board[row][col] = QueenPiece.new(:white, [row,col], self)
        elsif row == 0 && col == 4
          @board[row][col] = KingPiece.new(:white, [row,col], self)
        elsif row == 1
          @board[row][col] = PawnPiece.new(:white, [row, col], self)

        elsif row == 7 && col == 0 || row == 7 && col == 7
          @board[row][col] = RookPiece.new(:black, [row, col], self)
        elsif row == 7 && col == 1 || row == 7 && col == 6
          @board[row][col] = KnightPiece.new(:black, [row,col], self)
        elsif row == 7 && col == 2 || row == 7 && col == 5
          @board[row][col] = BishopPiece.new(:black, [row,col], self)
        elsif row == 7 && col == 3
          @board[row][col] = QueenPiece.new(:black, [row,col], self)
        elsif row == 7 && col == 4
          @board[row][col] = KingPiece.new(:black, [row,col], self)
        elsif row == 6
          @board[row][col] = PawnPiece.new(:black, [row, col], self)
        else
          @board[row][col] = nil
        end
      end
    end

  end

  def move_piece(start_pos, end_pos)
    if self[start_pos].nil?
      raise "There is no piece here!"
    elsif !valid_pos?(end_pos)
      raise "This move is off the board!"
    else
      self[start_pos],self[end_pos] = self[end_pos], self[start_pos]
    end
  end

  def valid_pos?(end_pos)
    row, col = end_pos
    row.between?(0,7) && col.between?(0,7)
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @board[row][col] = value
  end

end
