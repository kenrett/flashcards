class Card
  attr_accessor :definition, :ans

  def initialize(args)
    @definition = args[:definition]
    @ans        = args[:ans]
  end

  def is_answer?(input)
    ans == input
  end
end


class Deck
  attr_accessor :cards

  def initialize(args = {})
    @cards = args.fetch(:cards, [])
  end
end


class Parser
  @@deck = Deck.new

  def self.load(filename)
    text = []
    File.foreach(filename) { |row| text << row.chomp }
    
    text.each_slice(3) do |row|
      @@deck.cards << Card.new(definition: row[0], ans: row[1])
    end

    @@deck.cards.shuffle!
  end

end

#Driver Code

# file = 'flashcard_samples.txt'
# deck = Parser.load(file)
