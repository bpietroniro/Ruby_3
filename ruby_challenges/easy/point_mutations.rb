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
- `hamming_distance` should be an instance method that returns an integer 
- strands should be left unchanged

DATA STRUCTURES
- probably a good idea for DNA objects to have a `strand` instance variable
- see above re: `hamming_distance`

ALGORITHM
to calculate Hamming distance:
- initialize count at 0
- get length of smaller strand (or both if they're equal)
- from 0 to that length:
  - compare chars at each index between the two strands
  - whenever they are different, increment count by 1
- return count
=end

class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    count = 0
    length = [strand.length, other_strand.length].min
    return 0 if length == 0

    (0...length).each do |i|
      count += 1 if strand[i] != other_strand[i]
    end

    count
  end
end
