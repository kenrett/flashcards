require_relative 'models'

class Interface
  attr_reader :deck

  INSULTS = [ "Yo mama is so fat that her bellybutton gets home 15 minutes before she does.",
              "Yo mama is so fat that when she was diagnosed with a flesh-eating disease, the doctor gave her ten years to live.",
              "Yo mama is so fat that the National Weather Service names each one of her farts.",
              "Yo mama is so fat that when she wears a yellow raincoat, people yell 'taxi!'",
              "Yo mama is so fat that she sat on a dollar and squeezed a booger out of George Washington's nose.",
              "Yo mama is so fat that when she gets in an elevator, it has to go down.",
              "Yo mama is so fat that when her beeper goes off, people think she's backing up.",
              "Yo mama is so fat that she has to iron her pants on the driveway.",
              "Yo mama is so fat that she left the house in high heels and came back wearing flip flops.",
              "Yo mama is so fat that people jog around her for exercise.",
              "Yo mama is so fat that she was floating in the ocean and Spain claimed her for the New World.",
              "Yo mama is so fat that when she walked in front of the TV, I missed 3 seasons of Seinfeld.",
              "Yo mama is so fat that you have to grease the door frame and hold a twinkie on the other side just to get her through!",
              "Yo mama is so fat that that when she sits on the beach, Greenpeace shows up and tries to tow her back into the ocean...",
              "Yo mama is so fat that when she bungee jumps, she brings down the bridge too.",
              "Yo mama is so fat that when she talks to herself, it is a long distance call.",
              "Yo mama is so fat that the last time she saw 90210, it was on a scale.",
              "Yo mama is so fat that light bends around her." ]

  def initialize(file)
    @deck = Parser.load(file)  
  end 

  def get_input
    puts "\nPlease enter an answer:"
    gets.chomp
  end

  def right_answer
    puts "Lucky guess, Correct!\n\n"
  end

  def run
    
  string = <<-EOD
 __     __     __  __                       _       _        _       _       
 \\ \\   / /    |  \\\/  |                     ( )     | |      (_)     (_)      
  \\ \\\_/ /__   | \\  / | __ _ _ __ ___   __ _|/ ___  | |_ _ __ ___   ___  __ _ 
   \\   / _ \\  | |\\\/| |/ _` | '_ ` _ \\ / _` | / __| | __| '__| \\ \\ / / |/ _` |
    | | (_) | | |  | | (_| | | | | | | (_| | \\\__ \\ | |_| |  | |\\ V /| | (_| |
    |_|\\\___/  |_|  |_|\\\__,_|_| |_| |_|\\\__,_| |___/  \\\__|_|  |_| \\\_/ |_|\\\__,_|

    EOD
    puts string
                                                                           
    @deck.each do |card| 
      puts "<<<<<<<<Definition>>>>>>>>> \n#{card.definition}"
      response = get_input
      
      @guesses = 1
      until response == card.ans || @guesses == 3
        
        if response == "exit"
          puts "Even though you're a terrible person, thanks for playing."
          exit
        else 
          p INSULTS.sample
          response = get_input
          @guesses += 1
          if @guesses == 3 && response != card.ans
            puts "The answer is '#{card.ans}', idiot!\n\n"
          end
        end
        
      end
      if response == card.ans
        right_answer
      end
    end
  end
end


new_game = Interface.new('flashcard_sample.txt')
new_game.run


