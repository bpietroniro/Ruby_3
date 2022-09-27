# rubocop:disable Layout/LineLength
# Write a program that can generate the lyrics of the 99 Bottles of Beer song. See the test suite for the entire song.

=begin

PROBLEM
- given integer input `start` and optional `end`
- generate verses numbers `start` through `end` of the song
- output: string containing all the requested verses
- a verse contains two lines
- there are 100 verses in the entire song (99 through 0 bottles)

EXAMPLES
- verses should be separated by a blank line
- lines 1 and 0 have slightly altered words
- we need a `BeerSong` class with class methods `verse` (for one argument) and `verses` (for two arguments), as well as `lyrics` for the whole song
  - `verses` can probably use `verse` as a helper method

DATA STRUCTURES
- we need to figure out how to store the lines of the song for repeated use
  - lines as separate array elements?
- we need to figure out how best to modify those lines for the last two verses

ALGORITHM
- initialize a class constant containing the lines of the song

`verse`(num_of_bottles)

`verses`(start,finish)
- initialize empty output string
- iterate from `start` down to `finish` (each index representing number of bottles)
  - if num_of_bottles is 1, add `penultimate_verse` to output
  - elsif num_of_bottles is 0, add `last_verse` to output
  - else add `verse` on current number of bottles to output
- return output

`lyrics`
- call `verses` with inputs start=99, finish=0

=end

# rubocop:enable Layout/LineLength
class BeerSong
  CLAUSES = ["bottles of beer on the wall,", "bottles of beer.\n",
             "Take one down and pass it around,",
             "bottles of beer on the wall.\n"]

  def self.verse(num_of_bottles)
    result = case num_of_bottles
             when 2 then antepenultimate_verse
             when 1 then penultimate_verse
             when 0 then last_verse
             else BeerSong.normal_verse(num_of_bottles)
             end
    result
  end

  def self.verses(start, finish)
    verse_array = []
    start.downto(finish) do |num_of_bottles|
      verse_array << BeerSong.verse(num_of_bottles)
    end

    verse_array.join("\n")
  end

  def self.lyrics
    [BeerSong.verses(99, 2), penultimate_verse, last_verse].join("\n")
  end

  def self.normal_verse(num_bottles)
    result = ''
    result << "#{num_bottles} #{CLAUSES[0]} #{num_bottles} #{CLAUSES[1]}"
    result << "#{CLAUSES[2]} #{num_bottles - 1} "
    result << CLAUSES[3]
    result
  end

  class << self
    def antepenultimate_verse
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    end

    def penultimate_verse
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, " \
      "no more bottles of beer on the wall.\n"
    end

    def last_verse
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end
end
