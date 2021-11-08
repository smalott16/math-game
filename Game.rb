require './Player'

class Game
  attr_accessor :player1, :player2, :winner, :turn
  def initialize 
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @winner = false
    @turn = 1
  end

  #main game loop
  def play_game
    while !self.winner
      puts "---- NEW TURN ----" unless self.turn < 2
      if self.turn % 2 == 0
        current_player = self.player2
        oposition = self.player1
      else
        current_player = self.player1
        oposition = self.player2
      end
      ask_question(current_player, oposition)
      self.turn += 1
    end
    puts "----GAME OVER----"
    puts "Good bye!"
  end

  #generate question, call every turn, update winner/loser
  def ask_question(player, oposition)
    
    num1 = rand(1..20)
    num2 = rand(1..20)
    puts "#{player.name}: What does #{num1} plus #{num2} equal?"
    print ">"
    answer = $stdin.gets.chomp.to_i
   
    #check answer and declare a winner if someone loses all their lives
    player.lose_life if answer != (num1 + num2) 
    self.winner = true if player.lives == 0
    print_result(answer == (num1 + num2), player, oposition)
  end

  ##run every turn to output results to the screen
  def print_result(result, player, oposition)
    if result
      puts "#{player.name}: YES! you are correct"
    else 
      puts "#{player.name}: Seriously? No!"
    end

    if self.winner
      puts "#{oposition.name} wins with a score of #{oposition.lives}/3"
    else
      puts "P1: #{self.player1.lives}/3 vs P2: #{self.player2.lives}/3"
    end

  end
  
end