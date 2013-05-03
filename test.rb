require_relative 'models'

class Interface
  attr_reader :deck

  INSULTS = ["You suck!", "You're stupid"]

  def initialize(file)
    Parser.new(file)  
  end 

  def get_input
    puts "Please enter an answer:"
    gets.chomp
  end

  def right_answer
    puts "Lucky guess, Correct!"
  end

  def run
    @deck = Parser.load(file) #check on filename
    
    @deck.each do |card| 
      puts "Definition: #{c.definition}"
      response = get_input
      
      case response
      when card.ans
        right_answer
      when "exit"
        puts "Even though you're a terrible person, thanks for playing."
        exit
      else 
        p INSULTS.sample
      end
    end
  end
end


new_game = Interface.new
new_game.run


