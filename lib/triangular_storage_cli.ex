defmodule TriangularStorage.CLI do
  @moduledoc """
  Provides a CLI for the triangular storage system

  Reads input from STDIN line by line terminating on the value 0, and then simulates the
  `TriangularStorage.answer/2` method for each input (x, y).

  ## Usage
    1. Only allows numeric input (text or symbol input will produce an error)
    2. Relies on user providing an even number of input values or a y value
    for each x value
  """

  def main(_args \\ []) do
    try do
      Enum.take_while(IO.stream(:stdio, :line), fn x -> x != "0\n" end)
      |> Enum.map(&(clean_input(&1)))
      |> Enum.chunk_every(2)
      |> Enum.map(fn [a, b] -> {a, b} end)
      |> Enum.map(&(handle_chunk(&1)))
    rescue
      e -> IO.puts("Error parsing input: #{e}")
    end
  end

  def handle_chunk(chunk) do
    {x, y} = chunk
    IO.puts(TriangularStorage.answer(x, y))
  end

  def clean_input(line) do
    try do
      String.trim(line) |> String.to_integer
    rescue
      _e -> raise ArgumentError, message: "Only numbers are allowed as input"
    end
  end
end