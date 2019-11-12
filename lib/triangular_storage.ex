defmodule TriangularStorage do
    @moduledoc """
    Provides functions to get item ids in our triangular storage warehouse

    ## How it works

      Triangular storage provides a function `answer/2` that gets the id of a box at location (x, y). The
      function first traverses from left to right getting the id of the box at column x on the first row. The
      function then traverses up the column to row y returning the id of the box there.

    ## Stack optimization

      Normally each recursive call would require a new stack frame but we take advantage of the compiler's
      tail call optimization by making the recursive call to `get_nth_triangular/3` at the end of the function.
      This approach (tail recursion) uses constant stack space.
    """

    @acc_seed 1
    @add_seed 2

    @doc """
    Returns the id of the box at column x and row y

    ## Parameters

      - x: column of the box starting from the left
      - y: row of the box starting from the bottom

    ## Examples

      iex> TriangularStorage.answer(2, 2)
      "5"

      iex> TriangularStorage.answer(4, 1)
      "10"

      iex> TriangularStorage.answer(612, 231)
      "354673"
    """
    @spec answer(number, number) :: charlist
    def answer(x, y) do
      x_base = get_nth_triangular(x)
      get_nth_triangular(y, x_base, x) |> to_string()
    end

    @doc """
    Returns nth value in a triangular sequence

    The `acc` and `add` parameters can be seeded to begin the
    sequence with values other than 1 and 2.

    ## Parameters

      - n: which item in the sequence to return
      - acc: sum of the added values
      - add: the value to add to accumulated for the iteration

    ## Examples

      iex> TriangularStorage.get_nth_triangular(3)
      6

      iex> TriangularStorage.get_nth_triangular(3, 3, 10)
      24
    """
    @spec get_nth_triangular(number, number, number) :: number
    def get_nth_triangular(n, acc \\ @acc_seed, add \\ @add_seed)
    def get_nth_triangular(1, acc, _add), do: acc
    def get_nth_triangular(n, acc, add) when n > 1, do: get_nth_triangular(n - 1, acc + add, add + 1)
    def get_nth_triangular(n, _acc, _add) when n < 1, do: raise ArgumentError, message: "Only positive numbers (n > 0) allowed"
end
