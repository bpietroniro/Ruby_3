# rubocop:disable Layout/LineLength
# Write a program that will take a string of digits and return all the possible consecutive number series of a specified length in that string.

=begin

PROBLEM
- input: a string containing a series of digits, and an integer representing the desired lengths of the output elements
- output: an array containing slices of the input string of the given length
  - N.B. slices should be in the form of sub-arrays, not strings; elements of the sub0arrays are integers

EXAMPLES
- we need a `Series` class with a constructor that takes the digit string as an argument and a `slices` method that takes the length as an argument
- should throw an error if the given length is greater than the digit string size

DATA STRUCTURES
- probably makes sense to turn the digit string into an array of integers

ALGORITHM
- raise an error if the size argument is greater than the number of digits we have
- initialize empty output array
- iterate through indices from 0 up to digits.length - size
  - take a slice of `digits` of length `size` and append it to the output array
- return the output array

=end

# rubocop:enable Layout/LineLength
class Series
  attr_reader :digits

  def initialize(digit_str)
    @digits = digit_str.chars.map(&:to_i)
  end

  def slices(size)
    raise ArgumentError if size > digits.size
    output = []
    0.upto(digits.length - size) { |index| output << digits[index, size] }
    output
  end
end
