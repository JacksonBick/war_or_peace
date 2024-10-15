require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  describe "initialize" do
    it "exists" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:hearts, '9', 9)
      card3 = Card.new(:diamond, '4', 4)
      cards1 = [card1, card2, card3]
      cards2 = []
      deck1 = Deck.new(cards1)
      deck2 = Deck.new(cards2)
      player1 = Player.new('Jackson', deck1)
      player2 = Player.new('Kate', deck2)
      turn = Turn.new(player1, player2)
      
      expect(turn).to be_a(Turn)
    end
  end
  describe "attributes" do
    it "displays player1, player2, and spoils of war" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:hearts, '9', 9)
      card3 = Card.new(:diamond, '4', 4)
      cards1 = [card1, card2, card3]
      cards2 = []
      deck1 = Deck.new(cards1)
      deck2 = Deck.new(cards2)
      player1 = Player.new('Jackson', deck1)
      player2 = Player.new('Kate', deck2)
      turn = Turn.new(player1, player2)

      expect(turn.player1).to eq(player1)
      expect(turn.player2.name).to eq('Kate')
      expect(turn.player2.deck).to eq(deck2)
      expect(turn.player2.deck.cards).to eq(cards2)
    end
  end
  describe "type" do
    it "displays what type of turn it is" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:hearts, '9', 9)
      card3 = Card.new(:diamond, '4', 4)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new('Jackson', deck1)
      player2 = Player.new('Kate', deck2)
      turn = Turn.new(player1, player2)

      expect(turn.type).to eq(:basic)
    end
  end
  describe "winner" do
    it "will determine the winner of turn" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:hearts, '9', 9)
      card3 = Card.new(:diamond, '4', 4)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new('Jackson', deck1)
      player2 = Player.new('Kate', deck2)
      turn = Turn.new(player1, player2)

      expect(turn.winner).to eq('Jackson')
    end
  end
  describe "pile_cards" do
    it "sends cards to the spiols of war array" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:hearts, '9', 9)
      card3 = Card.new(:diamond, '4', 4)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card1, card4, card6, card7])
      player1 = Player.new('Jackson', deck1)
      player2 = Player.new('Kate', deck2)
      turn = Turn.new(player1, player2)

      expect(turn.pile_cards).to eq([card5, card6, card2, card4, card1, card1])
    end
  end

end