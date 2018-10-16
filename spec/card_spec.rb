require 'set'
require 'card'

describe Card do
  def card(params = {})
    defaults = {
      suit: :love,
      rank: 6
    }

    Card.build(*defaults.merge(params).values_at(:suit, :rank))
  end

  it 'has a suit' do
    # actual = card(suit: :spades).suit
    # expected = :spades
    # raise "Expected #{expected.inspect}, got #{actual.inspect}" unless actual == expected
    expect(card(suit: :spades).suit).to eq(:spades)
  end

  it 'has a rank' do
    # raise unless card(rank: 4).rank == 4
    expect(card(rank: 4).rank).to eq 4
  end

  context 'equality' do
    # def subject
    #   @subject ||= card(suit: :spades, rank: 4)
    # end
    subject { card(suit: :spades, rank: 4) }

    describe 'comparing against self' do
      let(:other) { card(suit: :spades, rank: 5) }
      # def other
      #   other ||= card(suit: :spades, rank: 5)
      # end

      it 'is equal' do
        other = card(suit: :spades, rank: 4)

        expect(subject).to eq(other)
      end

      it 'is hash equal' do
        other = card(suit: :spades, rank: 4)

        expect(Set.new([subject, other]).size).to eq(1)
      end
    end

    shared_examples_for 'an unequal card' do
      it 'is not equal' do
        expect(subject).not_to eq(other)
      end

      it 'is not hash equal' do
        raise unless Set.new([subject, other]).size == 2
      end
    end

    describe 'comparing to a card of different suit' do
      let(:other) { card(suit: :spades, rank: 5) }

      it_behaves_like 'an unequal card'
    end

    describe 'comparing to a card of different rank' do
      let(:other) { card(suit: :spades, rank: 5) }

      it_behaves_like 'an unequal card'
    end

    describe 'a jack' do
      it 'ranks higher than a 10' do
        lower = card(rank: 10)
        higher = card(rank: :jack)

        expect(card(rank: 10).rank).to be < card(rank: :jack).rank
      end
    end

    describe 'a queen' do
      it 'ranks higher than a jack' do
        lower = card(rank: :jack)
        higher = card(rank: :queen)

        raise unless higher.rank > lower.rank
      end
    end


    describe 'a king' do
      it 'ranks higher than a queen' do
        lower = card(rank: :queen)
        higher = card(rank: :king)

        raise unless higher.rank > lower.rank
      end
    end
  end
end
