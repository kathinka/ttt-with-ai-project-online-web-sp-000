require 'pry'
module Players
  class Human < Player

    def move(board)
      puts "Where do you want to move? (1-9)"
      gets.strip

    end
  end
end
