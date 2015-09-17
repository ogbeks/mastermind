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
        Level_Controller.introduction choice
    when "t","top_players"
      top_players_message choice
      Top_ten.top_ten_by_level choice,new_player_hash
      false
    else
      puts "Invalid command. Back to main menu"
      false
    end
  end
  def self.top_players_message level
    lev_display=Level_Controller::DISPLAY_LEVEL[level]
    puts "======================================================================================="
    puts "\t\t\t\tTOP TEN PLAYER LIST ~#{lev_display}".yellow
    puts "======================================================================================="
  end

end
