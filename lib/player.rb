require_relative 'deck'

# initialize receives half the cards in the deck
# accepts cards after a win
# plays a card
class Player
  attr_accessor :stack
  attr_reader :name

  def initialize(name)
    @name = name
    @stack = Stack.new(cards)
  end

  def play_card
    game.receive_card(stack.flip_card)
  end

  def collect_winnings(cards)
    stack.add_cards(cards)
  end
end
