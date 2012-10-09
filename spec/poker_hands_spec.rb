require './hand.rb'

describe Hand do

    let(:high_hand) { Hand.new('AS 2C 6H 4D 5S') }
    let(:pair_hand) { Hand.new('AD 3C 3D 5S 6C') }
    let(:two_pair_hand) { Hand.new('JC 4D 6S 4C 6H') }
    let(:three_of_a_kind_hand) { Hand.new('5S 5H JD 5C AS')}

    before(:each) do
      Pair.stub :match? do |hand|
        hand == pair_hand
      end

      TwoPair.stub :match? do |hand|
        hand == two_pair_hand
      end

      ThreeOfAKind.stub :match? do |hand|
        hand == three_of_a_kind_hand
      end
    end

    context 'high card hand' do
      subject { high_hand }

      it 'should not be greater than pair' do
        should_not > pair_hand
      end

      it 'should not be greater than two pair' do
        should_not > two_pair_hand
      end

      it 'should not be greater than three of a kind' do
        should_not > three_of_a_kind_hand
      end
    end

    context 'pair hand' do
      subject { pair_hand }

      it 'should be greater than high card' do
        should > high_hand
      end

      it 'should not be greater than two pair' do
        should_not > two_pair_hand
      end

      it 'should not be greater than three of a kind' do
        should_not > three_of_a_kind_hand
      end
    end

    context 'two pair hand' do
      subject { two_pair_hand }

      it 'should be greater than high card' do
        should > high_hand
      end

      it 'should be greater than pair' do
        should > pair_hand
      end

      it 'should not be greater than three of a kind' do
        should_not > three_of_a_kind_hand
      end
    end

    context 'three of a kind hand' do
      subject { three_of_a_kind_hand }

      it 'should be greater than high card' do
        should > high_hand
      end

      it 'should be greater than pair' do
        should > pair_hand
      end

      it 'should be greater than two pair' do
        should > two_pair_hand
      end
    end
  end