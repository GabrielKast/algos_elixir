defmodule Sort.BubbleSort do
  @moduledoc """
  Implementation of the bubblesort
  """
  def sort([]) do
    []
  end

  def sort(list) do
    do_sort(list, [], true)
  end

  defp do_sort([], sorted, true) do
    Enum.reverse(sorted)
  end
  defp do_sort([], not_sorted, _) do
    do_sort(Enum.reverse(not_sorted), [], true)
  end
  defp do_sort([a, b | rest], acc, sorted?) when a<=b do
    do_sort([b | rest], [a | acc], sorted?)
  end
  defp do_sort([a, b | rest], acc, _) do
    do_sort([a | rest], [b | acc], false)
  end
  defp do_sort([a], acc, sorted?) do
    do_sort([], [a | acc], sorted?)
  end

end
