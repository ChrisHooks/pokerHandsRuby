
require './high_card.rb'

describe HighCard do
  describe '#describe(hand)' do
      it 'should pick the highest card and say pair of (pair)'
    end

  describe '#compare' do
    context 'compare equal hands' do
      it 'should return with 1 if first hand is greater'
      it 'should return 0 if hands are equal'
      it 'should return -1 if first hand is lower'
    end
  end

  describe '#match?' do
    it 'should return true if there is a pair'
  end
end