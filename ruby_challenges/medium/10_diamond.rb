# rubocop:disable Layout/LineLength
=begin

PROBLEM
- input: a letter (string with one alphabetical character)
- output: a multiline string that draws a diamond
  - the first and last rows of the diamond consist of one 'A' plus a newline
  - all the other rows have two identical characters (separated by the appropriate number of spaces) and also end with a newline
  - the diamond is horizontally and vertically symmetric, and width = height
  - the letters appear in alphabetically ascending order in the first half of the diamond (going from 'A' to the input letter), and then descending order in the second half (going from the middle line's input letter back down to 'A')
  - the number of spaces

EXAMPLES
- an input of 'A' should yield a single line, containing and 'A' followed by newline
- we need a `Diamond` class with a `make_diamond` class method

DATA STRUCTURES
- we need some way of iterating through the uppercase letters of the alphabet
  - IDEA: put the letters in an array of length 26 and use the array for iteration
  - IDEA: use ASCII numbers (and just add/subtract 1 as necessary)
- might be worth storing individual lines of the output in an array as we go, since the second half repeats lines from the first half

ALGORITHM
- set letter equal to 'A'
- set width = 1
- set line_length = 2(target_letter.ord - 65) + 1
- initialize array first_half containing one element: the string "A\n" padded
- while letter is not the target letter
  - build the new line (centered) letter + ' ' * width + letter + newline
  - add the new line to the output array
  - increment letter by 1
  - increment width by 2
- make a new array, second_half, which is first_half reversed
- middle_line = letter + ' ' * width + letter + newline
- concatenate first_half, middle_line, and second_half; join and return

=end

# rubocop:enable Layout/LineLength
class Diamond
  def self.make_diamond(target_letter)
    return "A\n" if target_letter == 'A'

    first_half = build_upper_half(target_letter)
    second_half = first_half[0, first_half.size - 1].reverse

    first_half.concat(second_half).join
  end

  class << self
    def calculate_diamond_size(target_letter)
      2 * (target_letter.ord - 65) + 1
    end

    def first_line(line_length)
      "A".center(line_length) + "\n"
    end

    def build_upper_half(target_letter)
      letter = 'B'
      width = 1
      line_length = calculate_diamond_size(target_letter)
      lines = [first_line(line_length)]

      while letter <= target_letter
        lines << (letter + ' ' * width + letter).center(line_length) + "\n"
        letter.succ!
        width += 2
      end

      lines
    end
  end
end
