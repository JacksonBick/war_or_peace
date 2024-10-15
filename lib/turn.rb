require './lib/card'
require './lib/deck'
require './lib/player'

class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end
  
  def type
    #require 'pry'; binding.pry
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
        :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
        :war
    elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
        :basic
    else
      "crash"
    end
  end

  def winner
    if type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
       return @player1.name 
      elsif @player2.deck.rank_of_card_at(0) > @player1.deck.rank_of_card_at(0)
       return @player2.name 
      end
    end
    if type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        return @player1.name 
      elsif @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
        return @player2.name 
      end
    end
    if type == :mutually_assured_destruction
      :No_Winner
    end
  end

  def pile_cards
    spoils_of_war = []
    if type == :basic
      spoils_of_war << @player1.deck.cards[0]
      spoils_of_war << @player2.deck.cards[0] 
    elsif type == :war
      spoils_of_war << @player1.deck.cards[2]
      spoils_of_war << @player2.deck.cards[2]
      spoils_of_war << @player1.deck.cards[1]
      spoils_of_war << @player2.deck.cards[1]
      spoils_of_war << @player1.deck.cards[0]
      spoils_of_war << @player2.deck.cards[0]
    elsif type == :mutually_assured_destruction
      @player1.deck.cards[2].pop
      @player1.deck.cards[2].pop
      @player1.deck.cards[1].pop
      @player1.deck.cards[1].pop
      @player1.deck.cards[0].pop
      @player1.deck.cards[0].pop
    end
  end

  def award_spoils
    if winner = player1.name
    player1.deck.cards << spoils_of_war
    elsif winner = player2.name
      player2.deck.cards << spoils_of_war
    end
  end
end