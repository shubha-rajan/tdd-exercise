# blackjack_score.rb

VALID_CARDS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, "King", "Queen", "Jack"]

def blackjack_score(hand)
  if hand.length > 5
    raise ArgumentError, "You can't have more than 5 cards in a hand. Current hand size is #{hand.length}."
  end
  hand.each do |card|
    if !VALID_CARDS.include?(card)
      raise ArgumentError, "#{card} is not a valid card."
    end
  end
  hand_scores = hand.map do |card|
    case card
    when "Queen", "King", "Jack"
      10
    else
      card
    end
  end

  score = 0

  if hand_scores.include?(1)
    score_without_aces = hand_scores.sum
    if (score_without_aces + 10) <= 21
      score = score_without_aces + 10
    else
      score = score_without_aces
    end
  else
    score = hand_scores.sum
  end

  return score
end
