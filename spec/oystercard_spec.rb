require "oystercard"

describe Oystercard do
  let(:card) { subject }
  
  describe "#balance" do
    it "displays the current balalance" do
      expect(card.balance).to eq 0
    end
  end
end