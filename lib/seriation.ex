defmodule Seriation do
  @moduledoc """
  A library for generating sequences.
  """

  @type arithmetic_sequence :: [number]
  @type geometric_sequence :: [number]
  @type fibonacci_sequence :: [number]
  @type prime_sequence :: [integer]
  @type triangular_sequence :: [integer]
  @type square_sequence :: [integer]
  @type pentagonal_sequence :: [integer]
  @type hexagonal_sequence :: [integer]
  @type catalan_sequence :: [integer]
  @type lucas_sequence :: [integer]
  @type harmonic_sequence :: [float]

  @doc """
  Generates an arithmetic sequence starting from `start`, incrementing by `step`, with `count` total elements.
  
  An arithmetic sequence is a sequence of numbers where each term after the first is found by adding a constant difference to the previous term.
  
  Example:
    iex> Seriation.arithmetic(1, 2, 5)
    [1, 3, 5, 7, 9]
  """
  @spec arithmetic(start :: integer, step :: integer, count :: integer) :: arithmetic_sequence
  def arithmetic(start, step, count) when is_integer(start) and is_integer(step) and is_integer(count) and count > 0 do
    Stream.iterate(start, &(&1 + step))
    |> Enum.take(count)
  end

  @doc """
  Generates a geometric sequence starting from `start`, multiplying by `ratio`, with `count` total elements.
  
  A geometric sequence is a sequence of numbers where each term after the first is found by multiplying the previous term by a constant ratio.
  
  Example:
    iex> Seriation.geometric(1, 2, 5)
    [1, 2, 4, 8, 16]
  """
  @spec geometric(start :: number, ratio :: number, count :: integer) :: geometric_sequence
  def geometric(start, ratio, count) when is_number(start) and is_number(ratio) and is_integer(count) and count > 0 do
    Stream.iterate(start, &(&1 * ratio))
    |> Enum.take(count)
  end

  @doc """
  Generates a Fibonacci sequence with `count` total elements.
  
  A Fibonacci sequence is a sequence of numbers where each term is the sum of the two preceding terms, starting with 0 and 1.
  
  Example:
    iex> Seriation.fibonacci(5)
    [0, 1, 1, 2, 3]
  """
  @spec fibonacci(count :: integer) :: fibonacci_sequence
  def fibonacci(count) when is_integer(count) and count > 0 do
    Stream.unfold({0, 1}, fn {a, b} -> {a, {b, a + b}} end)
    |> Enum.take(count)
  end

  @doc """
  Generates a sequence of prime numbers with `count` total elements.
  
  A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
  
  Example:
    iex> Seriation.primes(5)
    [2, 3, 5, 7, 11]
  """
  @spec primes(count :: integer) :: prime_sequence
  def primes(count) when is_integer(count) and count > 0 do
    Stream.iterate(2, &(&1 + 1))
    |> Stream.filter(&is_prime/1)
    |> Enum.take(count)
  end

  @doc """
  Generates a sequence of triangular numbers with `count` total elements.
  
  A triangular number is a number that can be represented as a triangle with dots. It counts the number of dots in the triangle with a given number of rows.
  
  Example:
    iex> Seriation.triangular(5)
    [1, 3, 6, 10, 15]
  """
  @spec triangular(count :: integer) :: triangular_sequence
  def triangular(count) when is_integer(count) and count > 0 do
    Enum.map(1..count, fn n -> div(n * (n + 1), 2) end)
  end

  @doc """
  Generates a sequence of square numbers with `count` total elements.
  
  A square number is an integer that is the square of an integer.
  
  Example:
    iex> Seriation.square(5)
    [1, 4, 9, 16, 25]
  """
  @spec square(count :: integer) :: square_sequence
  def square(count) when is_integer(count) and count > 0 do
    Enum.map(1..count, fn n -> n * n end)
  end

  @doc """
  Generates a sequence of pentagonal numbers with `count` total elements.
  
  A pentagonal number is a figurate number that represents a pentagon.
  
  Example:
    iex> Seriation.pentagonal(5)
    [1, 5, 12, 22, 35]
  """
  @spec pentagonal(count :: integer) :: pentagonal_sequence
  def pentagonal(count) when is_integer(count) and count > 0 do
    Enum.map(1..count, fn n -> div(n * (3 * n - 1), 2) end)
  end

  @doc """
  Generates a sequence of hexagonal numbers with `count` total elements.
  
  A hexagonal number is a figurate number that represents a hexagon.
  
  Example:
    iex> Seriation.hexagonal(5)
    [1, 6, 15, 28, 45]
  """
  @spec hexagonal(count :: integer) :: hexagonal_sequence
  def hexagonal(count) when is_integer(count) and count > 0 do
    Enum.map(1..count, fn n -> n * (2 * n - 1) end)
  end

  @doc """
  Generates a sequence of Catalan numbers with `count` total elements.
  
  Catalan numbers form a sequence of natural numbers that occur in various counting problems.
  
  Example:
    iex> Seriation.catalan(5)
    [1, 1, 2, 5, 14]
  """
  @spec catalan(count :: integer) :: catalan_sequence
  def catalan(count) when is_integer(count) and count > 0 do
    Enum.map(0..(count-1), fn n -> div(factorial(2 * n), factorial(n + 1) * factorial(n)) end)
  end

  @doc """
  Generates a sequence of Lucas numbers with `count` total elements.
  
  Lucas numbers are a sequence of integers named after the mathematician Édouard Lucas. They are similar to Fibonacci numbers, but each term is the sum of the two preceding terms, starting with 2 and 1.
  
  Example:
    iex> Seriation.lucas(5)
    [2, 1, 3, 4, 7]
  """
  @spec lucas(count :: integer) :: [integer]
  def lucas(count) when is_integer(count) and count > 0 do
    Stream.unfold({2, 1}, fn {a, b} -> {a, {b, a + b}} end)
    |> Enum.take(count)
  end

  @doc """
  Generates a harmonic series with `count` total elements.
  
  The harmonic series is the sum of the reciprocals of the natural numbers.
  
  Example:
    iex> Seriation.harmonic(5)
    [1.0, 1.5, 1.8333333333333333, 2.083333333333333, 2.283333333333333]
  """
  @spec harmonic(count :: integer) :: harmonic_sequence
  def harmonic(count) when is_integer(count) and count > 0 do
    Enum.map(1..count, fn n -> Enum.sum(Enum.map(1..n, fn k -> 1.0 / k end)) end)
  end  

  defp is_prime(2), do: true
  defp is_prime(3), do: true
  defp is_prime(n) when n <= 1, do: false
  defp is_prime(n) when rem(n, 2) == 0 or rem(n, 3) == 0, do: false
  defp is_prime(n) do
    max_check = :math.sqrt(n) |> floor
    5..max_check
    |> Stream.unfold(fn
      x when x > max_check -> nil
      x -> {x, x + 2}
    end)
    |> Enum.all?(fn x -> rem(n, x) != 0 and rem(n, x + 2) != 0 end)
  end  

  # Helper function to compute factorial recursively
  defp factorial(0), do: 1
  defp factorial(n) when n > 0 do
    n * factorial(n - 1)
  end
end
