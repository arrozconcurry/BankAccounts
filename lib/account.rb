module Bank
  class Account
    attr_reader :id, :balance
    def initialize(id, balance)
      #error message not appearing in def withdraw
      raise ArgumentError.new("balance must be >= 0") if balance < 0

      @id = id
      @balance = balance
    end

    def withdraw(amount)
      # TODO: implement withdraw
      start_balance = @balance
      withdrawal_amount = amount
      @balance = start_balance - withdrawal_amount
    end

    def deposit(amount)
      # TODO: implement deposit
      start_balance = @balance
      deposit_amount = amount
      @balance = start_balance + deposit_amount
    end
  end
end
