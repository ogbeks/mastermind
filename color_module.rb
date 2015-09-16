module Game_Color
  COLORS = ['R', 'O', 'Y', 'B', 'I', 'C', 'V','P','G']
  def self.generated_color level
    case level
    when 1
    COLORS.values_at(rand(4),rand(4),rand(4),rand(4))
    when 2
    COLORS.values_at(rand(5),rand(5),rand(5),rand(5),rand(5))
    when 3
    COLORS.values_at(rand(6),rand(6),rand(6),rand(6), rand(6), rand(6))
    end
  end
  def self.unique_color_display (color_array)
    comp_col_length = color_array.length
    uniq_color =color_array.uniq
    diff = comp_col_length - uniq_color.size
    other_color =COLORS - uniq_color
   other_color.sample(diff) + uniq_color
  end
  def self.color_display_message(color_array)
    message = ""
    color_array.each.with_index do |color,index|
        if index!=color_array.size-1
        message +=Game_Color.colors_in_word(color)+", "
        else
          message +="and "+Game_Color.colors_in_word(color)
        end
    end
    message
  end
  def self.colors_in_word color_code
      case color_code
        when 'R'
          return "(R)ed".red
        when 'O'
         return "(O)range".red
        when 'Y'
        return   "(Y)ellow".yellow
        when 'G'
        return   "(G)green".green
        when 'B'
        return   "(B)lue".blue
        when 'P'
        return   "(P)urple".magenta
        when 'C'
        return   "(C)yan".cyan
        when 'I'
        return   "(I)ndigo".magenta
        when 'V'
        return   "(V)iolet".cyan
        else
          "invalid color"
      end
    end
end
