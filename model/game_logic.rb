class GameLogic
  class << self
  def level_option
    Message.play_menu
    player_choice = (gets.chomp).downcase
   GameLogic.level_picker(player_choice)
  end
  def level_picker(choice)
    case choice
      when "1"
          Level_Controller.introduction choice
      when "2"
        Level_Controller.introduction choice
      when "3"
        Level_Controller.introduction choice
      when "quit","q"
       puts Message::BACK_MENU
     else
      puts Message::INVALID_INPUT
    end
  end
  end
end
class Computer
  def self.generated_code (level)
  Game_Color.generated_color(level)
  end
end
