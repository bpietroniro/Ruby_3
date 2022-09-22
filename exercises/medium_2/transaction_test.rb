require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'transaction'
class TransactionTest < Minitest::Test
  def setup
    @transaction = Transaction.new(15)
  end

  def test_prompt_for_payment_correct_amount
    transaction = Transaction.new(50)
    input = StringIO.new("50\n")
    output = StringIO.new
    assert_output("You owe $#{transaction.item_cost}.\n" \
                  "How much are you paying?\n") do
      transaction.prompt_for_payment(input: input)
    end
  end

  def test_prompt_for_payment_incorrect_amount
    transaction = Transaction.new(50)
    input = StringIO.new("40\n" + "50\n")
    output = StringIO.new
    assert_output(/That is not the correct amount/) do
      transaction.prompt_for_payment(input: input)
    end
  end
end
