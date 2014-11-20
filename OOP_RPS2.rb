#class Player to model any one who is playing the game
#class Human to model user
#class Computer to model
#class Game to model the gaming process

class Player
  attr_reader :name
  attr_accessor :choice

  def initialize(name)
    @name = name
  end
end

class Human < Player
  def pick_hand
    begin
      puts "Pick your choice: (R/P/S)"
      user_input = gets.chomp.downcase
    end while !['r','p','s'].include?(user_input)
    self.choice = user_input
  end
end

class Computer < Player
  def pick_hand
    choice = PRS::CHOICES.keys.sample
  end
end

class PRS
  CHOICES = {'r' => 'Rock', 'p' => 'Paper', 's' => 'Scissors'}
  attr_accessor :player_choice, :computer_choice, :msg

  def initialize
    @human = Human.new("Eugene")
    @computer = Computer.new("Matrix")
  end

  def intro
    puts "Lets play Paper Rock Scissors!"
  end

  def compare(player, computer) #determine which player wins
    if player == computer
      self.msg = "It's a tie!"
    elsif (player == 'r' && computer == 'p') || (player == 'p' && computer == 's') || (player == 's' && computer == 'r')
      self.msg = "You lose!"
    else
      self.msg = "You win!"
    end
  end

  def print_result(player_choice, computer_choice, msg)
    puts "You choose #{CHOICES.fetch(player_choice)}, the computer choose #{CHOICES.fetch(computer_choice)}, #{msg}" #print out message to user
  end

  def replay #ask if player wants to play again
    begin
      puts "Play Again? (Y/N)"
      user_input = gets.chomp.downcase
    end while !['y','n'].include?(user_input)
    if user_input == 'y'
      PRS.new.play
    elsif user_input == 'n'
      puts "Thank you for playing!"
      puts "This game is created by Eugene Chang a.k.a ToxicStar, 2014"
      exit
    end #end if
  end #end replay

  def play
    intro
    self.player_choice = @human.pick_hand
    self.computer_choice = @computer.pick_hand
    result = compare(player_choice, computer_choice)
    print_result(player_choice, computer_choice, result)
    replay
  end

end

game = PRS.new.play
