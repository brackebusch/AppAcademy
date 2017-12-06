class Board
  def self.default_grid
    Array.new(10){Array.new(10)}
  end

  attr_reader :grid

  def intialize(grid = self.class.default_grid)
    @grid = grid
  end
  
end
  