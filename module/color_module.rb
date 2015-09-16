require "colorize"
module Game_Color
  COLORS = ['R', 'O', 'Y', 'B', 'I', 'C', 'V','P','G']
  COLORS_IN_WORD={'R'=>"(R)ed".red,'O'=>"(O)range".red,'Y'=>"(Y)ellow".yellow,'G'=>"(G)green".green,'B'=>"(B)lue".blue,'P'=>"(P)urple".magenta,'C'=>"(C)yan".cyan,'I'=>"(I)ndigo".magenta,'V'=>"(V)iolet".cyan}
      module_function
  def generated_color level
    case level
    when 1
    COLORS.values_at(rand(4),rand(4),rand(4),rand(4))
    when 2
    COLORS.values_at(rand(5),rand(5),rand(5),rand(5),rand(5))
    when 3
    COLORS.values_at(rand(6),rand(6),rand(6),rand(6), rand(6), rand(6))
    end
  end
  def unique_color_display (color_array)
    comp_col_length = color_array.length
    uniq_color =color_array.uniq
    diff = comp_col_length - uniq_color.size
    other_color =COLORS - uniq_color
   other_color.sample(diff) + uniq_color
  end
  def color_display_message(color_array)
    message = ""
    color_array.each.with_index do |color,index|
       index!=color_array.size-1 ? message +=COLORS_IN_WORD[color]+", " :  message +="and "+COLORS_IN_WORD[color]
    end
    message
  end
end
