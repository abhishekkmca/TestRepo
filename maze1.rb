class RatInMaze
  def initialize(maze, n)
    @maze = maze 
    @n = n
    @board = Array.new(n) { Array.new(n, false) }
  end

  def solve
    if find_path(0, 0, "down") then print_board else puts "NO PATH FOUND" end
  end

  def find_path(row, col, direction)
    @board[row][col] = true
    return true if row == @n-1 and col == @n-1
    variantions = [[1,0,'down','up'],[0,1,'right','left'],[-1,0,'up','down'],[0,-1,'left','right']]
    variantions.each do |var_row, var_col, new_direction, opposite|
      if can_move?(row+var_row, col+var_col)
        return true if direction != opposite && find_path(row+var_row, col+var_col, new_direction)
      end  
    end
    @board[row][col] = false
  end
  
  def can_move?(row, col)
    row.between?(0,@n-1) and col.between?(0,@n-1) and @maze[row][col] != 0
  end
  
  def print_board
    puts "Board:"
    @board.each do |row|
      row.each do |value|
        print value ? 'R' : '.'
      end
      puts
    end
  end
  
end


n = 5
maze = [ [ 1, 0, 1, 1, 1 ], 
         [ 1, 1, 1, 0, 1 ],
         [ 0, 1, 1, 1, 1 ], 
         [ 0, 0, 1, 1, 0 ],
         [ 0, 0, 0, 1, 1 ]]
r = RatInMaze.new(maze, n)
r.solve