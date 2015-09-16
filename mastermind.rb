require "colorize"
require_relative "extension/extending_ruby_object"
require_relative "module/menu_message_module"
require_relative "module/evaluator_module"
require_relative "module/color_module"
require_relative "level_controller"
require_relative "trial_message"
class GameLogic
  def self.level_option
    Message.play_menu
    player_choice = gets.chomp
   GameLogic.level_picker(player_choice)
  end
  def self.level_picker(choice)
    case choice
      when "1"
          Level_trials.introduction choice
      when "2"
        Level_trials.introduction choice
      when "3"
        Level_trials.introduction choice
      when "quit","q"
       puts "you quit without trying"
       return
     else
      puts 'Invalid command'
      return
    end
  end
end
class Computer
  def self.generated_code (level)
  Game_Color.generated_color(level)
  end
end
class Player
  attr_accessor :guess, :name, :tries, :duration
  def initialize (name,guess, tries, duration)
    @name = name
    @guess = guess
    @tries =tries
    @duration =duration
  end
  def convert_hash
   Hash[[[:name, @name], [:guess, @guess], [:tries, @tries], [:duration, @duration]]]
 end
  def self.guess_word(guess)
    guess.upcase!
    guess.split("")
  end
end
loop do
  Message.menu
  command = gets.chomp
  command.downcase!
  case command
  when 'play','p'
    GameLogic.level_option
    when 'instructions', 'i'
      Message.instruction
    when 'background', 'b'
      Message.background
    when 'quit','q'
      puts "Thanks for playing Mastermind!".green
      puts "Goodbye!".yellow
      break
    else
      puts 'Invalid command'
  end
end
=begin
[:black, :light_black, :red, :light_red, :green, :light_green, :yellow, :light_yellow, :blue, :light_blue, :magenta, :light_magenta, :cyan, :light_cyan, :white, :light_white, :default]
=end
