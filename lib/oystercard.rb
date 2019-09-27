require_relative 'journey'

class Oystercard
  attr_reader :balance, :entry_station, :previous_journeys
  DEFAULT_BALANCE = 0.00
  MAXIMUM_BALANCE = 90.00
  MINIMUM_AMOUNT = 1.00

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @previous_journeys = []
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

  def touch_out(station)
    @exit_station = station
    @previous_journeys << { entry_station: @entry_station, exit_station: @exit_station}
    deduct
    @entry_station = nil
  end

  private
  def deduct(fare = MINIMUM_AMOUNT)
    @balance -= fare
  end
end
