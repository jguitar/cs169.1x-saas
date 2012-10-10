def combine_anagrams(words)
  anagrams_hash = Hash.new { |hash, k| hash[k] = [] }
  words.each do |word|
    word_ordered = word.downcase.scan(/\w/).sort.join
    anagrams_hash[word_ordered] << word
  end

  anagrams_group = []
  anagrams_hash.sort.each do |k, v|
    anagrams_group << anagrams_hash[k]
  end
  anagrams_group
end

# test
if combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']) == [["creams", "scream"], ["cars", "racs", "scar"], ["potatoes"], ["for"], ["four"]]
  puts 'ok'
else
  puts 'error'
  puts combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']).inspect
end

if combine_anagrams(["Rats", "Tars", "Star"]) == [["Rats", "Tars", "Star"]]
  puts 'ok'
else
  puts 'error'
end

