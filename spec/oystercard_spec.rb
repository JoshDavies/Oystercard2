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



end
