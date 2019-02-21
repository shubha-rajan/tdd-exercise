require "minitest"
require "minitest/spec"
require "minitest/autorun"
require "minitest/reporters"
require "minitest/pride"

require_relative "../lib/blackjack_score"

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "Blackjack Score" do
  it "can calculate the score for a pair of number cards" do

    # Arrange
    hand = [3, 4]

    # Act
    score = blackjack_score(hand)

    # Assert <-  You do this part!
    expect(score).must_equal 7
  end

  it "facecards have values calculated correctly" do
    # Arrange
    hand = ["Queen", 4]

    # Act
    score = blackjack_score(hand)

    # Assert <-  You do this part!
    expect(score).must_equal 14
  end

  it "calculates aces as 11 where it does not go over 21" do
    # Arrange
    hand = [2, 4, 1]

    # Act
    score = blackjack_score(hand)

    # Assert
    expect(score).must_equal 17
  end

  it "calculates aces as 1, if an 11 would cause the score to go over 21" do
    # Arrange
    possible_hands = [[2, 4, 1], [10, 1], [10, 10, 1], [1, 1, 1, 1]]

    # Act
    scores = possible_hands.map { |hand| blackjack_score(hand) }

    # Assert
    expect(scores).must_equal [17, 21, 21, 14]
  end

  it "raises an ArgumentError for invalid cards" do
    # Arrange
    possible_hands = [[2, "apple", 1], [15, 1], [1, 100], [1, 1, "Bubblegum", 1]]

    # Act + Assert
    possible_hands.each do |time|
      expect {
        blackjack_score(time)
      }.must_raise ArgumentError
    end
  end

  it "raises an ArgumentError for more than 5 cards in the hand" do
    # Arrange
    possible_hands = [[1, 2, 3, 4, 5, 6, 7], [8, 9, 10, "King", "Queen", "Jack"]]

    # Act + Assert
    possible_hands.each do |time|
      expect {
        blackjack_score(time)
      }.must_raise ArgumentError
    end
  end
end
