require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/blackjack_score'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
# HEY YOU! when refactor, want to make sure I have nominal pos/neg and edge cases, friend

# test1_example = [3, 4] # => 7
# test2_example = ['Queen', 5, 2] # => 19
# test3_example = ['Ace', 5, 2] # => 18
# test4_example = ['Ace', 5, 8] # => 14
# test5_example = ['Ace', 'Banana', 'Jack'] # => ArgumentError for invalid cards
# test6_example = [8, 10, 8] # => ArgumentError for score over 21


describe 'Blackjack Score' do
  it 'can calculate the score for a pair of number cards' do
    # Arrange
    hand = [3, 4]

    # Act
    score = blackjack_score(hand)

    # Assert <-  You do this part!
    expect(score).must_equal 7

  end

  it 'calculates facecard values correctly' do
    hand = ['Queen', 5, 2]
    score = blackjack_score(hand)
    expect(score).must_equal 17
  end

  it 'calculates aces as 11 where it does not go over 21' do
    hand = ['Ace', 5, 2]
    score = blackjack_score(hand)
    expect(score).must_equal 18
  end

  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do
    hand = ['Ace', 5, 8]
    score = blackjack_score(hand)
    expect(score).must_equal 14
  end

  it "will raise an error when given an invalid argument" do

    expect {
      blackjack_score('Ace', 'Banana', 'Jack') # invalid card
      blackjack_score(8, 10, 8) # over 21
      blackjack_score(2, 3, 4, 4, 2, 4) # more than 5 cards
    }.must_raise ArgumentError
  end

  # it 'raises an ArgumentError for invalid cards' do
  #   hand = ['Ace', 'Banana', 'Jack']
  #   score = blackjack_score(hand)
  #   expect(score).must_equal 18
  # end
  #
  # it 'raises an ArgumentError for scores over 21' do
  #   hand = [8, 10, 8]
  #   score = blackjack_score(hand)
  #   expect(score).must_equal 18
  # end
  #
  # it 'raises an ArgumentError if a hand of more than 5 cards is passed' do # I added
  #   hand = [2, 3, 4, 4, 2, 4]
  #   score = blackjack_score(hand)
  #   expect(score).must_equal 18
  # end
end
