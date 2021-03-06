require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'csv'

# TODO: uncomment the next line once you start wave 3 and add lib/savings_account.rb
require_relative '../lib/savings_account'

# Because a SavingsAccount is a kind
# of Account, and we've already tested a bunch of functionality
# on Account, we effectively get all that testing for free!
# Here we'll only test things that are different.

# TODO: change 'xdescribe' to 'describe' to run these tests
describe "SavingsAccount" do
  describe "#initialize" do
    it "Is a kind of Account" do
      # Check that a SavingsAccount is in fact a kind of account
      account = Bank::SavingsAccount.new(12345, 100.0)
      account.must_be_kind_of Bank::Account
    end

    it "Requires an initial balance of at least $10" do
      # TODO: Your test code here!
      proc {
        Bank::SavingsAccount.new(12345, 5)
      }.must_raise ArgumentError
    end
  end

  describe "#withdraw" do

    #Chris's method
    before do
      @account = Bank::SavingsAccount.new(12345, 100.0)
    end

    it "Applies a $2 fee each time" do
      # TODO: Your test code here!
      @account.withdraw(12)
      @account.balance.must_equal 86
    end

    it "Outputs a warning if the balance would go below $10" do
      # TODO: Your test code here!
      withdrawal_amount = 91
      proc {
        @account.withdraw(withdrawal_amount)
      }.must_output(/.+/)
    end

    it "Doesn't modify the balance if it would go below $10" do
      # TODO: Your test code here!
      withdrawal_amount = 91
      updated_balance = @account.withdraw(withdrawal_amount)
      updated_balance.must_equal 100
      @account.balance.must_equal 100
    end

    it "Doesn't modify the balance if the fee would put it below $10" do
      # TODO: Your test code here!
      withdrawal_amount = 89
      updated_balance = @account.withdraw(withdrawal_amount)
      updated_balance.must_equal 100
      @account.balance.must_equal 100
    end
  end

  describe "#add_interest" do

    #Chris method
    before do
      @account = Bank::SavingsAccount.new(12345, 10000)
    end

    it "Returns the interest calculated" do
      # TODO: Your test code here!
      @account.add_interest(0.25).must_equal 25
    end

    it "Updates the balance with calculated interest" do
      # TODO: Your test code here!
      @account.add_interest(0.25)
      @account.balance.must_equal 10025
    end

    it "Requires a positive rate" do
      # TODO: Your test code here!
      rate = -25
      proc {
        @account.add_interest(rate)
      }.must_raise ArgumentError
    end
  end
end
