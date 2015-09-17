class Trial_message
  def self.end_game_option? choice,new_player_hash={}
    puts "Want to play again? (r)estart the game (p)lay to start again or (q)uit to exit or (t)op_players to view the top ten players.".cyan
    choicer = choice
    option = gets.chomp
    Trial_message.option_interpreter(option,choicer,new_player_hash)
  end
  def self.option_interpreter(option,choice,new_player_hash)
    case option
    when "p","play"
          GameLogic.level_option
    when "q","quit"
      false
    when "r","restart"
        Level_trials.introduction choice
    when "t","top_players"
      top_players_message
      Top_ten.top_ten_by_level choice,new_player_hash
      false
    else
      puts "Invalid command. Back to main menu"
      false
    end
  end
  def self.top_players_message
    puts "======================================================================================="
    puts "\t\t\t\tTOP TEN PLAYER LIST ~Beginner"
    puts "======================================================================================="
  end
  def num_of_tries number_trial
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
