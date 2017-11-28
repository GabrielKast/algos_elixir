defmodule Sort.Quicksort do
  @moduledoc """
  Implementation of quicksort in Elixir
  Based on an infamous implementation in Erlang :)
  """
  
  def sort([]) do
    []
  end
  def sort([pivot | rest]) do
    sort(Enum.filter(rest, &(&1<pivot)))
    ++ [pivot]
    ++ sort(Enum.filter(rest, &(pivot<=&1)))
  end
end
