require "oystercard"

describe Oystercard do
  let(:card) { subject }

  describe "#balance" do
    it "displays the current balance" do
      expect(card.balance).to eq described_class::DEFAULT_BALANCE
    end
  end

  describe "#top_up" do
    it "adds amount to the balance" do
      card.top_up(20)
      expect(card.balance).to eq 20
    end

    it "limits balance maximum" do
      card.top_up(described_class::MAXIMUM_BALANCE)
      too_much_money = card.top_up(10)
      expect(too_much_money).to eq "top_up unsuccessful - over max balance #{described_class::MAXIMUM_BALANCE}"
    end
  end

  describe "#deduct" do
    it "deducts fare from the balance" do
      card.top_up(5.0)
      fare = 2.50
      expect(card.deduct(fare)).to eq 2.5
    end
  end

  describe "#in_journey?" do
    it "returns false when card initialized" do
      expect(card.in_journey?).to be_falsey
    end
  end

  describe "#touch_in" do
    it "sets @journey to true" do
      card.touch_in
      expect(card.in_journey?).to be_truthy
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
