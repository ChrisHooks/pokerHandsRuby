
require './high_card'

describe HighCard do
  describe '#to_s(hand)' do
    it 'should pick the highest card and say (high card) High Hand'
     #HighCard.to_s(hand).should == 'High Card High Hand'
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