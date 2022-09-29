=begin

PROBLEM
Create a custom set type.
- elements of a `CustomSet` must be unique
- assume that all elements must be numbers
- order doesn't matter

EXAMPLES
- we need a `CustomSet` class with a:
  - constructor that takes an optional argument
    - if argument given, builds the set with that element or array,
      avoiding duplicates of course
  - instance methods `empty?`, `contains?`
  - instance method `subset?` that takes a `CustomSet` object as an argument
    and checks whether the caller is a subset of the method argument
    - a set is a subset of another if all of its elements are also elements
      of the other
    - empty sets are considered subsets of all other sets
    - two sets containing the same elements are considered subsets of
      each other
  - instance method `disjoint?`
    - two sets are disjoint if they share no elements in common
    - empty sets are considered disjoint from all other sets (including
      other empty ones) and vice versa
  - instance method `eql?` (overrides???) 
    - empty sets `eql?` other empty sets
    - two sets are `eql?` if they contain the same elements (order doesn't
      matter, duplicates obviously don't matter)
  - instance method `add` to add a new element to a set
    - again, duplicates are ignored; nothing is added if the argument is
      already an element of the set
  - instance method `intersection` that returns a new `CustomSet` that
    contains the elements that the caller and the method argument have
    in common
  - instance method `difference` that returns a new `CustomSet` containing
    only the elements from the caller that are not also contained in the
    argument
    - elements contained in the argument but not in the caller are ignored
  - instance method `union`

DATA STRUCTURES
Well, this is the question, isn't it. Let's try using a hash, why not.
- each element of a `CustomSet` is a key in a hash whose value is something
  generic, like nil, i.e. that's all we'll use as a value for any key

ALGORITHM

=end

class CustomSet
  def initialize(input=nil)
    @set = Hash.new
    if input.is_a?(Array)
      input.each { |e| add(e) }
    elsif input
      add(input)
    end
  end

  def empty?
    set.empty?
  end

  def contains?(element)
    set.include?(element)
  end

  def subset?(other)
    set <= other.set
  end

  def disjoint?(other)
    intersection(other).empty?
  end

  def eql?(other)
    set == other.set
  end

  alias_method :==, :eql?

  def add(element)
    @set[element] = nil
    self
  end

  def intersection(other)
    common_elements = set.select { |e, _| other.contains?(e) }
    CustomSet.new(common_elements.keys)
  end

  def difference(other)
    noncommon_elements = set.reject { |e, _| other.contains?(e) }
    CustomSet.new(noncommon_elements.keys)
  end

  def union(other)
    all_elements = set.merge(other.set)
    CustomSet.new(all_elements.keys)
  end

  protected

  attr_reader :set
end
