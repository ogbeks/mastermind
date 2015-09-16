require_relative "../module/evaluator_module"
require_relative "../extending_ruby_object"
describe Evaluator do
  context "evaluating on four computer generated color" do
    before(:each) do
    @comp_color = ['R','G','Y','Y']
    @player_color =['R','B','G','Y']
    @comp_hash=@comp_color.convert_hash
    @player_hash =@player_color.convert_hash
    end
    it "should expect two correct position matches for the player" do
      expect(Evaluator.exact_match(@comp_color,@player_color)).to be(2)
    end
    it "should expect three correct matches for the player" do
      expect(Evaluator.total_match(@comp_color,@player_color)).to eq 3
      expect(@comp_color.convert_hash).to eq ({'R'=>1,'G'=>1,'Y'=>2})
      expect(@player_color.convert_hash).to eq ({'R'=>1,'G'=>1,'Y'=>1,'B'=>1})
    end
    it "should expect three when comp color is compared to player color" do
      expect(Evaluator.compare_hashes(@comp_hash, @player_hash)).to eq 3
    end
  end
  context "evaluating on 5 computer generated color" do
    before(:each) do
    @comp_color = ['R','G','Y','Y','Y']
    @player_color =['R','B','G','Y','C']
    @comp_hash=@comp_color.convert_hash
    @player_hash =@player_color.convert_hash
    end
    it "should expect two correct position matches for the player" do
      expect(Evaluator.exact_match(@comp_color,@player_color)).to be(2)
    end
    it "should expect three correct matches for the player" do
      expect(Evaluator.total_match(@comp_color,@player_color)).to eq 3
      expect(@comp_color.convert_hash).to eq ({'R'=>1,'G'=>1,'Y'=>3})
      expect(@player_color.convert_hash).to eq ({'R'=>1,'G'=>1,'Y'=>1,'B'=>1,'C'=>1})
    end
    it "should expect three when comp color is compared to player color" do
      expect(Evaluator.compare_hashes(@comp_hash, @player_hash)).to eq 3
    end
  end
  context "evaluating on 6 computer generated color" do
    before(:each) do
    @comp_color = ['Y','Y','Y','Y','Y','Y']
    @player_color =['R','B','G','Y','C','B']
    @comp_hash=@comp_color.convert_hash
    @player_hash =@player_color.convert_hash
    end
    it "should expect one correct position matches for the player" do
      expect(Evaluator.exact_match(@comp_color,@player_color)).to be(1)
    end
    it "should expect three correct matches for the player" do
      expect(Evaluator.total_match(@comp_color,@player_color)).to eq 1
      expect(@comp_color.convert_hash).to eq ({'Y'=>6})
      expect(@player_color.convert_hash).to eq ({'R'=>1,'G'=>1,'Y'=>1,'B'=>2,'C'=>1})
    end
    it "should expect one when comp color is compared to player color" do
      expect(Evaluator.compare_hashes(@comp_hash, @player_hash)).to eq 1
    end
  end
end
