class Oystercard
  attr_reader :balance, :entry_station
  DEFAULT_BALANCE = 0.00
  MAXIMUM_BALANCE = 90.00
  MINIMUM_AMOUNT = 1.00

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

  def in_journey?
    !!@entry_station
  end

  def touch_in(station)
    if @balance >= MINIMUM_AMOUNT
      @entry_station = station
    else
      "Not enough money"
    end
  end

  def touch_out
    @entry_station = nil
    deduct
  end

  private
  def deduct(fare = MINIMUM_AMOUNT)
    @balance -= fare
  end

end
