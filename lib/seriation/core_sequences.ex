defmodule Seriation.CoreSequences do
  @moduledoc """
  Generates core sequences like arithmetic, geometric, and Fibonacci.
  """

  @type sequence :: [number]
  @type arithmetic_sequence :: [number]
  @type geometric_sequence :: [number]
  @type fibonacci_sequence :: [number]

  @doc """
  Generates an arithmetic sequence starting from `start`, incrementing by `step`, with `count` total elements.

  Example:
    iex> Seriation.CoreSequences.arithmetic(1, 2, 5)
    [1, 3, 5, 7, 9]
  """
  @spec arithmetic(start :: integer, step :: integer, count :: integer) :: arithmetic_sequence
  def arithmetic(start, step, count) when is_integer(start) and is_integer(step) and is_integer(count) and count > 0 do
    Stream.iterate(start, &(&1 + step))
    |> Enum.take(count)
  end

  @doc """
  Generates a geometric sequence starting from `start`, multiplying by `ratio`, with `count` total elements.

  Example:
    iex> Seriation.CoreSequences.geometric(1, 2, 5)
    [1, 2, 4, 8, 16]
  """
  @spec geometric(start :: number, ratio :: number, count :: integer) :: geometric_sequence
  def geometric(start, ratio, count) when is_number(start) and is_number(ratio) and is_integer(count) and count > 0 do
    Stream.iterate(start, &(&1 * ratio))
    |> Enum.take(count)
  end

  @doc """
  Generates a Fibonacci sequence with `count` total elements.

  Example:
    iex> Seriation.CoreSequences.fibonacci(5)
    [0, 1, 1, 2, 3]
  """
  @spec fibonacci(count :: integer) :: fibonacci_sequence
  def fibonacci(count) when is_integer(count) and count > 0 do
    Stream.unfold({0, 1}, fn {a, b} -> {a, {b, a + b}} end)
    |> Enum.take(count)
  end
end
