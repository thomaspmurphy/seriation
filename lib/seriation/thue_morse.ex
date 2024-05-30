defmodule Seriation.ThueMorse do
  @moduledoc """
  Functions for generating the Thue-Morse sequence.
  """

  @type thue_morse_sequence :: [0 | 1]

  @doc """
  Generates the Thue-Morse sequence with `count` total elements.

  The Thue-Morse sequence is a binary sequence that avoids repetition of consecutive identical subsequences.

  **Formula**:
  $$
  a_n = \text{sum of binary digits of } n \mod 2
  $$
  """
  @spec generate(integer) :: thue_morse_sequence
  def generate(count) when is_integer(count) and count > 0 do
    0..(count - 1)
    |> Enum.map(&thue_morse_element/1)
  end

  @spec thue_morse_element(integer) :: 0 | 1
  defp thue_morse_element(n) do
    Integer.digits(n, 2)
    |> Enum.sum()
    |> rem(2)
  end
end
