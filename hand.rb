require './card.rb'
require './high_card.rb'
class Pair; end
class TwoPair; end
class ThreeOfAKind; end

class Hand
  HAND_TYPES = [HighCard, Pair, TwoPair, ThreeOfAKind]

  def initialize(hand_string)
    @cards = hand_string.split(' ').map { |card_string| Card.new card_string }
  end

  def >(other_hand)
    hand_rank = HAND_TYPES.index(hand_type)
    other_hand_rank = HAND_TYPES.index(other_hand.hand_type)
    if(hand_rank == other_hand_rank) then
      hand_type.compare(self, other_hand) > 0
    else
      hand_rank > other_hand_rank
    end
  end

  def to_s
    cards.join ' '
  end

  protected
  def hand_value

  end

  def hand_type
    #returns the highest hand
    finder = HAND_TYPES.reverse.detect { |hand_type| hand_type.match? self }
  end

  attr_reader :cards
end