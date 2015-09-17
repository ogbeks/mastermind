module Message
  QUIT_GAME = "Thanks for playing Mastermind!\n".green+"Goodbye!".yellow
  INVALID_INPUT = "invalid command"
  BACK_MENU = "Back to the main menu"
  module_function
  def menu
    puts "\n================================Menu===================================="
    puts "\nWelcome to MASTERMIND GAME ".green+" By ".yellow+" Sammy Prodigy\n".red
    puts "Would you like to "+"(p)lay".green+", read the "+"(i)nstructions".blue+", read a little "+"(b)ackground".yellow+" on Mastermind or "+"(q)uit".red+"?"
  end
  def play_menu
    puts "\n ****To start the game select a level you would like to play:\n\n\tEnter (1) for "+"Beginner".yellow+",\n\tEnter (2) for "+"Intermediate".cyan+",\n\tEnter (3) for "+"Advanced".red
    puts "or (q)uit to go back to the main menu".red
  end
  def instruction
    puts"Enter a sequence of 4 colors containing the generated colors e.g RYBG or YGRB.\nIf you enter "+"fewer than 4 or more than 4 colors".red+", you would receive an error message"
  end
  def background
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
