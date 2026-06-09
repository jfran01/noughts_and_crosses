class Player
  attr_accessor :symbol
  attr_reader :id
  def initialize (symbol, id)
    @symbol = symbol
    @id = id
  end

  def assign_cell (board)
    cell = gets().chomp.to_i - 1
    if cell < 0 || cell > 8
      puts "Cell #{cell + 1} doesn't exist... let's try that again"
      puts "Enter a number (1-9):"
      assign_cell(board)
    elsif !board[cell] 
      board[cell] = self.symbol
    else 
      puts "Hmmm Cell #{cell + 1} seems to be taken- try somewhere else"
      puts "Enter a number (1-9):"
      assign_cell(board)
    end
  end
end
