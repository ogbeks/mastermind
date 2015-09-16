require "json"
module Top_ten
  module_function
  def create_file
    File.new("top_ten.json", "w+")
    default_json = {"beginner"=>[], "intermediate"=>[], "advanced"=>[]}
    write_file(default_json)
  end
  def check_file?
     File::exist?("top_ten.json") ? true : false
  end
  def open_file
    if check_file? == false
      create_file
    end
  end
  def write_file(json_file)
    writing =File.open("top_ten.json", "w+")
    writing.puts(json_file)
    writing.close
  end
  def read_file
    File.read("top_ten.json")
  end
  def json_sort(unsort_array_hash)
    unsort_array_hash.sort_by!{|key| [key[:tries],key[:duration]] }
    unsort_array_hash=unsort_array_hash[0..9]
  end
  def get_json_scores_by_level(level)
    case level
      when "1",1
        current_data = eval(read_file)
        current_data["beginner"]
      when "2",2
        current_data = eval(read_file)
        current_data["intermediate"]
      when "3",3
        current_data = eval(read_file)
        current_data["advanced"]
    end
  end
  def json_add(level,player_bio_hash)
    case level
    when "1",1
      current_data = eval(read_file)
      current_data["beginner"] << player_bio_hash
      current_data["beginner"]= json_sort(current_data["beginner"])
      current_data
    when "2",2
      current_data = eval(read_file)
      current_data["intermediate"] << player_bio_hash
      json_sort(current_data["Intermediate"])
      current_data
    when "3",3
      current_data = eval(read_file)
      current_data["advanced"] << player_bio_hash
      json_sort(current_data["advanced"])
      current_data
    end
  end
end
p Top_ten.check_file?
Top_ten.open_file
has ={:name=>"ogbeks", :guess=>"RRGB", :tries=>1, :duration=>1}
update=Top_ten.json_add(1,has)
Top_ten.write_file(update)
puts Top_ten.read_file
=begin
json_fil ={"beginner"=> [{:name=>"ogbeks", :guess=>"RRGB", :tries=>3, :duration=>10}, {:name=>"ogbeks", :guess=>"RRGB", :tries=>3, :duration=>15}, {:name=>"ogbeks", :guess=>"RRGB", :tries=>3, :duration=>20}],
"advanced"=> [{:name=>"ogbeks", :guess=>"RRGB", :tries=>3, :duration=>10}, {:name=>"ogbeks", :guess=>"RRGB", :tries=>3, :duration=>15}, {:name=>"ogbeks", :guess=>"RRGB", :tries=>3, :duration=>20}],
"Intermediate"=> []}
=end
#Top_ten.write_file(json_fil)
puts Top_ten.read_file
