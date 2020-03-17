require "pry"

class Board
  attr_accessor :cells, :grid, :size
  attr_reader :token

  def initialize 
    reset!
    @size = 9
    @grid =('1'..size.to_s).to_a
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def position(idx)
    cells[idx.to_i-1]
  end

  def full?
    cells.include?(" ") ? false : true
  end

  def turn_count
    cells.count{ |pos| pos != " "}
  end

  def taken?(idx)
    cells[idx.to_i-1] =="X" || cells[idx.to_i-1] =="O"
  end

  def valid_move?(idx)
    idx.to_i.between?(1,9) && !taken?(idx)
  end

  def update(idx, player)
      cells[idx.to_i-1]=(player.token)
  end

#new
  def available_moves
    grid.reject {|piece| piece == "X" || piece == "O"}
  end

  def get_piece_at (location)
    grid[location -1]
  end

  def set_piece_at (location, piece)
    grid[location -1] = piece
  end

  def reset_piece_at(location)
    grid[location - 1] = location.to_s
  end



end
