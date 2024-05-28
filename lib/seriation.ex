defmodule Seriation do
  @moduledoc """
  A library for generating sequences.
  """

  @doc """
  Generates an arithmetic sequence starting from `start`, incrementing by `step`, with `count` total elements.
  """
  def arithmetic(start, step, count) when is_integer(start) and is_integer(step) and is_integer(count) and count > 0 do
    Stream.iterate(start, &(&1 + step))
    |> Enum.take(count)
  end

  @doc """
  Generates a geometric sequence starting from `start`, multiplying by `ratio`, with `count` total elements.
  """
  def geometric(start, ratio, count) when is_number(start) and is_number(ratio) and is_integer(count) and count > 0 do
    Stream.iterate(start, &(&1 * ratio))
    |> Enum.take(count)
  end

 @doc """
  Generates a Fibonacci sequence with `count` total elements.
  """
  def fibonacci(count) when is_integer(count) and count > 0 do
    Stream.unfold({0, 1}, fn {a, b} -> {a, {b, a + b}} end)
    |> Enum.take(count)
  end

  @doc """
  Generates a sequence of prime numbers with `count` total elements.
  """
  def primes(count) when is_integer(count) and count > 0 do
    Stream.iterate(2, &(&1 + 1))
    |> Stream.filter(&is_prime/1)
    |> Enum.take(count)
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
    |> Enum.all?(fn x -> rem(n, x) != 0 and rem(n, x + 2) != 0   end)
  end
end
