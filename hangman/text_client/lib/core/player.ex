defmodule TextClient.Core.Player do

  @typep game :: Hangman.game
  @typep tally :: Hangman.tally
  @typep state :: { game, tally }

  @spec start() :: :ok
  def start() do
    game = Hangman.new_game()
    tally = Hangman.tally(game)
    interact({ game, tally })
  end

  @spec interact(state) :: :ok

  def interact({_game, _tally = %{ game_state: :won } }) do
    IO.puts "You won!"
  end

  def interact({_game, tally = %{ game_state: :lost } }) do
    IO.puts("Sorry, you lost... the word was #{tally.letters |> Enum.join()}")  end

  def interact({ game, tally }) do
    IO.puts(feedback_for(tally))
    IO.puts(current_word(tally))
    Hangman.make_move(game, get_guess())
    |> interact()
  end

  def feedback_for(tally = %{ game_state: :initializing }) do
    "Welcome to Hangman! #{tally.letters |> length} word"
  end

  def feedback_for( %{ game_state: :good_guess }),   do: "Good guess!"
  def feedback_for( %{ game_state: :bad_guess }),    do: "Bad guess!"
  def feedback_for( %{ game_state: :already_used }), do: "You already used that letter!"

  def current_word(tally) do
    [
      "word_progress: ",
      tally.letters |> Enum.join(" "),
      "   turns_left: ",
      tally.turns_left |> Integer.to_string,
      "         used: ",
      tally.used |> Enum.join(",")
    ]
  end

  def get_guess() do
    IO.gets("Next Guess: ")
    |> to_string()
    |> String.trim()
    |> String.downcase()
  end

end
