require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @cash_register = CashRegister.new(100)
    @sample_transaction = Transaction.new(10)
  end

  def test_accept_money
    @sample_transaction.amount_paid = 10
    previous_amount = @cash_register.total_money
    @cash_register.accept_money(@sample_transaction)
    new_amount = @cash_register.total_money
    assert_equal(previous_amount + 10, new_amount)
  end

  def test_change
    @sample_transaction.amount_paid = 20
    assert_equal(10, @cash_register.change(@sample_transaction))
  end

  def test_give_receipt
    assert_output("You've paid $#{@sample_transaction.item_cost}.\n", '') do
      @cash_register.give_receipt(@sample_transaction)
    end
  end
end
