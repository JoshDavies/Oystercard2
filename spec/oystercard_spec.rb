require "oystercard"
require "journey"

describe Oystercard do
  let(:card) { Oystercard.new }
  let(:entry_station) { double("Station") }
  let(:exit_station) { double("Station") }
  let(:journey){ {entry_station: entry_station, exit_station: exit_station} }

  describe "#initialize" do
    it "displays the current balance" do
      new_card = Oystercard.new
      expect(new_card.balance).to eq described_class::DEFAULT_BALANCE
    end
     it "tests for an empty journey history" do
       expect(card.previous_journeys).to be_empty
     end
  end

  describe "#top_up" do
    it "adds amount to the balance" do
      card.top_up(20.00)
      new_balance = card.balance
      expect(new_balance).to eq (described_class::DEFAULT_BALANCE + 20.00)
    end

    it "limits balance maximum" do
      too_much_money = card.top_up(described_class::MAXIMUM_BALANCE + 1.00)
      expect(too_much_money).to eq "top_up unsuccessful - over max balance #{described_class::MAXIMUM_BALANCE}"
    end
  end



  describe "#touch_in" do
    it "sets @journey to true" do
      card.top_up(described_class::MINIMUM_AMOUNT)
      card.touch_in(entry_station)
      expect(card.in_journey?).to be_truthy
    end
    it "prevents touching in if card does not have enough money" do
      empty_card = Oystercard.new(0.00)
      expect(empty_card.touch_in(entry_station)).to eq "Not enough money"
    end

    it 'remembers entry station after touch in' do
      card.top_up(5)
      card.touch_in(entry_station)
      expect(card.entry_station).to be entry_station
    end
  end

  describe "#touch_out" do
    it "sets @journey to true" do
      card.top_up(described_class::MINIMUM_AMOUNT)
      card.touch_in(entry_station)
      card.touch_out(exit_station)
      expect(card.in_journey?).to be_falsey
    end

    it "charges card on touch out" do
      card.top_up(described_class::MINIMUM_AMOUNT)
      card.touch_in(entry_station)
      expect{ card.touch_out(exit_station) }.to change{ card.balance }.by(-Oystercard::MINIMUM_AMOUNT)
    end

    it 'sets station to nil after touch out' do
      card.top_up(described_class::MINIMUM_AMOUNT)
      card.touch_in(entry_station)
      card.touch_out(exit_station)
      expect(card.entry_station).to eq nil
    end

    it 'checks that touching in and out creates one journey' do
      card.top_up(described_class::MINIMUM_AMOUNT)
      card.touch_in(entry_station)
      card.touch_out(exit_station)
      expect(card.previous_journeys).to eq [journey]
    end
  end
end
