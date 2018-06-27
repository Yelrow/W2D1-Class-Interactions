require 'byebug'

module SlidingPiece

  HORIZONTAL_DIRS = [[0, -1], [0, 1], [-1, 0], [1, 0]]
  DIAGONAL_DIRS = [[1,1], [-1,-1], [1, -1], [-1, 1]]

  def moves
    #LOGIC GOES HERE FOR POPULATING HORIZONTAL_DIRS AND DIAGONAL_DIRS
    possible_moves = []

    move_dirs.each do |direction|
      cur_pos = new_pos(pos.dup, direction)
      until blocked(cur_pos)
        possible_moves << cur_pos unless blocked(cur_pos)
        cur_pos = new_pos(cur_pos,direction)
      end
    end
    possible_moves.sort
  end

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def move_dirs
    raise NotImplementedError
  end

  def new_pos(cur_pos, direction)
    cur_pos = cur_pos.dup
    # print "cur_pos #{cur_pos}"
    cur_row, cur_col = cur_pos
    row_dir, col_dir = direction
    #add directions to current position
    new_row = cur_row + row_dir
    new_col = cur_col + col_dir
    cur_pos = [new_row, new_col]
  end

  def blocked(cur_pos)
    !board.valid_pos?(cur_pos) || board[cur_pos] != nil
  end

end
