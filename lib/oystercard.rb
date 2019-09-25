class Oystercard
  attr_reader :balance
  DEFAULT_BALANCE = 0.00
  MAXIMUM_BALANCE = 90.00
  MINIMUM_AMOUNT = 1.00

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @in_journey = false
  end

  def top_up(amount)
    if @balance + amount > MAXIMUM_BALANCE
      "top_up unsuccessful - over max balance #{MAXIMUM_BALANCE}"
    else
      @balance += amount
    end
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    if @balance >= MINIMUM_AMOUNT
      @in_journey = true
    else
      "Not enough money"
    end
  end

  def touch_out
    @in_journey = false
    deduct
  end

  private
  def deduct(fare = MINIMUM_AMOUNT)
    @balance -= fare
  end

end
