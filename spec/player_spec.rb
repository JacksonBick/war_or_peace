require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
  describe "initialize" do
    it "exits and has an name and deck" do
    card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:hearts, '9', 9)
      card3 = Card.new(:diamond, '4', 4)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      player1 = Player.new('Jackson', deck)

      expect(player1).to be_a(Player)
    end
  end
  describe "attributes" do
    it "has a name and deck" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:hearts, '9', 9)
      card3 = Card.new(:diamond, '4', 4)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      player1 = Player.new('Jackson', deck)
      player2 = Player.new('Kate', deck)
      
      expect(player1.name).to be_a(String)
      expect(player1.name).to eq('Jackson')
      expect(player2.name).to eq('Kate')
      expect(player2.deck).to be_an(Deck)
    end
  end
  describe "has_lost?" do
    it "puts if player has lost or not" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:hearts, '9', 9)
      card3 = Card.new(:diamond, '4', 4)
      cards1 = [card1, card2, card3]
      cards2 = []
      deck1 = Deck.new(cards1)
      deck2 = Deck.new(cards2)
      player1 = Player.new('Jackson', deck1)
      player2 = Player.new('Kate', deck2)

      expect(player1.has_lost?).to eq(false)
      expect(player2.has_lost?).to eq(true)
    end
  end
end