
class Player
  attr_accessor :lives, :name

  def initialize(name, lives)
    @name = name #string
    @lives = lives # int
  end


  # what happens if answer is correct
  # def correct
  #   puts "You are correct"
  # end

  # what happens if answer is wrong
  def wrong
    self.lives -= 1
  end
end


# question class

class Question
  attr_accessor :int1, :int2

  def initialize
    @int1 = rand(1..20)
    @int2 = rand(1..20)
  end

  def answer
    @int1 + @int2
  end

  def check(val)
    self.answer == val
  end
end


# turn class
class Turn

  def initialize(player)
    @player = player
    @question = Question.new
  end

  # def question_string
  #   puts "What does #{@question.int1} plus #{@question.int2} equal?"
  # end
end





# Turn manager class

class TurnManager
  attr_accessor :players
  def initialize(players)
    @players = players
    @current = 0
  end

  def current_player
    @players[@current]
  end

  def next_turn
    @current += 1
    if (@current == @players.size)
      @current = 0;
    end
  end

end

# game class
class Game
  def initialize()
    @max_lives = 3
    @players= [Player.new("Player 1", 3), Player.new("Player 2", 3)]
    @turn_manager = TurnManager.new(@players)
    play
  end

  def new_turn
    if (!(@players[0].lives == @max_lives && @players[1].lives == @max_lives))
      puts "----- NEW TURN -----"
    end
  end


  def start_turn(question)
    puts "#{@turn_manager.current_player.name}: What does #{question.int1} plus #{question.int2} equal?"
  end

  def check_input(input, question)
    if (question.check(input))
      puts "#{@turn_manager.current_player.name}: YES! You are correct."
    else
      puts "#{@turn_manager.current_player.name}: Seriously? No!"
      @turn_manager.current_player.wrong
    end
  end

  def end_turn
    puts "P1: #{@players[0].lives}/#{@max_lives} vs P2: #{@players[1].lives}/#{@max_lives}"
    @turn_manager.next_turn
  end

  def end_game
    player_win = @players.detect { |player| player.lives != 0 }
    puts "#{player_win.name} wins with a score of #{player_win.lives}/#{@max_lives}"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

  def play
    while(not @players.any? {|player| player.lives <= 0})
      question = Question.new()
      new_turn
      start_turn(question)
      print "> "
      input = gets.chomp.to_i
      check_input(input, question)
      end_turn
    end
    end_game
  end



end


# players = [Player.new("Player 1", 3), Player.new("Player 2", 3)]
# turn_manager = TurnManager.new(players)
# turn_manager.next_turn
# puts turn_manager.players
# turn_manager.next_turn
# puts turn_manager.players

game = Game.new()

