# blackjack_score.rb
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
      when 2, 3, 4, 5, 6, 7, 8, 9
        hand_score += element
      when 'Jack', 'Queen', 'King', 10, 11, 12
        hand_score += 10
      when 'Ace', 1 # when there's an ace, wait to count ace until all other cards counted
        ace_count += 1
      else
        raise ArgumentError.new("Invalid card(s) entry: '#{element}'!")
      end
    # if element is in VALID_CARDS, it is acceptable input, if it is not, return Arg err
    # if element is 2-10, element_score = element and add element_score to hand_score
    # if element is Jake-King, give each the values and add to hand_score
    # if element is 1 or ace, if hand_score + 11 > 21 then try hand_score + 1 and if that works, add 1 to hand_score, otherwise return Arg err
    # at the end of all the loops, look at hand_score. if its under 21, return it, otherwise Arg Err over 21?
    end
  end

  if ace_count > 0
    ace_count.times do |x|
        if hand_score + 11 > 21
          if hand_score + 1 > 21
            raise ArgumentError.new("Hand score is over 21!")
          else
            hand_score += 1
          end
        else
          hand_score += 11
        end
      end
  end

  if hand_score > 21
    raise ArgumentError.new("Hand score is over 21!")
  else
    return hand_score
  end
  # Code for the score value of each possible card.  Note that Ace I guess equals 1?/ Jack 11, etc?
  # If the array contains an invalid card value or the total exceeds 21, raise an ArgumentError.
  # # You should also raise an error if the hand contains more than 5 cards.
end

# below this line = testing for tests -->
# # CORRECT OUTPUT
# test1_example = [3, 4] # => 7
# p blackjack_score(test1_example)
#
# # # CORRECT OUTPUT
# test2_example = ['Queen', 5, 2] # => 17
# p blackjack_score(test2_example)
#
# # CORRECT OUTPUT
# test3_example = ['Ace', 5, 2] # => 18
# p blackjack_score(test3_example)

# # CORRECT ERROR, gave over 21 error
# test4_example = ['Ace', 5, 8] # => 14
# p blackjack_score(test4_example)

# CORRECT ERROR
# test5_example = ['Ace', 'Banana', 'Jack'] # => ArgumentError for invalid cards
# p blackjack_score(test5_example)

# # CORRECT ERROR
# test6_example = [8, 10, 8] # => ArgumentError for score over 21
# p blackjack_score(test6_example)

# CORRECT ERROR
# test7_example = [2, 3, 4, 4, 2, 4] # => ArgumentError for more than 5 cards
# p blackjack_score(test7_example)
