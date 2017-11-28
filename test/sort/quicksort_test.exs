defmodule Sort.QuicksortTest do
  @moduledoc """
  test for the first implementation of 
  quicksort with for comprehesion (changed for a filter in fact..)
  """
  
  use Sort.SortMainTests, sort_fun: &Sort.Quicksort.sort/1
end

defmodule Sort.QuicksortTailRecTest do
  @moduledoc """
  test for the second implementation of 
  quicksort with tailrec
  """
  use Sort.SortMainTests, sort_fun: &Sort.Quicksort.sort_tailrec/1  
end

