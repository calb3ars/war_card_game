# initialize receives half the cards in the deck
  # count variable
# accepts cards after a win
  # holds cards in side pot
  # pushes cards to bottom of the deck when main deck is empty
# plays a card
# burn card
class Hand
  attr_accessor :cards,

  def self.deal_from(deck)
    Hand.new(game.deal_deck)
  end

  def initialize(cards)
    @cards = cards
  end

  def flip_card
    @cards.pop.value
  end

  def burn_card
    @cards.pop
  end

  def add_cards(cards)
    @cards.unshift(cards)
  end
end
