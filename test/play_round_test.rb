require_relative 'test_helper'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/play_round'

class PlayRoundTest < MiniTest::Test

  def setup
    @new_game = PlayRound.new
  end

  def test_play_round_exists
    assert_instance_of PlayRound, @new_game
  end

  def test_play_round_has_deck_with_cards
    assert_instance_of Deck, @new_game.deck
    assert_instance_of Card, @new_game.deck.cards.first
    assert_instance_of Card, @new_game.deck.cards.last
  end
end
