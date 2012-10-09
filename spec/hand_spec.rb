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
  end

  describe '#to_s' do
    it 'should list all cards as a space separated string' do
      Hand.new('AS 5H JD KC 2C').to_s.should == 'AS 5H JD KC 2C'
    end
  end
end