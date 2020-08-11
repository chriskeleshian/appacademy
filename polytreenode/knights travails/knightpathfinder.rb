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
     
  end

  def valid_moves
    moves = []
    moves << [@root_node[0]+1,@root_node[1]+2]
    moves << [@root_node[0]+2,@root_node[1]+1]
    moves << [@root_node[0]+2,@root_node[1]-1]
    moves << [@root_node[0]+1,@root_node[1]-2]
    moves << [@root_node[0]-1,@root_node[1]+2]
    moves << [@root_node[0]-2,@root_node[1]+1]
    moves << [@root_node[0]-2,@root_node[1]-1]
    moves << [@root_node[0]-1,@root_node[1]-2]
#    debugger
    moves.select! { |pos| pos.all? { |coord| coord >= 0 && coord <= 7 }}
    moves
  end

  def new_move_positions
    new = self.valid_moves.select {|move| @considered.positions.none?(move) }
    @considered_positions.concat(new)
  end

end
