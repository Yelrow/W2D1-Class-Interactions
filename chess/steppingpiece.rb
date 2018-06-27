module SteppingPiece
  HORIZONTAL_DIRS = [[0, -1], [0, 1], [-1, 0], [1, 0]]
  DIAGONAL_DIRS = [[1,1], [-1,-1], [1, -1], [-1, 1]]
  KNIGHT_DIRS = [[-2, 1], [-1, 2], [1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1]]

  def moves

    possible_moves = []

    move_dirs.each do |direction|
      cur_pos = new_pos(pos.dup, direction)
      possible_moves << cur_pos unless blocked(cur_pos)
    end

    possible_moves
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

  def move_dirs
    raise NotImplementedError
  end

  def knight_dirs
    KNIGHT_DIRS
  end

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end
end
