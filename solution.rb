# Dictionary Helper method to convert dictionary words into hash object.
def dictionary_words_hash_map
  words = {}
  (1..50).each { |wl| words[wl] = [] }

  File.open(File.dirname(__FILE__) + '/dictionary.txt').each do |wd|
    words[wd.length] << wd.chop.to_s.downcase
  end

  words.reject { |_, v| v.empty? }
end

# Phone number parser method to convert number to meaningful words.
def phone_number_to_words(digits)
  digits = digits.to_s
  return [] if digits.nil? || digits.length != 10 || digits.split('').select{|a|(a.to_i == 0 || a.to_i == 1)}.length > 0

  dictionary_words = dictionary_words_hash_map
  keypad_letters = { "2" => ["a", "b", "c"], "3" => ["d", "e", "f"], "4" => ["g", "h", "i"], "5" => ["j", "k", "l"], "6" => ["m", "n", "o"], "7" => ["p", "q", "r", "s"], "8" => ["t", "u", "v"], "9" => ["w", "x", "y", "z"] }
  possible_words = {}
  word_matchs = []

  number_key_alphabets = digits.chars.map{ |digit| keypad_letters[digit] }
  key_alphabets_length = number_key_alphabets.length - 1

  (2..key_alphabets_length - 2).each do |index|
    first_n_words = number_key_alphabets[0..index]
    remaining_n_words = number_key_alphabets[index + 1..key_alphabets_length]

    # Condition to have words greater than 3
    if first_n_words.length >= 3 && remaining_n_words.length >= 3
      n_combinations = first_n_words.shift.product(*first_n_words).map(&:join)
      remaining_combinations = remaining_n_words.shift.product(*remaining_n_words).map(&:join)
    end

    # Deletes meaningless words from the list.
    unless n_combinations.nil? || remaining_combinations.nil?
      n_words = n_combinations & dictionary_words[index + 2]
      remaining_words = remaining_combinations & dictionary_words[key_alphabets_length - index + 1]
      possible_words[index] = [n_words, remaining_words]
    end
  end

  # Combines pair of words at each length.
  possible_words.each { |_, word_set| word_set.first.product(word_set.last).each { |cw| word_matchs << cw } unless word_set.first.nil? || word_set.last.nil? }
  full_word = (number_key_alphabets.shift.product(*number_key_alphabets).map(&:join) & dictionary_words[11]).join(", ")

  # Removes the whole word from the list.
  unless full_word.nil?
    word_matchs = word_matchs.reject { |word_set| word_set.join('').eql?(full_word) }
    word_matchs << full_word
  end

  # Returns the word_matchs array by removing empty value.
  word_matchs.reject(&:empty?)
end

# IO Block
puts "Enter 10 digit phone number: "
puts phone_number_to_words(gets.chomp).inspect
