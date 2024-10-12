require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  describe "initialize" do
    it "exits" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:hearts, '9', 9)
      card3 = Card.new(:diamond, '4', 4)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck).to be_an_instance_of(Deck)
    end
  end

  describe "attributes" do
    it "has cards" do
      
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:hearts, '9', 9)
      card3 = Card.new(:diamond, '4', 4)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.cards).to eq(cards)
      expect(deck.cards).to be_an(Array)
    end
  end
  describe "methods" do
    describe "rank_of_card_at" do
      it "returns rank of card at certain index" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:hearts, '9', 9)
        card3 = Card.new(:diamond, '4', 4)
        cards = [card1, card2, card3]
        deck = Deck.new(cards)

        expect(deck.rank_of_card_at(1)).to be_an(Integer)
        expect(deck.rank_of_card_at(1)).to eq(9)
        expect(deck.rank_of_card_at(2)).to be_an(Integer)
        expect(deck.rank_of_card_at(2)).to eq(4)
        expect(deck.rank_of_card_at(4)).to eq("No card in position. Please enter valid index")
      end
    end
    describe "high_ranking_card_at" do
      it "will return an array of cards in the deck that have a rank of 11 or above" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:hearts, '9', 9)
        card3 = Card.new(:diamond, '4', 4)
        card4 = Card.new(:spade, 'King', 13)
        cards = [card1, card2, card3, card4]
        deck = Deck.new(cards)

        expect(deck.high_ranking_cards).to be_an(Array)
        expect(deck.high_ranking_cards).to eq([card1, card4])
      
      end
    end
    describe "percent_high_ranking" do
      it "returns a percentage of high ranking cards in deck" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:hearts, '9', 9)
        card3 = Card.new(:diamond, '4', 4)
        card4 = Card.new(:spade, 'King', 13)
        cards = [card1, card2, card3, card4]
        deck = Deck.new(cards)

        expect(deck.percent_high_ranking).to be_a(Float)
        expect(deck.percent_high_ranking).to eq(50.00)

      end
    end
    describe "remove_card" do
      it "removes a card from the top of the deck" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:hearts, '9', 9)
        card3 = Card.new(:diamond, '4', 4)
        card4 = Card.new(:spade, 'King', 13)
        cards = [card1, card2, card3, card4]
        deck = Deck.new(cards)

        
        expect(deck.remove_card).to eq(card4)
      end
    end
    describe "add_card" do
      it "adds a new card to the deck" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:hearts, '9', 9)
        card3 = Card.new(:diamond, '4', 4)
        cards = [card1, card2, card3,]
        card4 = Card.new(:spade, 'King', 13)
        deck = Deck.new(cards)

        expect(deck.add_card(card4)).to eq([card1, card2, card3, card4,])
        expect(deck.add_card(card4)).to be_an(Array)

      end
    end


  end




end