# rubocop:disable Layout/LineLength
# Implement octal to decimal conversion.
# Given an octal input string, your program should produce a decimal output.
# Treat invalid input as octal 0.

=begin

PROBLEM
- take an input string of numerals and convert it into a decimal number
- input: string, output: integer
- invalid (non-numeric or non-octal) characters produce output 0

EXAMPLES
- strings could be formatted (i.e. have leading zeroes)
- handle non-numeric characters anywhere in the string

DATA STRUCTURES
- useful to split the input string into char array; likely reversed
- index of current char can be used to keep track of which power of 8 to multiply by

ALGORITHM
- split input string into array of chars and reverse it
- set result = 0
- iterate through chars
  - if current char is not an octal digit (0-7), return 0
  - add 8 raised to the power of current index * current_char.to_i to result
- return result

=end

# rubocop:enable Layout/LineLength

class Octal
  attr_reader :octal_str

  def initialize(octal_str)
    @octal_str = octal_str
  end

  def to_decimal
    return 0 if octal_str.match?(/[^0-7]/)
    digits = octal_str.to_i.digits
    result = 0

    digits.each_with_index do |d, i|
      result += 8**i * d.to_i
    end
    result
  end
end
