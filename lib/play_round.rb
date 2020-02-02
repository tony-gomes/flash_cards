require './lib/card_generator'
require './lib/turn'
require './lib/deck'
require './lib/round'

class PlayRound
  attr_reader :deck, :round

  def initialize
    data = 'cards.txt'
    cards = CardGenerator.new(data).cards
    @deck = Deck.new(cards)
    @round = Round.new(@deck)
  end

  def intro
    puts "\n\nWelcome! You're playing with #{@deck.cards.length} cards.\n"
    puts "-------------------------------------------------\n\n"
    rounds
  end

  def rounds
    until @round.flip >= @deck.cards.length
      puts "This is card number #{@round.flip + 1} out of #{@deck.cards.length}"
      puts "Category: " + @round.current_card.category.to_s
      puts "Question: " + @round.current_card.question
      guess = gets.chomp.to_s
      take_turn = @round.take_turn(guess)
      puts "\n" + take_turn.feedback + "\n\n"
    end
    end_game
  end

  def end_game
    puts "****** Game over! ******"
    puts "You had #{@round.number_correct} correct guesses out of #{@deck.cards.length} for a total score of #{@round.percent_correct.round}%."
    final_results = @round.percent_correct_by_category
    final_results.each {|category, percent| puts category.to_s + " - " + percent.to_s + "%"}
  end
end
