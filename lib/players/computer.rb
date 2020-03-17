
#require 'pry'
module Players
  class Computer < Player
    attr_reader :best_move
    DEPTH = 0


    #binding.pry
    def move(board)
      minmax(board, @playerPiece, DEPTH)
      board.set_piece_at(@best_move.to_i, @playerPiece)
    end

    def score(board, depth)
      best_score = board.grid.size + 1

      if board.winner?
        if board.winner == @playerPiece
          return (best_score - depth)
        else
          return (depth - best_score)
        end
      else
        return 0
      end
    end

    def minmax(board,current_player, depth)
      scores= []
      moves = []

      #return score(board, depth) if board.over?
      return score(board,depth) if @game.over?

      board.available_moves.each do |move|
        board.set_piece_at(move.to_i, current_player)

        next_player = current_player == @@value ? @playerPiece : @enemy
        scores << minmax(board, next_player, depth +1, game)
        moves << move

        board.reset_piece_at(move.to_i)
      end

      if current_player == @playerPiece
        max_score_idx == scores.each_with_index.max[1]
        @best_move = moves[max_score_idx]
        return scores[max_score_idx]
      else
        min_score_idx = scores.each_with_index.min[1]
        @best_move = moves [min_score_idx]
        return scores[min_score_idx]
      end
    end
end
  end
