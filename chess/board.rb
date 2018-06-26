require_relative 'piece'
require_relative 'display'
require 'colorize'

class Board
  attr_reader :board
  
  def initialize
    @board = Array.new(8){[]}
    
    8.times do |row|
      8.times do |col|
        if row < 2 || row > 5
          @board[row][col] = Piece.new
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