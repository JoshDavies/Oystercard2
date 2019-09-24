class Oystercard
  attr_reader :balance
  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(amount)
    if @balance + amount > MAXIMUM_BALANCE
      "top_up unsuccessful - over max balance #{MAXIMUM_BALANCE}"
    else
      @balance += amount
    end
  end

end
