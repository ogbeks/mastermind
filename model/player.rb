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
