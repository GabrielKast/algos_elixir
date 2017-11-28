defmodule Sort.Selection do
  @moduledoc """
  Sort by selection
  """

  @doc """
  Hello world.

  ## Examples

      iex> Algos.hello
      :world

  """
  def sort(list) when is_list(list) do
    do_sort list, []
  end

  def do_sort([i|rest], acc) do
    {lowers, greaters} = Enum.split_with(acc,  &(&1<i))
    do_sort rest, lowers ++ [i] ++ greaters
  end
  def do_sort([], result) do
    result
  end
end
