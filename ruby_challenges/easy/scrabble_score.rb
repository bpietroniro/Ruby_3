# rubocop:disable Layout/LineLength
# Write a program that, given a word, computes the Scrabble score for that word.

=begin
PROBLEM
- each letter has a given point value; to calculate the Scrabble score for a word, take the sum of the point values of all the letters
- return value is an integer

EXAMPLES
- we need a Scrabble class
  - constructor method that takes the word to score and saves it as an instance variable
  - instance method `score` that returns the score of the current object's instance variable
  - ALSO a class method `score` that returns the score of its string argument
- whitespace, empty string, and nil all score zero
- everything is case-insensitive

DATA STRUCTURES
- main question: how to store the point values... probably hash? one key per letter, or is there a more clever way?
- YES THERE IS: use regex

ALGORITHM
(if a hash, then pretty simple, just iterate through the characters of the word, looking up each letter in the hash and adding its value to the total)

`score`
- return 0 if `word` is `nil`
- initialize score at 0
- iterate through the chars of `word`
  - get current letter's score from regex-based helper method and add to total score
- return score

`get_point_value`
- use a case statement on the value of the character argument
  - \s
  - aeioulnrst
  - dg
  - bcmp
  - fhvwy
  - k
  - jx
  - qz
=end

# rubocop:enable Layout/LineLength
class Scrabble
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  def score
    return 0 unless word
    word.gsub(/[^a-z]/i, '').chars.map { |char| get_point_value(char) }.sum
  end

  private

  def get_point_value(char)
    case char
    when /[aeioulnrst]/i then 1
    when /[dg]/i then 2
    when /[bcmp]/i then 3
    when /[fhvwy]/i then 4
    when /[k]/i then 5
    when /[jx]/i then 8
    when /[qz]/i then 10
    end
  end
end
