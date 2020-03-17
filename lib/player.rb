class Player
attr_reader :token
#new
attr_accessor :piece, :enemy

X_MARKER = 'X'
O_MARKER = 'O'

def initialize (token)
  @playerPiece = token
  @enemy = token == X_MARKER ? O_MARKER : X_MARKER
  end

#  def initialize(token)
#  @token = token
#  end

end
