class Game 
  @@players = []
  attr_accessor :board
  
  def initialize 
    @player_one = Player.new("noughts", 1)
    @player_two = Player.new("crosses", 2)
    @current_player = @player_one
    @board = Array.new(9)
    @@players.push(@player_one, @player_two)
    self.game()
  end

  def game 
    until !self.board.any?(nil) || @winner
      self.round()
    end
  end

  def round
    puts "Player #{@current_player.id} (#{@current_player.symbol}) - it's your turn to pick a cell!"
    puts "Enter a number:"
    chosen_cell = gets().chomp.to_i - 1
    @current_player.assign_cell(@board, chosen_cell)
    self.render_board()
    self.switch_players
  end

  def render_board
    board_interface = []
    self.board.each_slice (3) do |row|
      row = row.map do |cell|
        if cell == "noughts"
          "O"
        elsif cell == "crosses"
          "X"
        else " "
        end
      end
      row = row.join(" | ")
      board_interface.push(row)
    end
    puts board_interface
  end

  def switch_players
    @@players.rotate!
    @current_player = @@players[0]
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
      board[cell] = self.symbol
    else 
      puts "Hmmm Cell #{cell + 1} seems to be taken- try somewhere else"
      chosen_cell = gets().chomp.to_i - 1
      assign_cell(board, chosen_cell)
    end
  end
end

Game.new()