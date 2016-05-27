require 'colorize'
require_relative 'player'
require_relative 'question'

class Game

  def initialize
    @player1 = Player.new
    @player2 = Player.new
  end

  def clear()
    100.times { puts '' }
  end

  def play_round()
    while @player1.lives > 0 && @player2.lives > 0
      clear
      @player1.ask_question(Question.new)
      clear
      @player2.ask_question(Question.new)
    end
  end

  def assign_score()
    if @player1.lives > @player2.lives
      puts "Congratulations #{@player1.name} you won!".yellow
      @player1.score += @player1.lives
    elsif @player2.lives > @player1.lives
      puts "Congratulations #{@player2.name} you won!".yellow
      @player2.score += @player2.lives
    else
      puts "You tied"
    end
    puts "#{@player1.name} you have #{@player1.score} points!"
    puts "#{@player2.name} you have #{@player2.score} points!"
  end

  def play_game()
    sleep(2)
    prep_round()
    play_round()
    assign_score()
    sleep(2)
  end

  def play_again?()
    puts "#{@player1.name} and #{@player2.name}, do you want to play again? (y/n)".cyan
    input = gets.chomp.strip.downcase
    input.match /^y.*/i
  end

  def play_rounds()
    @player1.get_name
    @player2.get_name
    puts "Lets begin!"
    sleep 1
    begin
      play_game()
    end while play_again?
    puts "Ok, bye!"
  end

end

Game.new.play_rounds
