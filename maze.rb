class Node
	def initialize(x,y,step)
		@x=x
		@y=y
		@step=step
	end

	public

	def getX
		@x
	end
	def getY
		@y
	end
	def getStep
		@step
	end
end


class RatInMaze
  def initialize(maze, n)
    @maze = maze 
    @n = n
    @board = Array.new(n) { Array.new(n, false) }
    @xmove=[1,0,-1,0]
  	@ymove=[0,1,0,-1]
  end

  def solve(s_x,s_y,d_x,d_y)
  	step = find_path(s_x,s_y,d_x,d_y)
    if step != -1
    	puts "Found in #{step} steps"
    else 
    	puts "NO PATH FOUND" 
    end
  end

  def find_path(row, col, destRow,  destCol)

  		
	    queue = Queue.new

	    queue << Node.new(row,col,0)

	    @board[row][col] = true


	    while !queue.empty? do 
     				
     		node = queue.pop
     		
	    	x = node.getX
	   		y = node.getY
	    	step = node.getStep

	    	if x==destRow && y== destCol
	   			return (step)
	   		end

			index=0
			begin
				posx = x + @xmove[index]
	   			posy = y + @ymove[index]
	    		if  can_move?(posx,posy)
	    			queue  << Node.new(posx,posy,step+1) 
	    			@board[posx][posy] = true
	    		end
				index +=1
			end while (index<4)
	    end
	    return -1
  	end

  def can_move?(row, col)
    row.between?(0,@n-1) and col.between?(0,@n-1) and @maze[row][col] != '0' and @board[row][col] == false
  end
  
  def print_board
    puts "Board:"
    @maze.each do |row|
      row.each do |value|
        print value + " " 
      end
      puts
    end
    puts
  end
  
end


n = 6
maze = [ 
		 	[ '1', '0', '1', '1', '1', '1'], 
         	[ '1', '2', '1', '0', '1', '0'],
         	[ '0', '0', '0', '1', '1', '1'], 
         	[ '0', '0', '0', '1', '0', '1'],
         	[ '0', '0', '0', '3', '1', '1'],
         	[ '0', '0', '0', '1', '1', '1']
       ]


r = RatInMaze.new(maze, n)
r.print_board
r.solve(1,1,4,3)

# n = 3
# maze = [ 
# 		 	[ '1', '0', '1'], 
#          	[ '1', '2', '1'],
#          	[ '0', '0', '3']
#        ]


# r = RatInMaze.new(maze, n)
# r.print_board
# r.solve(1,1,2,2)