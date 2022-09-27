# rubocop:disable Layout/LineLength
# Write a program that takes a word and a list of possible anagrams and selects the correct sublist that contains the anagrams of the word.

=begin
PROBLEM
- we're given a word and a list of anagram candidates; from the list our program needs to select the strings that are actual anagrams
- the anagrams should be returned as another list
- anagrams must contain the same letters as the given word, with the same frequency of each letter

EXAMPLES
- no matches should yield an empty array
- for multiple matches, order in the output array doesn't matter
- copies of the word don't count as anagrams
- beware of using "checksum" (maybe this has something to do with ASCII)
- anagrams are case-insensitive

DATA STRUCTURES
- output is an array
- we need an `Anagram` class with a `match` instance method and a constructor method that accepts a string (the word to be matched)
- might be useful to have some kind of "tally" object that keeps track of letters and frequencies

ALGORITHM
`match`
- create empty output array
- make a tally hash of @word's chars and store it
- iterate through the input array
  - for each string, convert to char array  make a tally hash
  - if the string's tally hash is identical to @word's, the string is an anagram
    - add the string to the output array
- return output array

=end

# rubocop:enable Layout/LineLength
#
class Anagram
  attr_reader :word

  def initialize(word)
    @word = word.downcase
  end

  def match(anagram_candidates)
    matches = []
    letter_frequencies = word.chars.tally

    anagram_candidates.each do |w|
      next if w.downcase == word
      matches << w if w.downcase.chars.tally == letter_frequencies
    end

    matches
  end
end
