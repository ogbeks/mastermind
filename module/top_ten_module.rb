require_relative "../extension/extending_ruby_object"
module Top_ten
  module_function
  def json_sort(unsort_array_hash)
    unsort_array_hash.sort_by!{|key| [key[:tries],key[:duration]] }
    unsort_array_hash=unsort_array_hash[0..9]
  end
  def get_json_scores_by_level(level)
    case level
      when "1",1
        eval(Top_ten_File_Manager.read_file)["beginner"]
      when "2",2
        eval(Top_ten_File_Manager.read_file)["intermediate"]
      when "3",3
        eval(Top_ten_File_Manager.read_file)["advanced"]
    end
  end
  def top_ten_by_level(level, my_score={})
    top_ten_list = get_json_scores_by_level(level)
    num = 0
    top_ten_list.each do |score|
      num +=1
      score == my_score ? (puts "#{num}. #{score[:name]} solved '#{score[:guess]}' in #{score[:tries]} guesses over #{score[:duration].duration}".yellow) : (puts "#{num}. #{score[:name]} solved '#{score[:guess]}' in #{score[:tries]} guesses over #{score[:duration].duration}")
    end
  end
  def upload_score (level, player_bio_hash)
    current_data = eval(Top_ten_File_Manager.read_file)
    current_data[level] << player_bio_hash
    current_data[level]= json_sort(current_data[level])
    Top_ten_File_Manager.write_file(current_data)
  end
  def json_add(level,player_bio_hash)
    case level
    when "1",1
    upload_score("beginner",player_bio_hash)
    when "2",2
      upload_score("intermediate",player_bio_hash)
    when "3",3
      upload_score("advanced",player_bio_hash)
    end
  end
end
