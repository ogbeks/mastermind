module Top_ten_File_Manager
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
end
