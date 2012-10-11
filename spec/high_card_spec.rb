
require './high_card.rb'

describe HighCard do
  describe '#describe(hand)' do
    context 'should pick the highest card and say (high card) High Hand' do

      let(:low_card) { double 'low_card', :> => false }
      let(:high_card) { double 'high_card', :> => true, :to_s => 'High Card'}

      it 'the high card is the first card' do
        hand = double 'hand', :cards => [high_card, low_card, low_card, low_card, low_card]
        HighCard.describe(hand).should == 'High Card High Hand'
      end

      it 'the high card is the second card' do
        hand = double 'hand', :cards => [low_card, high_card, low_card, low_card, low_card]
        HighCard.describe(hand).should == 'High Card High Hand'
      end

      it 'the high card is the third card' do
        hand = double 'hand', :cards => [low_card, low_card, high_card, low_card, low_card]
        HighCard.describe(hand).should == 'High Card High Hand'
      end

      it 'the high card is the four card' do
        hand = double 'hand', :cards => [low_card, low_card, low_card, high_card, low_card]
        HighCard.describe(hand).should == 'High Card High Hand'
      end

      it 'the high card is the fifth card' do
        hand = double 'hand', :cards => [low_card, low_card, low_card, low_card, high_card]
        HighCard.describe(hand).should == 'High Card High Hand'
      end
    end
  end


  describe '#compare' do
    context 'compare equal hands' do
      it 'should return with 1 if first hand is greater' do
        lowCard = double 'lowCard'
        highCard = double 'highCard'
        lowHand = double 'lowHand'
        highHand = double 'highHand'

        lowHand.should_receive(:cards).and_return([lowCard, lowCard])
        highHand.should_receive(:cards).and_return([highCard, lowCard])

        HighCard.compare(highHand, lowHand).should == 1
      end

      it 'should return 0 if hands are equal'
      it 'should return -1 if first hand is lower'
    end
  end

  describe '#match?' do
    it 'should always return true' do
      hand = double 'hand'
      HighCard.match?(hand).should == true
    end
  end
end