# Write a program that can tell whether a number is perfect, abundant, or deficient.

=begin


=end

class PerfectNumber
  def self.classify(num)
    raise StandardError.new if num < 1

    divisor_sum = PerfectNumber.divisor_sum(num)
    if divisor_sum < num
      return "deficient"
    elsif divisor_sum > num
      return "abundant"
    else
      return "perfect"
    end
  end

  private

  def self.divisor_sum(num)
    divisors = [1]

    (2..Integer.sqrt(num)).each do |n|
      if num % n == 0
        divisors << n
        divisors << num / n
      end
    end

    divisors.uniq.sum
  end
end


