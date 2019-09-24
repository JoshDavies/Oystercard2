require "oystercard"

describe Oystercard do
  let(:card) { Oystercard.new }

  describe "#balance" do
    it "displays the current balance" do
      new_card = Oystercard.new
      expect(new_card.balance).to eq described_class::DEFAULT_BALANCE
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

  describe "#deduct" do
    it "deducts fare from the balance" do
      card.top_up(described_class::MINIMUM_AMOUNT)
      fare = described_class::MINIMUM_AMOUNT
      expect(card.deduct(fare)).to eq described_class::DEFAULT_BALANCE
    end
  end

  describe "#in_journey?" do
    it "returns false when card initialized" do
      expect(card.in_journey?).to be_falsey
    end
  end

  describe "#touch_in" do
    it "sets @journey to true" do
      card.top_up(described_class::MINIMUM_AMOUNT)
      card.touch_in
      expect(card.in_journey?).to be_truthy
    end
    it "prevents touching in if card does not have enough money" do
      empty_card = Oystercard.new(0.00)
      expect(empty_card.touch_in).to eq "Not enough money"
    end
  end

  describe "#touch_out" do
    it "sets @journey to true" do
      card.touch_in
      card.touch_out
      expect(card.in_journey?).to be_falsey
    end
  end
end
