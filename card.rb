class Card
  CARD_VALUE_ARR = ['2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A']

  attr_reader :value, :suit

  def initialize(card_string)
    @value, @suit = card_string.split('')
  end

  def >(other_card)
    CARD_VALUE_ARR.index(value) > CARD_VALUE_ARR.index(other_card.value)
  end

  def to_s
    value + suit
  end
end