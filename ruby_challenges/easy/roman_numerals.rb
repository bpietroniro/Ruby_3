# Write some code that converts modern decimal numbers into their Roman number equivalents.

=begin
PROBLEM
- we're given a positive integer as input, and we pass it to the constructor of a `RomanNumeral` class.
- each digit place has two symbols used for representation: a symbol for "1" and a symbol for "5"
- in each digit place, representations are made with a "divmod" approach, where the "div" part corresponds to the 5 symbol, and the "mod" to the 1 symbol
  - EXCEPT in the case of "9"! Then we use the 1 symbol followed by the next higher digits 1 symbol
- ignore 0s

EXAMPLES
- we should create a `RomanNumeral` class with a `to_roman` instance method

DATA STRUCTURES
this should be interesting...
- maybe store each digit in an array for processing?
- maybe have a constant array that contains the necessary symbols corresponding to each digit place?

ALGORITHM
`to_roman`
- create an empty array for output (we will join into a string at the end)
- create an array of the decimal number's digits, reversed
- iterate through indices from 0 to the length of the digit array:
  - examine digits[index]; skip to next iteration if it is "0"
  - pass the digit, along with index, to `determine_digit_roman`
  - prepend the result to the output array
- return the output array, joined into a string (no separator)

`determine_digit_roman`
- initialize empty output string
- if the digit is "9":
  - the resulting string should be the current index's 1 symbol (which is at index 0 in the SYMBOLS array at current index), plus (index + 1)'s 1 symbol
- else:
  - calculate the quotient and remainder of the digit mod 5
  - the resulting string will be (quotient) times the 5 symbol and (remainder) times the 1 symbol, both corresponding to the current index in SYMBOLS
- return the output string

=end

class RomanNumeral
  attr_reader :decimal

  SYMBOLS = [["I", "V"], ["X", "L"], ["C", "D"], ["M"]]

  def initialize(number)
    @decimal = number
  end

  def to_roman
    roman_numerals = []
    digits = decimal.to_s.chars.reverse 
    digits.each_with_index do |digit, index|
      next if digit == 0
      roman_numerals.prepend(determine_digit_roman(digit, index))
    end

    roman_numerals.join
  end

  def determine_digit_roman(d, i)
    result = ''
    if i == 3
      result += SYMBOLS[i][0] * d.to_i
    elsif d == "9"
      result += SYMBOLS[i][0]
      result += SYMBOLS[i + 1][0]
    elsif d == "4"
      result += SYMBOLS[i][0]
      result += SYMBOLS[i][1]
    else
      fives, ones = d.to_i.divmod(5)
      result += SYMBOLS[i][1] * fives
      result += SYMBOLS[i][0] * ones
    end

    result
  end
end
