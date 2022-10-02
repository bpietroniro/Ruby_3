# Write a method that returns a list of all the divisors of the positive
# integer passed in as an argument. The return value can be in any sequence
# you wish.

=begin

- add 1 to output
- check for divisorhood from 2 through sqrt(n)
- add n to output

=end

def divisors(n)
  return [1] if n == 1

  divs_array = []
  1.upto(Math.sqrt(n)) do |candidate|
    if n % candidate == 0
      divs_array << candidate
      divs_array << n / candidate unless candidate == Math.sqrt(n)
    end
  end

  divs_array.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
