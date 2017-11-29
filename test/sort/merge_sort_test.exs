defmodule Sort.MergesortTest do
  use Sort.SortMainTests, sort_fun: &Sort.MergeSort.sort/1
end
