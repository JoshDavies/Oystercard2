class Oystercard
  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def add_amount(amount)
    @balance += amount
  end

end