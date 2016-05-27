require 'colorize'

@player1 = {name:"",lives:3,score:0}
@player2 = @player1.dup

def get_names()
  print "Player1, what is your name: ".light_white
  @player1[:name] = gets.chomp.strip.capitalize
  puts "Thanks #{@player1[:name]}!"
  puts ""
  print "Player2, what is your name: ".light_white
  @player2[:name] = gets.chomp.strip.capitalize
  puts "Thanks #{@player2[:name]}, lets get started!"
end

def get_question()
  {num_a: Random.rand(21), num_b: Random.rand(21), operator: Random.rand(5)}
end

def get_op_string(op_code)
  op_code == 0 ? '+' : op_code == 1 ? '-' : op_code == 2 ? '*' : op_code == 3 ? '/' : '%'
end

def puts_question(question)
  print "What is #{question[:num_a]} #{get_op_str(question[:operator])} #{question[:num_b]} = "
end

def get_answer(question)
  case question[:operator]
    when 0
      question[:num_a] + question[:num_b]
    when 1
      question[:num_a] - question[:num_b]
    when 2
      question[:num_a] * question[:num_b]
    when 3
      question[:num_a] / question[:num_b]
    else
      question[:num_a] % question[:num_b]
    end
end

def check_answer(question, answer)
  answer_num = answer.scan(/\d*/)[0].to_i
  get_answer(question) == answer_num
end

def clear()
  100.times { puts '' }
end

def prep_round()
  @player1[:lives] = 3
  @player2[:lives] = 3
end

def play_round()
  while @player1[:lives] > 0 && @player2[:lives] > 0
    clear
    question = get_question
    puts "Ok, #{@player1[:name]}, You have #{@player1[:lives]} lives left. Answer this question".light_white
    puts_question question
    unless check_answer(question, gets.chomp.strip)
      @player1[:lives] -= 1
      puts "Incorrect".red
      sleep(2)
    else
      puts "Correct".green
      sleep(2)
    end
    clear
    question = get_question
    puts "Ok, #{@player2[:name]}, You have #{@player2[:lives]} lives left. Answer this question".light_white
    puts_question question
    unless check_answer(question, gets.chomp.strip)
      @player2[:lives] -= 1
      puts "Incorrect".red
      sleep(2)
    else
      puts "Correct".green
      sleep(2)
    end
  end
end

def assign_score()
  if @player1[:lives] > @player2[:lives]
    puts "Congratulations #{@player1[:name]} you won!".yellow
    @player1[:score] += @player1[:lives]
  elsif @player2[:lives] > @player1[:lives]
    puts "Congratulations #{@player2[:name]} you won!".yellow
    @player2[:score] += @player2[:lives]
  else
    puts "You tied"
  end
  puts "#{@player1[:name]} you have #{@player1[:score]} points!"
  puts "#{@player2[:name]} you have #{@player2[:score]} points!"
end

def play_game()
  sleep(2)
  prep_round()
  play_round()
  assign_score()
  sleep(2)
end

def play_again?()
  puts "#{@player1[:name]} and #{@player2[:name]}, do you want to play again? (y/n)".cyan
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

