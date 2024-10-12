require 'rspec'
require './../lib/card'
require './../lib/deck'
require './../lib/player'

RSpec.describe Player do
  describe "initialize" do
    it "exits and has an name and deck" do
    card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:hearts, '9', 9)
      card3 = Card.new(:diamond, '4', 4)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      player = Player.new('Jackson', deck)

      expect(player).to be_a(Player)
    end
  end
end