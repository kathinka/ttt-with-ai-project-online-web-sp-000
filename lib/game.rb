require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2, :cells

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
    if win_combo = won?
      @winner = @board.cells[win_combo.first]
    end
  end

  def turn
    idx = current_player.move(board)
      if board.valid_move?(idx)
        board.update(idx, current_player)
        board.display
        else
        turn
    end
  end

  def play
    #binding.pry
    until over?
      turn
    end
      if winner
        puts "Congratulations #{@winner}!"
      else
        puts "Cat's Game!"
    end
  end

def manVsComputer(player_1=Players::Human.new("X"), player_2=Players::Computer.new("O"), board= Board.new)
 @board = board
 @player_1 = player_1
 @player_2 = player_2
end

def computerVsMan(player_1=Players::Computer.new("X"), player_2=Players::Human.new("O"), board= Board.new)
 @board = board
 @player_1 = player_1
 @player_2 = player_2
end

def computerVsComputer(player_1=Players::Computer.new("X"), player_2=Players::Computer.new("O"), board= Board.new)
 @board = board
 @player_1 = player_1
 @player_2 = player_2
end

def call
input = ""
while input != 'exit'
  puts "Welcome to a game of Tic-tac-toe!"
  puts "To see the computer play against itself enter '0'."
  puts "To play a game against the computer enter '1'."
  puts "To play a game against a friend enter '2'."
  input = gets.strip.downcase
  case input
    when '2'
      Game.new(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board= Board.new)
      play
      #call
    when '1'
      puts "Who should go first and be 'X'?"
      puts "To choose computer type '1'."
      puts "To choose yourself type '2'."
      input2 = gets.strip.downcase
        if input2 =="1"
        computerVsMan
        play
        #call
        elsif input2 =="2"
        manVsComputer
        play
        #call
        end
    when '0'
      computerVsComputer
      play
      #call
    end
    call
  end
end
end
