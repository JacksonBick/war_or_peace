require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index) #index location of card to be used
    @index = cards[index].rank
  end

  def high_ranking_cards #return array of cards ranked <=11
    cards.find_all do |card|
      card.rank >= 11
    end
  end

  def percent_high_ranking #percentage of high ranking cards
    cards_total = cards.length.to_f 
    high_ranking_total = high_ranking_cards.length.to_f

    percentage = (high_ranking_total / cards_total) * 100
    percentage

  end
  
  def remove_card #remove top card of the deck
    cards.shift do |card|

    end
  end

  def add_card(card) #will add a card to the bottom
    cards.push(card) do |card|

    end
  end
end