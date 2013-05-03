class Card
  attr_accessor :def, :ans
  def initialize(args)
   
  end

  def is_answer?(input)
  end 
end

class Deck
  attr_accessor :cards
end

class Parser
  attr_reader :deck
end
