# GAME INFO
# In the card BlackJack each card has a value.

# Number cards (2-10) carry the card's numeric value.
# Face cards on the other hand ("Jack", "Queen", "King") have a value of 10.
# Aces (1) can have a value of either 1 or 11, whichever will get the hand closest to 21 without going over.
# For example if I had a 3, a King, and an Ace, my BlackJack score is 14 (3 + 10 + 1).
# If I have an Ace, and a Jack then my score is 21 (11 + 10).

# A hand, an array of Card values, must be between 2 and 5 items inclusive.

# When a hand's score is greater than 21, the hand is a bust and the player automatically loses.

# PRELIMINARY QUESTIONS:
# # In this exercise you will write a method and set of tests in TDD fashion which calculates a hand's BlackJack score.
# What would be two nominal cases?
# What edge cases can you determine? Name at least 3.
# How would you test these cases?

# INSTRUCTIONS
# You will write a method called: blackjack_score which take an array of card values
# and returns the blackjack score. The card values can be any of the following,
# number values 1-9, "King", "Queen", "Jack".
# If the array contains an invalid card value or the total exceeds 21, raise an ArgumentError.
# For example blackjack_score([1, 5, 3]) will return 19.
# You should also raise an error if the hand contains more than 5 cards.

# In this exercise you will complete the given tests in test/blackjack_score_test.rb and
# updating the blackjack_score method in lib/blackjack_score.rb to make it pass.

# Step 1: Complete the given test
# Step 2: Update blackjack_score to pass the test
# Step 3: Move to the next test

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)
  hand_score = 0
  ace_count = 0

  if hand.length > 5
    raise ArgumentError.new("Hand must be no more than 5 cards!")
  elsif hand.length < 2
    raise ArgumentError.new("Hand must be no less than 2 cards!")
  end

  hand.map do |element|
    if VALID_CARDS.include?(element)
      case element
      when 2, 3, 4, 5, 6, 7, 8, 9, 10
        hand_score += element
      when 'Jack', 'Queen', 'King'
        hand_score += 10
      when 'Ace', 1
        ace_count += 1
      else
        raise ArgumentError.new("Invalid card(s) entry: '#{element}'!")
      end
    end
  end

  if ace_count > 0
    ace_count.times do
        if hand_score + 11 >= 22
          if hand_score + 1 >= 22
            raise ArgumentError.new("Hand score is over 21!")
          else
            hand_score += 1
          end
        else
          hand_score += 11
        end
      end
  end

  if hand_score >= 22
    raise ArgumentError.new("Hand score is over 21!")
  else
    return hand_score
  end
end
