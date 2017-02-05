require_relative 'card'

class Deck
  def self.all_cards
    cards = []
    Card.suits.each do |suit|
      Card.values.each do |value|
        cards << Card.new(suit, value)
      end
    end
    cards
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def shuffle
    @cards.shuffle
  end

  def deal
    @cards.shift
  end

  def return(cards)
    @cards.concat(cards)
  end
end
#create 52 cards
#shuffle
#deal card
#return cards
