require './lib/card'
require './lib/deck'
require './lib/player'
require 'pry'

class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end
  
  def type
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
    @spoils_of_war = []
  
    if type == :war
      @spoils_of_war << @player1.deck.cards.delete_at(2)
      @spoils_of_war << @player2.deck.cards.delete_at(2)
      @spoils_of_war << @player1.deck.cards.delete_at(1)
      @spoils_of_war << @player2.deck.cards.delete_at(1)
      @spoils_of_war << @player1.deck.cards.delete_at(0)
      @spoils_of_war << @player2.deck.cards.delete_at(0)
      print @spoils_of_war
    elsif type == :basic
      @spoils_of_war << @player1.deck.cards.delete_at(0)
      @spoils_of_war << @player2.deck.cards.delete_at(0)
      #binding.pry
      print @spoils_of_war
    elsif type == :mutually_assured_destruction
      @player1.deck.cards[2].pop
      @player2.deck.cards[2].pop
      @player1.deck.cards[1].pop
      @player2.deck.cards[1].pop
      @player1.deck.cards[0].pop
      @player2.deck.cards[0].pop
    end
    @spoils_of_war
  end

  def award_spoils(turn_winner)
    #require "pry"; binding.pry
  
    if turn_winner == @player1.name
      @player1.deck.cards.concat(@spoils_of_war).flatten
    elsif turn_winner == @player2.name
      @player2.deck.cards.concat(@spoils_of_war).flatten
    end
  end
end