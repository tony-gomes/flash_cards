require_relative 'test_helper'
require './lib/card'
require './lib/deck'

class DeckTest < MiniTest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    
    @deck = Deck.new(@cards)
  end

  def test_deck_exists_with_cards
    assert_instance_of Deck, @deck
    assert_equal [@card_1, @card_2, @card_3], @deck.cards
  end

  def test_deck_count_method
    assert_equal 3, @deck.count

    card_4 = Card.new("What is the largest planet in the solar system", "Jupiter", :STEM)
    @cards << card_4

    assert_equal 4, @deck.count
  end

  def test_deck_cards_in_category_method
    assert_equal [@card_2, @card_3], @deck.cards_in_category(:STEM)
    assert_equal [@card_1], @deck.cards_in_category(:Geography)
    assert_equal [], @deck.cards_in_category("Pop Culture")
  end
end
