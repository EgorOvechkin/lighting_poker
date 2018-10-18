class Card
  def self.build(suit, rank)
    new(suit: suit, rank: rank)
  end
  private_class_method :new

  def initialize(suit:, rank:)
    @suit = suit
    @rank = case rank
    when :jack then 11
    when :queen then 12
    when :king then 13
    when :ace then 14
    else rank
    end
  end

  def inspect
    to_s
  end

  def suit
    @suit
  end

  def rank
    @rank
  end

  def ==(other)
    rank == other.rank && suit == other.suit
  end

  def hash
    [rank, suit].hash
  end

  def eql?(other)
    self == other
  end

  def rank_to_s(rank)
    rank > 10 ?
      {
        11 => 'J',
        12 => 'Q',
        13 => 'K',
        14 => 'A'
      }.fetch(rank) : rank
  end

  def suit_to_s(suit)
    {
      hearts: "♡ ",
      spades: "♤ ",
      diamonds: "♢ ",
      clubs: "♧ ",
    }.fetch(suit)
  end

  def to_s
    "#{rank_to_s(rank)}#{suit_to_s(suit)}"
  end

end
