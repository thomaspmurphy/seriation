defmodule Seriation.Prime do
  @moduledoc """
  Generates prime numbers and provides a prime-checking function.
  """

  @type prime_sequence :: [integer]

  @doc """
  Generates a sequence of prime numbers with `count` total elements.

  Example:
    iex> Seriation.Prime.primes(5)
    [2, 3, 5, 7, 11]
  """
  @spec primes(count :: integer) :: prime_sequence
  def primes(count) when is_integer(count) and count > 0 do
    Stream.iterate(2, &(&1 + 1))
    |> Stream.filter(&is_prime/1)
    |> Enum.take(count)
  end

  @doc """
  Checks if a given integer is prime.
  """
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
end
