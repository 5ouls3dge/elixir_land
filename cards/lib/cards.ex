defmodule Cards do
  @moduledoc"""
  A module for creating and manipulating decks of cards.
  """

  @doc """
    Creates a deck of cards.
  """
  def create_deck do
    values = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10",
     "Jack", "Queen", "King"]
    suits = ["Clubs", "Diamonds", "Hearts", "Spades"]

    for suit <- suits, value <- values do
        "#{value} of #{suit}"
    end
  end

  @doc """
    Shuffles a deck of cards.
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Checks if a deck of cards contains a given card.

    ##Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Clubs")
      true

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Deals a hand of cards.

    ##Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Clubs"]
      iex> deck

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Saves a deck of cards to a binary file on the server.
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
    Loads a deck of cards from a binary file on the server.
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, :enoent} -> "File not found, check spelling"
    end
  end

  @doc """
    Creates a hand for a player from the current state of the deck.
  """
  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
