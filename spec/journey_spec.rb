require 'journey'

describe Journey do
  subject(:journey) { described_class.new }

  describe '#start_journey' do
    it 'sets status to in journey' do
      expect(journey.start_journey).to be_truthy
    end
  end

  describe '#finish_journey' do
    it 'sets status to not in journey' do
      expect(journey.finish_journey).to be_falsey
    end
  end

  describe '#calculate_journey_fare' do
    it '' do

    end
  end

  describe '#in_journey?' do
    it 'confirms if a card is in journey' do
      expect(journey.in_journey?).to be_falsey
    end
  end

end
