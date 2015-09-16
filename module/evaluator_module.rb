module Evaluator
  def self.exact_match(comp_secret_code, player_code)
    num_exact_match = 0
  zip_codes= comp_secret_code.zip(player_code)
  zip_codes.each do |a,b|
    a==b ? num_exact_match+=1 : num_exact_match
  end
  num_exact_match
  end
  def self.compare_hashes(comp_hash, player_hash)
    player_hashed = player_hash.select{|k,_| comp_hash.has_key? k}
    result =0
    player_hashed.each do |key, value|
        comp_hash[key] >=value ? result +=value : result +=comp_hash[key]
    end
    result
  end
  def self.total_match(comp,player)
    comp_hash= comp.convert_hash
    player_hash= player.convert_hash
    Evaluator.compare_hashes(comp_hash, player_hash)
  end
end
