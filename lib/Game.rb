class Game 
  @@players = []
  attr_accessor :board, :current_player
  
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
    puts "Enter a number (1-9):"
    @current_player.assign_cell(@board)
    self.make_groups
    self.render_board
    self.check_for_winner
    self.switch_players
  end

  def make_groups 
    @rows = []
    @groups = []
    self.board.each_slice (3) do |row|
      @rows.push(row)
      @groups.push(row)
    end
    self.board[0..2].each_with_index do |cell, index|
      column = [cell, self.board[index + 3], self.board[index + 6]]
      @groups.push(column)
    end
    @groups.push(self.board.values_at(0, 4, 8))
    @groups.push(self.board.values_at(2, 4, 6))
  end

  def render_board
    board_interface = []
    @rows.each do |row|
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

  def check_for_winner
    @groups.each do |group|
      if group.all?
        if group.uniq.length == 1
          self.declare_winner
        end
      end
    end
  end

  def declare_winner 
    @winner = self.current_player
    puts "Hurrah! We have a winner! Well done Player #{@winner.id}"
    exit
  end

  def switch_players
    @@players.rotate!
    @current_player = @@players[0]
  end
end
