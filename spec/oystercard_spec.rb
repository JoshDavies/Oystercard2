require "oystercard"

describe Oystercard do
  let(:card) { subject }
  
  describe "#balance" do
    it "displays the current balance" do
      expect(card.balance).to eq 0
    end
  end

  describe "#add_amount" do
    it "adds amount to the balance" do
      card.add_amount(20)
      expect(card.balance).to eq 20
    end
  end
end