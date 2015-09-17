module Level_Controller
  DISPLAY_LEVEL = {'1'=>"BEGINNER".yellow, '2'=>"INTERMEDIATE".cyan, '3'=>"ADVANCED".red}
  def self.display_sequence_level level
    DISPLAY_LEVEL[level]
  end
  def self.introduction choice
    secret_code =Computer.generated_code(choice.to_i)
    p secret_code
 display_code = secret_code.sort
 color_display_code_in_array =Game_Color.unique_color_display(display_code)
 color_message =Game_Color.color_display_message(color_display_code_in_array)
 puts "I have generated a #{display_sequence_level(choice)} sequence with #{secret_code.size} elements made up of: #{color_message}. You are to guess the sequence in which these colors appeared e.g #{color_display_code_in_array.join} for #{color_message}.\nYou have 12 guesses to get these colors or you lose the game. Use "+"(q)uit".red+" at any time to end the game.\nReady to play?\nWhat's your guess?"
 trials(secret_code, choice)
  end
  def self.generate_temp_hash choice,secret_code
    temp_record_hash = {}
    temp_record_hash[:start_timer] = Time.now
    temp_record_hash[:level_choice]= choice
    temp_record_hash[:secret_code]=secret_code.join
    temp_record_hash[:trials] = 0
    temp_record_hash
  end
  def self.trials (secret_code, choice)
      temp_record_hash=generate_temp_hash choice,secret_code
      stop = true
  while(stop)
      temp_record_hash[:player_guess]= (gets.chomp).upcase
        if temp_record_hash[:player_guess]=="Q" or temp_record_hash[:player_guess]=="QUIT"
            puts "Oops! You quit"
            stop =false
        elsif temp_record_hash[:player_guess] =="C" or temp_record_hash[:player_guess]=="CHEAT"
          puts "Hmm! You just cheated. The colors were #{temp_record_hash[:secret_code]}".red
          stop =false
        elsif temp_record_hash[:player_guess].length < temp_record_hash[:secret_code].length
            puts "Your input is too short.\nYou have tried #{temp_record_hash[:trials]} time. You have #{12-temp_record_hash[:trials]} attempts left"
        elsif temp_record_hash[:player_guess].length > temp_record_hash[:secret_code].length
            puts "Your input is high\nYou have tried #{temp_record_hash[:trials]} time. You have #{12-temp_record_hash[:trials]} attempts left"
         elsif temp_record_hash[:player_guess].length == temp_record_hash[:secret_code].length && (temp_record_hash[:secret_code]==temp_record_hash[:player_guess])
          Evaluate.player_win temp_record_hash
          stop = false
        else
            stop = Evaluate.player_code_valid (temp_record_hash)
        end
    end
  end
end
