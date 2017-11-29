defmodule Sort.MergeSort do
  @moduledoc """
  Implementation of the mergesort in Elixir
  """
  def sort([]) do
    []
  end

  def sort(list) do
    do_sort(list, Enum.count(list))
  end

  defp do_sort([_] = one, _) do
    one
  end
  defp do_sort([] , _) do
    []
  end
  defp do_sort([a, b], _) do
    merge({[a], [b]})
  end
  defp do_sort(list, n) do
    new_n = Integer.floor_div(n, 2)
    {left, right} = Enum.split(list, new_n)
    merge({do_sort(left, new_n), do_sort(right, n - new_n)})
    
  end

  defp merge({[], bs}) do
    bs
  end
  defp merge({as, []}) do
    as
  end
  defp merge({[a | as ], [b | _] = bs}) when a < b do
    [a | merge({as, bs})]
  end
  defp merge({as, [b | bs]}) do
    [b | merge({as, bs})]
  end
end
