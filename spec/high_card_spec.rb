
require './high_card.rb'

describe HighCard do
  describe '#describe(hand)' do
      it 'should pick the highest card and say (high card) High Hand' do
        lowCard = double 'lowCard'
        highCard = double 'highCard'

        lowCard.stub :> => false
        highCard.stub :> => true
        highCard.should_receive(:to_s).and_return('High Card')

        hand = double 'hand', :cards => [lowCard, highCard]
        HighCard.describe(hand).should == 'High Card High Hand'
      end
    end

  describe '#compare' do
    context 'compare equal hands' do
      it 'should return with 1 if first hand is greater'
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