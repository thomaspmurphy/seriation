defmodule Seriation.SpecialSequences do
  @moduledoc """
  Generates special sequences like triangular, square, pentagonal, hexagonal, and Catalan.
  """

  @type sequence :: [number]
  @type triangular_sequence :: [integer]
  @type square_sequence :: [integer]
  @type pentagonal_sequence :: [integer]
  @type hexagonal_sequence :: [integer]
  @type catalan_sequence :: [integer]

  @doc """
  Generates a triangular number sequence with `count` total elements.

  Example:
    iex> Seriation.SpecialSequences.triangular(5)
    [1, 3, 6, 10, 15]
  """
  @spec triangular(count :: integer) :: triangular_sequence
  def triangular(count) when is_integer(count) and count > 0 do
    Enum.map(1..count, fn n -> div(n * (n + 1), 2) end)
  end

  @doc """
  Generates a square number sequence with `count` total elements.

  Example:
    iex> Seriation.SpecialSequences.square(5)
    [1, 4, 9, 16, 25]
  """
  @spec square(count :: integer) :: square_sequence
  def square(count) when is_integer(count) and count > 0 do
    Enum.map(1..count, fn n -> n * n end)
  end

  @doc """
  Generates a pentagonal number sequence with `count` total elements.

  Example:
    iex> Seriation.SpecialSequences.pentagonal(5)
    [1, 5, 12, 22, 35]
  """
  @spec pentagonal(count :: integer) :: pentagonal_sequence
  def pentagonal(count) when is_integer(count) and count > 0 do
    Enum.map(1..count, fn n -> div(n * (3 * n - 1), 2) end)
  end

  @doc """
  Generates a hexagonal number sequence with `count` total elements.

  Example:
    iex> Seriation.SpecialSequences.hexagonal(5)
    [1, 6, 15, 28, 45]
  """
  @spec hexagonal(count :: integer) :: hexagonal_sequence
  def hexagonal(count) when is_integer(count) and count > 0 do
    Enum.map(1..count, fn n -> n * (2 * n - 1) end)
  end

  @doc """
  Generates a Catalan number sequence with `count` total elements.

  Example:
    iex> Seriation.SpecialSequences.catalan(5)
    [1, 1, 2, 5, 14]
  """
  @spec catalan(count :: integer) :: catalan_sequence
  def catalan(count) when is_integer(count) and count > 0 do
    Enum.map(0..(count - 1), fn n -> div(factorial(2 * n), factorial(n + 1) * factorial(n)) end)
  end

  @doc """
  Generates a Lucas number sequence with `count` total elements.

  The Lucas sequence is similar to the Fibonacci sequence, but starts with 2 and 1. The nth Lucas number is given by the formula:
  $L_n = L_{n-1} + L_{n-2}$
  with initial values:
  $L_0 = 2, L_1 = 1$
  """
  @spec lucas(count :: integer) :: sequence
  def lucas(count) when is_integer(count) and count > 0 do
    Stream.unfold({2, 1}, fn {a, b} -> {a, {b, a + b}} end)
    |> Enum.take(count)
  end

  @doc """
  Generates a harmonic series with `count` total elements.

  The nth harmonic number is given by the formula:
  $H_n = \\sum_{k=1}^n \\frac{1}{k}$
  """
  @spec harmonic(count :: integer) :: sequence
  def harmonic(count) when is_integer(count) and count > 0 do
    Enum.map(1..count, fn n -> Enum.sum(Enum.map(1..n, fn k -> 1.0 / k end)) end)
  end

  # Helper function to compute factorial recursively
  defp factorial(0), do: 1
  defp factorial(n) when n > 0 do
    n * factorial(n - 1)
  end
end
