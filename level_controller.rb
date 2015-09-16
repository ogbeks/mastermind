module Level_trials
  def self.introduction choice
    secret_code =Computer.generated_code(choice.to_i)
    p secret_code
 display_code = secret_code.sort
 color_display_code_in_array =Game_Color.unique_color_display(display_code)
 color_message =Game_Color.color_display_message(color_display_code_in_array)

 puts "I have generated a beginner sequence with #{secret_code.size} elements made up of:
#{color_message}. You are to guess the sequence in which
these colors appeared e.g #{color_display_code_in_array.join} for #{color_message}.
You have 12 guesses to get these colors or you lose the game. Use "+"(q)uit".red+" at any
time to end the game."
puts "Ready to play?"
puts "What's your guess?"
 Level_trials.trials(secret_code, choice)
  end

  def self.trials (secret_code, choice)
  start_timer = Time.now
  player_trial = 0
  number_trial = 12
  secret_length = secret_code.length
  stop = true
  while(stop)
      player_guess= gets.chomp
      player_guess.upcase!
      #case player_guess
        if player_guess=="Q" or player_guess=="QUIT"
            puts "Oops! You quit"
            stop =false

        elsif player_guess =="C" or player_guess=="CHEAT"
          puts "Hmm! You just cheated. The colors were #{secret_code.join}".red
          stop =false

            #p Computer.generated_color(4)
        elsif player_guess.length < secret_length
            puts "Your input is too short."
              puts "You have tried #{player_trial} time. You have #{number_trial-player_trial} attempts left"
        elsif player_guess.length > secret_length
            puts "Your input is high"
              puts "You have tried #{player_trial} time. You have #{number_trial-player_trial} attempts left"
         elsif player_guess.length == secret_length && (secret_code.join==player_guess)
          #puts 'Start the game'
          duration_time = (Time.now - start_timer).duration
          player_trial+=1
          puts "Congratulations! You guessed the sequence '#{player_guess}' in #{player_trial} guesses and in #{duration_time}"
          #puts "Want to play again? (p)lay to start again or (q)uit to exit or (t)op_players to view the top ten players.".cyan
          Trial_message.end_game_option? choice
          stop = false
        else
              player_code =player_guess.split("")
              exact_matcher = Evaluator.exact_match(secret_code,player_code)
              total_matcher = Evaluator.total_match(secret_code,player_code)
              partial_matcher = total_matcher - exact_matcher
              player_trial+=1
            if player_trial== 12
              puts "You tried, but lost.".red
              puts"The colors generated were #{secret_code.join}".yellow
              #puts "Want to try again? (p)lay to start again or (q)uit to exit or (t)op_players to view the top ten players.".cyan
              Trial_message.end_game_option? choice
              stop = false
            elsif player_trial == 1
              puts "#{player_guess} has #{total_matcher} correct elements with  #{exact_matcher} in the correct positions"
              puts "You have tried #{player_trial} time. You have #{number_trial-player_trial} attempts left"
              puts "Try again: "
            else
              #puts "You got #{exact_matcher} position exactly and #{partial_matcher} near matches"
              puts "#{player_guess} has #{total_matcher} correct elements with  #{exact_matcher} in the correct positions"
              puts "You have tried #{player_trial} times. You have #{number_trial-player_trial} attempts left"
              puts "Try again: "
            end
        end
    end
  end
end
