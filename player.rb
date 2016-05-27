class Player
  attr_accessor :score
  attr_accessor :lives
  attr_accessor :name

  def initialize
    @score = 0
    @lives = 0
    @name = 0
  end

  def ask_question(question)
    puts "Ok, #{@score}, you have #{@lives} lives left. Answer this question.".light_white
    print question
    unless question.check_answer(gets.chomp.strip)
      @lives -= 1
      puts "Incorrect".red
    else
      puts "Correct".green
    end
    sleep(2)
  end

  def get_name()
    puts 'Player1, what is your name?'
    @name = gets.chomp.strip.capitalize
    puts "thanks #{@name}!"
  end
end
