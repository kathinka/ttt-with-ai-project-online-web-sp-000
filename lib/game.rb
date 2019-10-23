require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2, :cells, :human

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]

 def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board= Board.new)
  @board = board
  @player_1 = player_1
  @player_2 = player_2
 end

  def current_player
    @board.turn_count % 2  == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      @board.cells[win_combo[0]] == @board.cells[win_combo[1]] &&
      @board.cells[win_combo[1]] == @board.cells[win_combo[2]] &&
      (@board.cells[win_combo[0]] == "X" || @board.cells[win_combo[0]] == "O")
    end
  end


  def draw?
    !won? && @board.full?
  end

  def over?
    won? || draw?

  end

  def winner
#binding.pry
    if win_combo = won?
      @winner = @board.cells[win_combo.first]
    end
  end

  def turn
    if current_player == player_1
      @player_1.move(board)
    else
      @player_2.move(board)
    #end
      if board.valid_move?(idx)
        binding.pry
        board.update(idx, player)
        board.display
        else
        turn
      end
    end
end


#def turn
  #  puts "Please enter 1-9:"
  #  input = gets.strip
  #  index = input_to_index(input)
#    if valid_move?(index)
#      move(index,current_player)
#      display_board
#    else
#     turn
#    end
#  end


end
