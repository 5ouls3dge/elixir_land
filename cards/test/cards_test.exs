defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "Create_deck makes a deck of 52 cards" do
    deck_length = length(Cards.create_deck)
    assert length(Cards.create_deck) == 52
  end

  test "Shuffle, shuffles a deck of cards" do
    deck = Cards.create_deck
    shuffled_deck = Cards.shuffle(deck)
    refute deck == shuffled_deck
  end

  test "Contains? checks if a deck of cards contains a given card" do
    deck = Cards.create_deck
    assert Cards.contains?(deck, "Ace of Clubs")
  end

  test "Deal deals a hand of cards" do
    deck = Cards.create_deck
    {hand, deck} = Cards.deal(deck, 1)
    assert hand == ["Ace of Clubs"]
  end

end
