require 'colorize'
require_relative 'player'
require_relative 'question'

@player1 = Player.new
@player2 = Player.new

def get_names()
  print "Player1, what is your name: ".light_white
  @player1.name = gets.chomp.strip.capitalize
  puts "Thanks #{@player1.name}!"
  puts ""
  print "Player2, what is your name: ".light_white
  @player2.name = gets.chomp.strip.capitalize
  puts "Thanks #{@player2.name}, lets get started!"
end


def clear()
  100.times { puts '' }
end

def prep_round()
  @player1.lives = 3
  @player2.lives = 3
end

def play_round()
  while @player1.lives > 0 && @player2.lives > 0
    clear
    question = Question.new
    puts "Ok, #{@player1.name}, You have #{@player1.lives} lives left. Answer this question".light_white
    question.puts_question
    unless question.check_answer(gets.chomp.strip)
      @player1.lives -= 1
      puts "Incorrect".red
      sleep(2)
    else
      puts "Correct".green
      sleep(2)
    end
    clear
    question = Question.new
    puts "Ok, #{@player2.name}, You have #{@player2.lives} lives left. Answer this question".light_white
    question.puts_question
    unless question.check_answer(gets.chomp.strip)
      @player2.lives -= 1
      puts "Incorrect".red
      sleep(2)
    else
      puts "Correct".green
      sleep(2)
    end
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
  get_names()
  begin
    play_game()
  end while play_again?
  puts "Ok, bye!"
end

play_rounds

