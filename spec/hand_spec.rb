class HighCard; end
class Pair; end
class TwoPair; end
class ThreeOfAKind; end

require './hand.rb'

describe Hand do
  describe '#>' do
    context 'hands are different' do
      it 'should be greater than if it is of a higher type of hand' do
        mock_hand = double 'mock_hand', :hand_type => TwoPair
        hand = Hand.new('5S 5H JD 5C AS')

        HighCard.stub       :match? => true
        Pair.stub           :match? => true
        TwoPair.stub        :match? => false
        ThreeOfAKind.stub   :match? => true

        hand.should > mock_hand
      end

      it 'should not be greater if it is of a lower type of hand' do
        mock_hand = double 'mock_hand', :hand_type => TwoPair

        hand = Hand.new('5S 5H JD 4C AS')

        HighCard.stub :match? => true
        Pair.stub     :match? => true
        TwoPair.stub  :match? => false
        ThreeOfAKind.stub   :match? => false

        hand.should_not > mock_hand
      end
    end

    context 'should be decided some other way if they are equal hand_types' do
      let(:hand) { Hand.new('5S 5H JD 4C AS') }
      let(:mock_hand) { double 'mock_hand', :hand_type => TwoPair }

      before(:each) do
        HighCard.stub :match? => true
        Pair.stub     :match? => true
        TwoPair.stub  :match? => true
        ThreeOfAKind.stub   :match? => false
      end

      it 'should be greater if mock_hand is lower' do
        TwoPair.should_receive(:compare).with(hand, mock_hand).and_return(1)
        hand.should > mock_hand
      end
      it 'should be false if mock_hand is equal' do
        TwoPair.should_receive(:compare).with(hand, mock_hand).and_return(0)
        hand.should_not > mock_hand
      end
      it 'should be false if mock_hand is higher' do
        TwoPair.should_receive(:compare).with(hand, mock_hand).and_return(-1)
        hand.should_not > mock_hand
      end
    end

    # let(:high_hand) { Hand.new('AS 2C 6H 4D 5S') }
    #     let(:pair_hand) { Hand.new('AD 3C 3D 5S 6C') }
    #     let(:two_pair_hand) { Hand.new('JC 4D 6S 4C 6H') }
    #     let(:three_of_a_kind_hand) { Hand.new('5S 5H JD 5C AS')}
    #
    #     before(:each) do
    #       HighCardFinder.stub :match? do |hand|
    #         true
    #       end
    #
    #       PairFinder.stub :match? do |hand|
    #         hand == pair_hand
    #       end
    #
    #       TwoPairFinder.stub :match? do |hand|
    #         hand == two_pair_hand
    #       end
    #
    #       ThreeOfAKind.stub :match? do |hand|
    #         hand == three_of_a_kind_hand
    #       end
    #     end
    #
    #     context 'high card hand' do
    #       subject { high_hand }
    #
    #       it 'should not be greater than pair' do
    #         should_not > pair_hand
    #       end
    #
    #       it 'should not be greater than two pair' do
    #         should_not > two_pair_hand
    #       end
    #
    #       it 'should not be greater than three of a kind' do
    #         should_not > three_of_a_kind_hand
    #       end
    #     end
    #
    #     context 'pair hand' do
    #       subject { pair_hand }
    #
    #       it 'should be greater than high card' do
    #         should > high_hand
    #       end
    #
    #       it 'should not be greater than two pair' do
    #         should_not > two_pair_hand
    #       end
    #
    #       it 'should not be greater than three of a kind' do
    #         should_not > three_of_a_kind_hand
    #       end
    #     end
    #
    #     context 'two pair hand' do
    #       subject { two_pair_hand }
    #
    #       it 'should be greater than high card' do
    #         should > high_hand
    #       end
    #
    #       it 'should be greater than pair' do
    #         should > pair_hand
    #       end
    #
    #       it 'should not be greater than three of a kind' do
    #         should_not > three_of_a_kind_hand
    #       end
    #     end
    #
    #     context 'three of a kind hand' do
    #       subject { three_of_a_kind_hand }
    #
    #       it 'should be greater than high card' do
    #         should > high_hand
    #       end
    #
    #       it 'should be greater than pair' do
    #         should > pair_hand
    #       end
    #
    #       it 'should be greater than two pair' do
    #         should > two_pair_hand
    #       end
    #     end
  end

  describe '#to_s' do
    it 'should list all cards as a space separated string' do
      Hand.new('AS 5H JD KC 2C').to_s.should == 'AS 5H JD KC 2C'
    end
  end
end