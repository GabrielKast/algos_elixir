defmodule Sort.SelectionTest do
  use ExUnit.Case

  @first_list [3,2,7,12,19,4, 7]
  @first_expected [2, 3, 4, 7, 7, 12,19]

  @second_list [1, 2, 3, 1, 2, 3, 4, 1, 2]
  @second_expected [1, 1, 1, 2, 2, 2, 3, 3, 4]

  test "truth" do
    assert 1+1 == 2
  end

  test "Empty list should remain empty" do
    assert [] == Sort.Selection.sort []
  end

  test "Simple list should be sorted" do
    assert @first_expected == Sort.Selection.sort @first_list
  end

  test "Other list should be sorted" do
    assert @second_expected == Sort.Selection.sort @second_list
  end

end
