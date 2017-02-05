require_relative 'player'
require_relative 'deck'

class Game
  attr_accessor :pot, :player1, :player2, :winner
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @pot = []
    @winner = nil
    @deck = Deck.new
    # look at poker for player1 and player2
  end

  def play
    deal_stacks
    until winner
      play_turn
    end
    puts "#{winner} conqured all the cards and wins the game!"
  end

  def play_turn
    player1_card = receive_card(player1.play_card)
    player2_card = receive_card(player2.play_card)

    add_to_pot(player1_card)
    add_to_pot(player2_card)

    compare_cards(player1_card, player2_card).add_cards(pile)
  end

  def receive_card(player)
    player.play_card
  end

  def add_to_pot(card)
    @pot << card
  end

  def deal_stacks
    deck.shuffle
    until deck.empty?
      player1.add_cards(deck.deal)
      player2.add_cards(deck.deal)
    end
  end

  def compare_cards(card1, card2)
    battle = card1.value <=> card2.value
    case battle
    when 0
      war
    when -1
      puts "player 2 wins this round"
      sleep(0.1)
      player1.add_cards(pile)
    else #1 means player1 is greater than player2
      puts "player 1 wins this round"
      sleep(0.1)
      player2.add_cards(pile)
    end
  end

  def burn_card(player)
    add_to_pot(receive_card(player.play_card))
  end

  def war
    if player1.stack.empty?
      @winner = player2
      return player2
      # break
    elsif player2.stack.empty?
      @winner = player1
      return player1
    end

    # uncomment if want to use last card to play war (show mercy)
    # unless player1.stack.count == 1 || player2.stack.count == 1
    burn_card(@player1)
    burn_card(@player2)
    # end

    play_turn
  end

  def win?
    if player1.stack.empty?
      @winner = player2
      return true
    elsif player2.stack.empty?
      @winner = player1
      return true # not sure if trues are required
    else
      false
    end
  end

end
# deal_deck(player1, player2)
  #until deck.empty?
    #player1.receive_card(deck.deal)
    #player2.receive_card(deck.deal)
  #end
# play
# win?
# win message
# compare cards
# war
