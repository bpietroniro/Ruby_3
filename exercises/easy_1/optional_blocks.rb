def compute(arg)
  block_given? ? yield(arg) : "Does not compute."
end

=begin
p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'
=end

p compute(5) { |n| n + 3 } == 8
p compute('a') { |char| char + 'b' } == 'ab'
p compute([1, 2, 3]) { |arr| arr << 4 } == [1, 2, 3, 4]
