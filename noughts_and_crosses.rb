class Game 
  @@players = []
  
  def initialize 
    @player_one = Player.new("noughts", 1)
    @player_two = Player.new("crosses", 2)
    @current_player = @player_one
    @board = Array.new(9)
    @@players.push(@player_one, @player_two)
  end

  def switch_players
    @@players.rotate!
    @current_player = @@players[0]
  end

  def round
    puts "Player #{@current_player.id} (#{@current_player.symbol}) - it's your turn to pick a cell!"
    puts "Enter a number:"
    chosen_cell = gets().chomp.to_i
    @current_player.assign_cell(@board, chosen_cell)
    puts @board
    self.switch_players
  end
end

class Player
  attr_accessor :symbol
  attr_reader :id
  def initialize (symbol, id)
    @symbol = symbol
    @id = id
  end

  def assign_cell (board, cell)
    if !board[cell] 
      if @symbol == "noughts"
        board[cell] = "O"
      elsif @symbol == "crosses"
        board[cell] = "X"
      end
    else 
      puts "Hmmm Cell #{cell} seems to be taken- try somewhere else"
      chosen_cell = gets().chomp.to_i
      assign_cell(board, chosen_cell)
    end
  end
end

new_game = Game.new()
4.times do 
  new_game.round
end