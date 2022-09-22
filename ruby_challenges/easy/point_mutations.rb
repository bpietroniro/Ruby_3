# Write a program that can calculate the Hamming distance between two DNA strands.

=begin
PROBLEM
- compare two DNA strands by counting the number of nucleotides (positions) where the two strands have different bases (point mutations)
  - i.e. compare two strings index by index, and count differences
- strands need to be equal length for comparison
  - if given two of unequal length, use the shorter length

EXAMPLES
- need a DNA class that initializes with a string representing a DNA strand
- two empty strands have a Hamming distance of 0
- `hamming_distance` should be either a function that returns an integer, or an instance variable (with a getter)
- strands should be left unchanged

DATA STRUCTURES
- probably a good idea for DNA objects to have a `strand` instance variable
- see above re: `hamming_distance`

ALGORITHM

=end

class DNA
  def initialize(strand)
    @strand = strand
  end
end
