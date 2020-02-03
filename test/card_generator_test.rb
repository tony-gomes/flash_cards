require_relative 'test_helper'
require './lib/card_generator'
require './lib/card'

class CardGeneratorTest < MiniTest::Test

  def setup
    @filename = 'cards.txt'
    @card_stack = CardGenerator.new(@filename)
  end

  def test_card_generator_exists_with_file
    assert_instance_of CardGenerator, @card_stack
    assert_equal 'cards.txt', @card_stack.filename
  end

  def test_card_generator_returns_cards
    assert_equal 5, @card_stack.cards.length

    assert_instance_of Card, @card_stack.cards.first
    assert_equal "What is the capital of Alaska?", @card_stack.cards.first.question
    assert_equal "Juneau", @card_stack.cards.first.answer
    assert_equal ":Geography", @card_stack.cards.first.category

    assert_instance_of Card, @card_stack.cards.last
    assert_equal "What is the largest planet in the solar system?", @card_stack.cards.last.question
    assert_equal "Jupiter", @card_stack.cards.last.answer
    assert_equal ":STEM", @card_stack.cards.last.category
  end
end
