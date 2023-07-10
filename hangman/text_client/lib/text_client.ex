defmodule TextClient do

  @spec start() :: :ok
  defdelegate start(), to: TextClient.Core.Player
end
