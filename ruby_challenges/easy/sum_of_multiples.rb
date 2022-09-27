# rubocop:disable Layout/LineLength
# Write a program that, given a natural number and a set of one or more other numbers, can find the sum of all the multiples of the numbers in the set that are less than the first number. If the set of numbers is not given, use a default set of 3 and 5.

=begin

PROBLEM
- if given just a number, find the sum of all the multiples of 3 and 5 that are less than that number
- if given a number plus a set of other numbers, do as above but replace "3 and 5" with the new set of numbers

EXAMPLES
- we need a `to` class method that takes an integer argument
- we need a `to` instance method that takes an integer argument
- we need a constructor that takes one or more integer arguments (not an array)
- common multiples should only get added once

DATA STRUCTURES
- probably useful to store constructor arguments in an instance variable array so that we can iterate over them easily
  - splat operator?
- probably also a good idea to store multiples in an array (or a set? does Ruby do sets? I forget) so that it's easy to handle repeats

ALGORITHM
- put all the constructor arguments (factors) in an array (or use [3, 5])
- initialize an empty multiples set
- iterate through the factors array
  - set current_multiple = the current factor
  - until current_multiple >= maximum
    - add current_multiple to the set
    - add current_factor to current_multiple
- return the sum of the multiples in the set
=end

# rubocop:enable Layout/LineLength
class SumOfMultiples
  attr_reader :factors

  def initialize(*factors)
    @factors = factors.empty? ? [3, 5] : factors
  end

  def to(max_multiple)
    multiples = []
    factors.each do |factor|
      current_multiple = factor
      until current_multiple >= max_multiple
        multiples << current_multiple
        current_multiple += factor
      end
    end

    multiples.uniq.sum
  end

  def self.to(max_multiple)
    SumOfMultiples.new(3, 5).to(max_multiple)
  end
end
