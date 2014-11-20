class Choice

  attr_accessor :msg

  def initialize
    @choice = {'r' => 'Rock', 'p' => 'Paper', 's' => 'Scissors'}
    @num2choice = {1 => 'r', 2 => 'p', 3 => 's'}
    @msg = ""
  end

  def rand2choice
    word = @num2choice.fetch(rand(1..3))
    @choice.fetch(word)
  end

  def choice2word(str)
    @choice.fetch(str)
  end

  def print_result(player_choice, computer_choice, msg)
    puts "You choose #{player_choice}, the computer choose #{computer_choice}, #{msg}" #print out message to user
  end

  def compare(player, computer)

    if player == computer
      self.msg = "It's a tie!"
    end

    if player == "Rock"
      if computer == "Paper"
        self.msg = "You lose!"
      elsif computer == "Scissors"
        self.msg = "You won!"
      end
    elsif player == "Paper"
      if computer == "Rock"
        self.msg = "You won!"
      elsif computer == "Scissors"
        self.msg = "You lose!"
      end
    elsif player == "Scissors"
      if computer == "Rock"
        self.msg = "You lose!"
      elsif computer == "Paper"
        self.msg = "You won!"
      end
    end

    print_result(player, computer, @msg)
  end #end compare method

end #end class Choice


#-------------------------Main program starts here-----------------------------------
begin
  puts "Lets play Paper Rock Scissors!"

  game = Choice.new

  begin
    puts "Choose one: (P/R/S)"
    user_input = gets.chomp
  end while !['r','p','s'].include?(user_input.downcase)

  player_choice = game.choice2word(user_input.downcase)
  computer_choice = game.rand2choice
  game.compare(player_choice, computer_choice)

  begin
    puts "Play Again? (Y/N)"
    user_input = gets.chomp
  end while !['y','n'].include?(user_input.downcase)

end while user_input.downcase != 'n'
