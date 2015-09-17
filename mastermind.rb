require_relative "helper"
loop do
  Message.menu
  command =(gets.chomp).downcase
  case command
  when 'play','p'
    GameLogic.level_option
    when 'instructions', 'i'
      Message.instructions
    when 'background', 'b'
      Message.background
    when 'quit','q'
      puts Message::QUIT_GAME
      break
    else
      puts Message::INVALID_INPUT
  end
end
