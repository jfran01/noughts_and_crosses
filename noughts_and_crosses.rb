class Game 
  @@players = []
  
  def initialize 
    @player_one = Player.new("noughts", 1)
    @player_two = Player.new("crosses", 2)
    @current_player = @player_one
    @board = Array.new(9)
    @@players.push(@player_one, @player_two)
  end
end

class Player
  attr_accessor :symbol
  attr_reader :id
  def initialize (symbol, id)
    @symbol = symbol
    @id = id
  end
end
