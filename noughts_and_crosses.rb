class Player
  attr_accessor :symbol
  attr_reader :id
  def initialize (symbol, id)
    @symbol = symbol
    @id = id
  end
end