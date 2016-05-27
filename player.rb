class Player
  attr_accessor :score
  attr_accessor :lives
  attr_accessor :name

  def initialize
    @score = 0
    @lives = 0
    @name = ""
  end


  def get_name(num)
    puts "Player#{num}, what is your name?"
    @name = gets.chomp.strip.capitalize
    puts "thanks #{@name}!"
  end
end
