# Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

=begin
- kinds: equilateral, isosceles, scalene
  - equilateral: 3 sides equal
  - isosceles: 2 sides equal
  - scalene: side lengths unique
- if any side length is 0, throw ArgumentError
- if any side length is negative, throw ArgumentError
- if the longest side is <= the sum of the other two, throw Argument Error
=end

class Triangle
  attr_reader :kind, :sides

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3].sort
    check_valid_input
    @kind = determine_kind
  end

  def check_valid_input
    if sides[0] <= 0
      raise ArgumentError, "invalid side length; must be greater than 0"
    elsif sides[2] >= sides[0] + sides[1]
      raise ArgumentError, "invalid triangle side lengths"
    end
  end

  def determine_kind
    return case sides.uniq.count
      when 1
        "equilateral"
      when 2
        "isosceles"
      else
        "scalene"
      end
  end
end
