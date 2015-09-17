require_relative "extension/extending_ruby_object"
module Top_ten
  module_function
  def create_file
    File.new("top_ten.json", "w+")
    default_json = {"beginner"=>[], "intermediate"=>[], "advanced"=>[]}
    write_file(default_json)
  end
  def check_file?
     File.exist?("top_ten.json")&& (File.zero?("top_ten.json")==false) ? true : false
  end
  def open_file
    check_file? == false ? create_file : return
  end
  def write_file(json_file)
    writing =File.open("top_ten.json", "w+")
    writing.puts(json_file)
    writing.close
  end
  def read_file
    open_file
    File.read("top_ten.json")
  end
  def json_sort(unsort_array_hash)
    unsort_array_hash.sort_by!{|key| [key[:tries],key[:duration]] }
    unsort_array_hash=unsort_array_hash[0..9]
  end
  def get_json_scores_by_level(level)
    case level
      when "1",1
        eval(read_file)["beginner"]
      when "2",2
        eval(read_file)["intermediate"]
      when "3",3
        eval(read_file)["advanced"]
    end
  end
  def top_ten_by_level(level, my_score={})
    top_ten_list = get_json_scores_by_level(level)
    num = 0
    top_ten_list.each do |score|
      num +=1
      score == my_score ? puts "#{num}. #{score[:name]} solved '#{score[:guess]}' in #{score[:tries]} guesses over #{score[:duration].duration}".yellow : puts "#{num}. #{score[:name]} solved '#{score[:guess]}' in #{score[:tries]} guesses over #{score[:duration].duration}"
    end
  end
  def upload_score (level, player_bio_hash)
    current_data = eval(read_file)
    current_data[level] << player_bio_hash
    current_data[level]= json_sort(current_data[level])
    write_file(current_data)
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
=begin
json_fil ={"beginner"=> [{:name=>"ogbeks", :guess=>"RRGB", :tries=>3, :duration=>10}, {:name=>"ogbeks", :guess=>"RRGB", :tries=>3, :duration=>15}, {:name=>"ogbeks", :guess=>"RRGB", :tries=>3, :duration=>20}],
"advanced"=> [{:name=>"ogbeks", :guess=>"RRGB", :tries=>3, :duration=>10}, {:name=>"ogbeks", :guess=>"RRGB", :tries=>3, :duration=>15}, {:name=>"ogbeks", :guess=>"RRGB", :tries=>3, :duration=>20}],
"Intermediate"=> []}
=end
#Top_ten.write_file(json_fil)
