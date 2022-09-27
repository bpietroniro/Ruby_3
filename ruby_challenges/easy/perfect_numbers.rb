# Write a program that can tell whether a number is perfect,
# abundant, or deficient.

class PerfectNumber
  def self.classify(num)
    raise StandardError if num < 1

    divisor_sum = PerfectNumber.divisor_sum(num)
    return "deficient" if divisor_sum < num
    return "abundant" if divisor_sum > num
    "perfect"
  end

  class << self
    def divisor_sum(num)
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
end
