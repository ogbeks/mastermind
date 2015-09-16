
require_relative "../extending_ruby_object"
describe "Testing ruby extension class object" do
  context "Array converted to hash object" do
    color_one = ['R', 'R','B','Y','W']
    color_two = ['R','R','R','R']
    color_three =['E','1','0','3']
    it "should convert ['R','R','R','R'] to {'R'=> 4}" do
      expect(color_two.convert_hash).to eq ({'R'=> 4})
    end
    it "should convert ['R', 'R','B','Y','W'] to {'R'=> 2, 'B'=>1, 'Y'=>1, 'W'=>1}" do
      expect(color_one.convert_hash).to eq ({'R'=> 2, 'B'=>1, 'Y'=>1, 'W'=>1})
    end
    it "should convert ['E','1','0','3'] to {{'E'=> 1, '1'=>1, '0'=>1, '3'=>1}}" do
      expect(color_three.convert_hash).to eq ({'E'=> 1, '1'=>1, '0'=>1, '3'=>1})
    end
    it "should expect [] to equal to {}" do
      expect([].convert_hash).to eq ({})
    end
  end
  context "Numeric method for duration" do
    it "should expect 0 to equal to 0 seconds" do
        expect(0.duration).to eql("0 seconds")
    end
    it "should expect 200 to equal to 3 minutes and 20 seconds" do
        expect(200.duration).to eql("3 minutes and 20 seconds")
    end
  end
end
