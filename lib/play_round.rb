require './lib/card_generator'
require './lib/turn'
require './lib/deck'
require './lib/round'

class PlayRound

  puts "\n\nChoose Your Fate\n"
  puts "-------------------------------------------------\n\n"
  puts "\n\nChoose A Deck\n"
  puts "Ruby or Trivia"

  card_path = gets.chomp.to_s
  # until card_path.downcase == "ruby" || card_path.downcase == "trivia"
  #   card_path
  # end

  if card_path.downcase == "trivia"
    data = 'trivia_cards.txt'
  elsif card_path.downcase == "ruby"
    puts "Hello Rubyist! Please identify the following methods using this syntax\n"
    puts ".method or .method_name\n"
    puts "Good Luck. You Belong Here!\n"
    data = 'ruby_cards.txt'
  end

  cards = CardGenerator.new(data).cards
  @deck = Deck.new(cards)
  @round = Round.new(@deck)

  puts "\n\nWelcome! You're playing with #{@deck.cards.length} cards.\n"
  puts "-------------------------------------------------\n\n"

  until @round.flip >= @deck.cards.length
    puts "This is card number #{@round.flip + 1} out of #{@deck.cards.length}"
    puts "Category: " + @round.current_card.category
    puts "Question: " + @round.current_card.question

    guess = gets.chomp.to_s
    take_turn = @round.take_turn(guess)
    puts "\n" + take_turn.feedback + "\n\n"
  end

  puts "****** Game over! ******"
  puts "You had #{@round.number_correct} correct guesses out of #{@deck.cards.length} for a total score of #{@round.percent_correct.round}%."
  final_results = @round.percent_correct_by_category
  final_results.each {|category, percent| puts category.to_s + " - " + percent.to_s + "%"}
end
