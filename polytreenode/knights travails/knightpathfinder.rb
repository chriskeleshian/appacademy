require "byebug"

class KnightPathFinder

  def initialize(pos)
    @root_node = pos
    self.build_move_tree
    @considered_positions = pos
   end

  def find_path(end_pos)
    
  end
  
  def build_move_tree
    queue = Array.new
    queue << @root_node
    until queue.empty?
      start_pos = queue.shift
      queue.concat(new_move_positions(start_pos))
    end 
  end

  def valid_moves (pos)
    moves = []
    moves << [pos[0]+1,pos[1]+2]
    moves << [pos[0]+2,pos[1]+1]
    moves << [pos[0]+2,pos[1]-1]
    moves << [pos[0]+1,pos[1]-2]
    moves << [pos[0]-1,pos[1]+2]
    moves << [pos[0]-2,pos[1]+1]
    moves << [pos[0]-2,pos[1]-1]
    moves << [pos[0]-1,pos[1]-2]
    moves.select! { |move| move.all? { |coord| coord >= 0 && coord <= 7 }}
    moves
  end

  def new_move_positions (pos)
    new = self.valid_moves(pos).select {|move| @considered.positions.none?(move) }
    @considered_positions.concat(new)
  end

end
