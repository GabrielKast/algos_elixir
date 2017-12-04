defmodule Structs.Btree do
  @moduledoc """
  Another implementation of a binary tree in Elixir
  &insert/2 and the specs directly come from https://github.com/sashaafm/exads/blob/master/lib/data_structures/binary_tree.ex
  Great implementatoion. I needed that to understand how it works :)
  I do that implementation as an exercice

  The traverse is mine
  """
  
  @type bst_node :: %{value: any, left: :leaf | %{}, right: :leaf | %{}}

  @spec new(any) :: %{value: any, left: :leaf, right: :leaf}
  def new v do 
    %{value: v, left: :leaf, right: :leaf}
  end

  def insert tree, v do
    insert_anode tree, new(v)
  end

  def insert_anode :leaf, anode do
    anode
  end

  def insert_anode %{value: v} = tree, %{value: v_anode} = anode do
    cond do
      v>v_anode ->
	%{value: v, left: insert_anode(tree.left, anode), right: tree.right}
      v<v_anode ->
	%{value: v, left: tree.left, right: insert_anode(tree.right, anode)}
      v==v_anode ->
	raise "#{v_anode} already in the tree}"
    end
  end


  @doc """
  Example of use of &traverse/3
    ## Example :
    iex> tree = %{left: :leaf,
        right: %{left: :leaf,
          right: %{left: %{left: :leaf, right: :leaf, value: 13}, right: :leaf,
            value: 15}, value: 10}, value: 1}
    iex> Structs.Btree.print_in_order tree
    1
    10
    13
    15
  """
  def print_in_order tree do
    traverse tree, :inorder, &IO.puts/1
  end

  @doc """
  More abstract example. Implement a collect with an Agent
   ## Example : 
   iex> tree = %{left: :leaf,
        right: %{left: :leaf,
          right: %{left: %{left: :leaf, right: :leaf, value: 13}, right: :leaf,
            value: 15}, value: 10}, value: 1}
   iex> Structs.Btree.collect tree
   [1, 10, 13, 15]
  """
  def collect tree do
    {:ok, pid} = Agent.start_link(fn -> [] end)
    fun = fn(result) ->
      Agent.update(pid, fn(state) -> [result | state] end)
    end
    traverse tree, :inorder, fun
    Agent.get(pid, &(Enum.reverse(&1)))    
  end
  
  # how : 
  @doc """
  Tranverse the tree.
  Use how = :inorder :preorder or :postorder to define how to traverse the tree
  """
  def traverse %{left: left, value: value, right: right}, :inorder = how, fun do
    traverse left, how, fun
    fun.(value)
    traverse right, how, fun
  end
  def traverse %{left: left, value: value, right: right}, :postorder = how, fun do
    traverse right, how, fun
    traverse left, how, fun
    fun.(value)
  end
  def traverse %{left: left, value: value, right: right}, :preorder = how, fun do
    fun.(value)
    traverse left, how, fun
    traverse right, how, fun
  end
  def traverse :leaf, _, _ do
    :skip
  end
  
end
