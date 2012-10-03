require './hand.rb'

describe Hand do
  describe '#>' do
    it 'should rank a pair higher than a high card' do
      high_hand = Hand.new('AS 2C 6H 4D 5S')
      pair_hand = Hand.new('AD 3C 3D 5S 6C')

      (pair_hand > high_hand).should be_true
    end

    it 'should not rank a high card higher than a pair' do
      high_hand = Hand.new('AS 2C 6H 4D 5S')
      pair_hand = Hand.new('AD 3C 3D 5S 6C')

      (high_hand > pair_hand).should be_false
    end
  end
end