
class Player

  def initialize(name, lives)
    @name = name
    @lives = lives
  end

end

class Question
  attr_accessor :num1, :num2, :sum

  def initialize()
    @num1 = generate_random
    @num2 = generate_random
    @sum = total_sum
  end

  def generate_random
    rand(1..20)
  end

  def total_sum
    self.num1 + self.num2
  end

  def prompt
    puts "What does #{num1} plus #{num2} equal?"
  end

  def new_question
    num1 = generate_random
    num2 = generate_random
    sum = total_sum
  end

end

class Turn
  attr_accessor :
  def initialize()
    @player_ask
    @player_ans
    @answer
  end

  def get_answer()

  end

end


player1 = Player.new("Player 1", 3)
player2 = Player.new("Player 2", 3)
question = Question.new()
