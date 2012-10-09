
class HighCard
  def self.match?(hand)
    true
  end

  def self.describe(hand)
    highest_card = nil
    hand.cards.each { |card|
      if card > highest_card then
        highest_card = card
      end
    }
    highest_card.to_s + ' High Hand'
  end
end