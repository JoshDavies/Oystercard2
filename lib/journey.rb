class Journey
  attr_reader :in_journey

  
  def start_journey
    @in_journey = true
  end

  def finish_journey
    @in_journey = false
  end

  def calculate_journey_fare
  end

  def in_journey?
    @in_journey
  end

end
