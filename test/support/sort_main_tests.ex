defmodule Sort.SortMainTests  do
  @moduledoc """
  A way to have the same tests for all the sort modules
  @see https://blog.codeminer42.com/how-to-test-shared-behavior-in-elixir-3ea3ebb92b64
  """
  defmacro __using__(options) do
    quote do
      use ExUnit.Case, async: :true

      @first_list [3,2,7,12,19,4, 7]
      @first_expected [2, 3, 4, 7, 7, 12,19]

      @second_list [1, 2, 3, 1, 2, 3, 4, 1, 2]
      @second_expected [1, 1, 1, 2, 2, 2, 3, 3, 4]

      @no_change_list [2, 3, 4, 7, 7, 12,19]
      @no_change_expected [2, 3, 4, 7, 7, 12,19]

      @reverse_list [19, 12, 7, 7, 4, 3, 2]
      @reverse_expected [2, 3, 4, 7, 7, 12,19]

      @moduletag unquote(options)
      
      test "truth" do
	assert 1+1 == 2
      end

      test "Empty list should remain empty", %{sort_fun: sort_fun}  do
	assert [] == sort_fun.([])
      end

      test "Simple list should be sorted", %{sort_fun: sort_fun} do
	assert @first_expected == sort_fun.(@first_list)
      end

      test "Other list should be sorted", %{sort_fun: sort_fun} do
	assert @second_expected == sort_fun.(@second_list)
      end

      test "Sort an already sorted list", %{sort_fun: sort_fun} do
	assert @no_change_expected == sort_fun.(@no_change_list)
      end

      test "Reverse a list", %{sort_fun: sort_fun} do
	assert @reverse_expected == sort_fun.(@reverse_list)
      end

    end
  end
  
end
