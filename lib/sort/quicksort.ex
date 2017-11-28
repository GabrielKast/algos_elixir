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


  def sort_tailrec([]) do
    []
  end
  def sort_tailrec([pivot | list]) do
    {lowers, greaters} = divide(pivot, list, [], [])
    sort_tailrec(lowers) ++ [pivot] ++ sort_tailrec(greaters)
  end

  defp divide(pivot, [], lowers, greaters) do
    {lowers, greaters}
  end
  defp divide(pivot, [n | list], lowers, greaters) when n<pivot do
    divide(pivot, list, [n | lowers], greaters)
  end
  defp divide(pivot, [n | list], lowers, greaters) do
    divide(pivot, list, lowers, [n | greaters])
  end
    
end
