require_relative 'test_helper'

describe 'Blackjack Score' do

  it 'can calculate the score for a pair of number cards' do
    hand = [3, 4]
    score = blackjack_score(hand)
    expect(score).must_equal 7
  end

  it 'calculates facecard values correctly' do
    hand = ['Queen', 5, 2]
    score = blackjack_score(hand)
    expect(score).must_equal 17
  end

  it 'calculates aces as 11 where it does not go over 21' do
    hand = ['Ace', 'Queen']
    score = blackjack_score(hand)
    expect(score).must_equal 21
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

end
