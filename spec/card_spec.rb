require './card.rb'

describe Card do
  describe '#value' do
    it 'should return the value as a string' do
      Card.new('2S').value.should == '2'
    end
  end

  describe '#>' do
    let(:two_diamonds)  { Card.new('2D') }
    let(:nine_clubs)    { Card.new('9C') }
    let(:ten_hearts)    { Card.new('TH') }
    let(:jack_clubs)    { Card.new('JC') }
    let(:queen_spades)  { Card.new('QS') }
    let(:king_hearts)   { Card.new('KH') }
    let(:ace_spades)    { Card.new('AS') }

    context 'two diamonds' do
      subject { two_diamonds }
      it do should_not > two_diamonds end

      it do should_not > nine_clubs end

      it do should_not > ten_hearts end

      it do should_not > jack_clubs end

      it do should_not > queen_spades end

      it do should_not > king_hearts end

      it do should_not > ace_spades end
    end

    context 'nine clubs' do
      subject { nine_clubs }
      it do should > two_diamonds end

      it do should_not > nine_clubs end

      it do should_not > ten_hearts end

      it do should_not > jack_clubs end

      it do should_not > queen_spades end

      it do should_not > king_hearts end

      it do should_not > ace_spades end
    end

    context 'ten hearts' do
      subject { ten_hearts }

      it do should > two_diamonds end

      it do should > nine_clubs end

      it do should_not > ten_hearts end

      it do should_not > jack_clubs end

      it do should_not > queen_spades end

      it do should_not > king_hearts end

      it do should_not > ace_spades end
    end

    context 'jack clubs' do
      subject { jack_clubs }

      it do should > two_diamonds end

      it do should > nine_clubs end

      it do should > ten_hearts end

      it do should_not > jack_clubs end

      it do should_not > queen_spades end

      it do should_not > king_hearts end

      it do should_not > ace_spades end
    end

    context 'queen spades' do
      subject { queen_spades }

      it do should > two_diamonds end

      it do should > nine_clubs end

      it do should > ten_hearts end

      it do should > jack_clubs end

      it do should_not > queen_spades end

      it do should_not > king_hearts end

      it do should_not > ace_spades end
    end

    context 'king hearts' do
      subject { king_hearts }

      it do should > two_diamonds end

      it do should > nine_clubs end

      it do should > ten_hearts end

      it do should > jack_clubs end

      it do should > queen_spades end

      it do should_not > king_hearts end

      it do should_not > ace_spades end
    end

    context 'ace spades' do
      subject { ace_spades }

      it do should > two_diamonds end

      it do should > nine_clubs end

      it do should > ten_hearts end

      it do should > jack_clubs end

      it do should > queen_spades end

      it do should > king_hearts end

      it do should_not > ace_spades end
    end
  end

  describe '#to_s' do
    it 'should return the Card as a string pair' do
      Card.new('AS').to_s.should == 'AS'
    end
  end
end