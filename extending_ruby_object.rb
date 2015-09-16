class Numeric
  def duration
    secs  = self.to_int
    mins  = secs / 60
    hours = mins / 60
    days  = hours / 24

    if days > 0
      "#{days} days and #{hours % 24} hours"
    elsif hours > 0
      "#{hours} hours and #{mins % 60} minutes"
    elsif mins > 0
      "#{mins} minutes and #{secs % 60} seconds"
    elsif secs >= 0
      "#{secs} seconds"
    end
  end
end
class Array
    def convert_hash
      self.reduce(Hash.new(0)) do |memo,ele|
      memo[ele]+=1
      memo
      end
    end
  end
