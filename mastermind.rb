require "colorize"
class GameLogic
  COLORS = ["R", "G", "B", "Y", "O", "P","I", "C"]
  def self.level_picker(choice)
    case choice
      when "1"
           secret_code =Computer.generated_code(1)
           p secret_code
        display_code = secret_code.sort
        puts "I have generated a beginner sequence with #{secret_code.size} elements made up of:
    #{GameLogic.displayer_code(display_code)}. You are to guess the sequence in which
     these colors appeared e.g #{display_code.join} for #{GameLogic.displayer_code(display_code)}.
     You have 12 guesses to get these colors or you lose the game. Use "+"(q)uit".red+" at any
      time to end the game."
      puts "Ready to play?"
      puts "What's your guess?"
        number_trial = 12
        while(number_trial!=0)
            player_guess= gets.chomp
            player_guess.upcase!
            #case player_guess
            if player_guess=="Q" or player_guess=="QUIT"
                puts "Oops! You quit"
                number_trial =0
                #p Computer.generated_color(4)
            elsif player_guess.length < 4
                puts "Your input is too short."
                  puts "You have tried #{12-(number_trial)} time. You have #{number_trial} attempts left"
            elsif player_guess.length > 4
                puts "Your input is high"
                  puts "You have tried #{12-(number_trial)} time. You have #{number_trial} attempts left"
             elsif player_guess.length == 4 && (secret_code.join==player_guess)
              #puts 'Start the game'
              puts "Congratulation You made it"
              number_trial=0
            else
              player_code =player_guess.split("")
              exact_matcher = Evaluator.exact_match(secret_code,player_code)
              total_matcher = Evaluator.total_match(secret_code,player_code)
              partial_matcher = total_matcher - exact_matcher
              number_trial-=1
              if number_trial== 0
                puts "You tried, but lost.".red
              puts"The colors generated were #{secret_code.join}".yellow
              puts "Want to try again? (p)lay to start again or (q)uit to exit or (t)op_players to view the top ten players.".cyan
            elsif number_trial == 11
                puts "You got #{exact_matcher} position exactly and #{partial_matcher} near matches"
                puts "You have tried #{12-(number_trial)} time. You have #{number_trial} attempts left"
                puts "Try again: "
              else
                puts "You got #{exact_matcher} position exactly and #{partial_matcher} near matches"
                puts "You have tried #{12-(number_trial)} times. You have #{number_trial} attempts left"
                puts "Try again: "
              end
            end
        end
      when "2"
        puts "i am coming home"
      when "3"
        puts "i am coming home"
      when "quit","q"
       puts "you quit without trying"
       return
     else
      puts 'Invalid command'
      return
    end
  end
  def self.colors
    ['R', 'O', 'Y', 'B', 'I', 'C', 'V','P','G']
  end
  def self.colors_in_word(color)
        case color
          when 'R'
            return "(R)ed".red
          when 'O'
           return "(O)range".red
          when 'Y'
          return   "(Y)ellow".yellow
          when 'G'
          return   "(G)green".green
          when 'B'
          return   "(B)lue".blue
          when 'P'
          return   "(P)urple".magenta
          when 'C'
          return   "(C)yan".cyan
          when 'I'
          return   "(I)ndigo".magenta
          when 'V'
          return   "(V)iolet".cyan
          else
            "invalid color"
        end
    end
    def self.displayer_code(color_array)
      message = ""
      color_array.each.with_index do |color,index|
        if index!=color_array.size-1
        message +=GameLogic.colors_in_word(color)+", "
      else
        message +="and "+GameLogic.colors_in_word(color)
      end
      end
      message
    end
end
module Evaluator
  def self.exact_match(comp_secret_code, players_code)
    num_exact_match = 0
  zip_codes= comp_secret_code.zip(players_code)
  zip_codes.each do |a,b|
    if a==b
      num_exact_match+=1
    end
  end
  num_exact_match
  end
  def self.total_match(comp,user)
    comp_hash=comp.reduce(Hash.new(0)) do |memo,ele|
    memo[ele]+=1
   memo
end
user_hash=user.reduce(Hash.new(0)) do |memo,ele|
    memo[ele]+=1
  memo
end
user_hashed = user_hash.select{|k,_| comp_hash.has_key? k}
result =0
user_hashed.each do |key, value|
    if comp_hash[key] >= value
        result +=value
    else
        result +=comp_hash[key]
    end
end
result
  end
end
class Computer
  def self.random_color_picker(number)
    GameLogic.colors.sample(number)
  end
  def self.generated_code (level)
    case level
    when 1
    GameLogic.colors.values_at(rand(4),rand(4),rand(4),rand(4))
    when 2
      GameLogic.colors.values_at(rand(5),rand(5),rand(5),rand(5),rand(5))
    when 3
      GameLogic.colors.values_at(rand(6),rand(6),rand(6),rand(6), rand(6), rand(6))
    end
  end
  def self.generated_color(number)
  colors = GameLogic::COLORS.shuffle
  generated_code = []
  number.times{ generated_code << colors.pop }
  generated_code
end
end
class Player
  def self.guess_word(guess)
    guess.upcase!
    guess.split("")
  end
end
class Message
  def self.menu
    puts "\n================================Menu===================================="
    puts "\n\nWelcome to MASTERMIND GAME ".green+" By ".yellow+" Sammy Prodigy\n".red
    puts "Would you like to "+"(p)lay".green+", read the "+"(i)nstructions".blue+", read a little "+"(b)ackground".yellow+" on Mastermind or "+"(q)uit".red+"?"
  end
  def self.play_menu
    puts "\n ****To start the game select a level you would like to play:\n"
    puts "Enter (1) for "+"Beginner".yellow+","
    puts "Enter (2) for "+"Intermediate".cyan+","
    puts "Enter (3) for "+"Advanced".red
    puts "or (q)uit to go back to the main menu"
  end
  def self.instruction
    puts"Enter a sequence of 4 colors containing the generated colors e.g RYBG or YGRB."
    puts"If you enter "+"fewer than 4 or more than 4 colors".red+", you would receive an error message"
  end
  def self.background
    puts "\t\t\t\t Just a little background on MASTERMIND \n
     \t\tMastermind is a board game with an interesting history (or rather a legend?).
     Some game books report that it was invented in 1971 by Mordecai Meirowitz,
     an Israeli postmaster and telecommunications expert. After many rejections by
     leading toy companies, the rights were obtained by a small British firm,
     Invicta Plastics Ltd. The firm originally manufactured the game itself, though
    it has since licensed its manufacture to Hasbro in most of the world.
    \t\t However, Mastermind is just a clever readaptation of an old similar game called
    'Bulls and cows' in English, and 'Numerello' in Italian...Actually, the old
     British game 'Bulls and cows' was somewhat different from the commercial version.
    It was played on paper, not on a board...Over 50 million copies later, Mastermind
     is still marketed today!
    \t\t The idea of the game is for one player (the code-breaker) to guess the secret
    code chosen by the other player (the code-maker).
     \t\tThe code is a sequence of 4 colored pegs chosen from six colors available.
     The code-breaker makes a serie of pattern guesses - after each guess the code-maker
     gives feedback in the form of 2 numbers, the number of pegs that are of the right color
    and in the correct position, and the number of pegs that are of the correct color
    but not in the correct position - these numbers are usually represented by small black and white pegs.
     \t\tIn 1977, the mathematician Donald Knuth demonstrated that the code-breaker can solve the pattern
     in five moves or less, using an algorithm that progressively reduced the number of possible patterns.".cyan
  end
end
loop do
  Message.menu
  command = gets.chomp
  command.downcase!
  case command
  when 'play','p'
    Message.play_menu
    player_choice = gets.chomp
   GameLogic.level_picker(player_choice)
    when 'instructions', 'i'
      Message.instruction
    when 'background', 'b'
      Message.background
    when 'quit','q'
      break
    else
      puts 'Invalid command'
  end
end
=begin
[:black, :light_black, :red, :light_red, :green, :light_green, :yellow, :light_yellow, :blue, :light_blue, :magenta, :light_magenta, :cyan, :light_cyan, :white, :light_white, :default]
=end
