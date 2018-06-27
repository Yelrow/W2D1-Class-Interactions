require 'colorize'
require_relative 'cursor'
require_relative 'board'
require_relative 'slidingpiece'
require_relative 'piece'

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def move_cursor
    while true
      render
      @cursor.get_input
      system("clear")
    end
  end

  def render
    (0..7).each do |row_idx|
    puts "_______________________________________"
    puts print_row(row_idx)
    end
    puts "_______________________________________"
  end

  def print_row(row_idx)
    cursor = @cursor.cursor_pos
    display = ''

    (0..7).each do |col_idx|
      pos = [row_idx, col_idx]
      piece  = @board[pos]

      if piece != nil
        if pos == cursor
          display += "| #{piece.symbol} |".colorize(:red)
        else
          display += "| #{piece.symbol} |"
        end
      else
        if pos == cursor
          display += "|   |".colorize(:red)
        else
          display += "|   |"
        end
      end
    end

    display
  end

end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  #bishop = board[[4,4]]
  #p bishop.moves(bishop.pos)
  display = Display.new(board)
  display.render
end
