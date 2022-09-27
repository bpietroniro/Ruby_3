# Write a program that manages robot factory settings.

=begin

PROBLEM
- generate new random names for a robot
- rename robot when it's reset
- avoid duplicate names

EXAMPLES
- we need a `Robot` class
  - a constructor that generates a name
  - an instance method `reset`
  - an instance variable `name` with public attribute reader
  - probably a helper method that does the actually name generation
*test_name_sticks in the test file is confusing...?*
  - but it's probably just making sure we don't let users change the name
  - so no attr_writer allowed!

DATA STRUCTURES
- need to store old names for comparison with new ones; probably an array
- need a way to generate new random strings of a certain format

ALGORITHM
`generate_new_name`
- create arrays for uppercase letters and decimal digits
- initialize empty output string
- do twice: add a random uppercase letter to the output string
- do three times: add a random digit to the output string
- assign the output string to the `name` attribute

`reset`
- add current name to `@old_names`
- until the current name is not in the list of old names:
  - generate_new_name

=end

class Robot
  attr_reader :name

  @@used_names = []

  def initialize
    generate_new_name
  end

  def reset
    generate_new_name
  end

  private

  def generate_new_name
    letters = ('A'..'Z').to_a
    numbers = ('0'..'9').to_a
    loop do
      new_name = ''
      2.times { new_name += letters.sample }
      3.times { new_name += numbers.sample }
      @name = new_name
      break unless @@used_names.include?(name)
    end
    @@used_names << name
  end
end
