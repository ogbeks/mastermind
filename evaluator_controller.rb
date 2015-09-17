module Evaluate
  module_function
  def self.player_code_valid_process (temp_record_hash)
    player_code,comp_code = temp_record_hash[:player_guess].split(""), temp_record_hash[:secret_code].split("")
    temp_record_hash[:exact_matcher] = Evaluator.exact_match(comp_code,player_code)
    temp_record_hash[:total_matcher] = Evaluator.total_match(comp_code,player_code)
    temp_record_hash[:partial_matcher] = temp_record_hash[:total_matcher] - temp_record_hash[:exact_matcher]
    temp_record_hash[:trials]+=1
    temp_record_hash
  end
  def self.player_lost temp_record_hash
    puts "You tried, but lost.".red
    puts"The colors generated were #{temp_record_hash[:secret_code]}".yellow
    Trial_message.end_game_option? temp_record_hash[:level_choice]
  end
  def self.save_player temp_record_hash
    puts "Congratulation!".green+" you guessed the sequence,".cyan+" what is your name?".blue
    player_name = gets.chomp
    new_player = Player.new(player_name, temp_record_hash[:player_guess], temp_record_hash[:trials], temp_record_hash[:duration_time])
    new_player_hash = new_player.convert_hash
    Top_ten.json_add(temp_record_hash[:level_choice],new_player_hash)
    puts "#{player_name}, You guessed the sequence '#{temp_record_hash[:player_guess]}' in #{temp_record_hash[:trials]} guesses and in #{temp_record_hash[:duration_time].duration}"
    Trial_message.end_game_option? temp_record_hash[:level_choice],new_player_hash
  end
  def self.player_win temp_record_hash
    temp_record_hash[:duration_time] = Time.now - temp_record_hash[:start_timer]
    temp_record_hash[:trials]+=1
    save_player temp_record_hash
  end
  def self.player_code_valid (temp_record_hash)
    temp_record_hash = player_code_valid_process(temp_record_hash)
      if temp_record_hash[:trials]== 12
        player_lost temp_record_hash
        false
      elsif temp_record_hash[:trials]== 1
        puts "#{temp_record_hash[:player_guess]} has #{temp_record_hash[:total_matcher]} correct elements with  #{temp_record_hash[:exact_matcher]} in the correct positions\nYou have tried #{temp_record_hash[:trials]} time. You have #{12-temp_record_hash[:trials]} attempts left\nTry again: "
        true
      else
        puts "#{temp_record_hash[:player_guess]} has #{temp_record_hash[:total_matcher]} correct elements with  #{temp_record_hash[:exact_matcher]} in the correct positions\nYou have tried #{temp_record_hash[:trials]} times. You have #{12-temp_record_hash[:trials]} attempts left\nTry again: "
        true
      end
  end
end
