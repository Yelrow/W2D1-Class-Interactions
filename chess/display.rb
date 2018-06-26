require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
  
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end
  
  def render
    8.times.each do |idx|
    p "--------------------"
    puts display_row(@board[idx])
    end
  end
  
  def display_row(row)
    display = ''
    row.each do |pos|
      if pos != nil
        display += "|  #{pos}  |"
      else
        display += "|  nil   |"
      end
    end 
  end
  
  
  
  
end