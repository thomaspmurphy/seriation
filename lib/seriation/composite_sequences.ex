defmodule Seriation.CompositeSequences do

  @type sequence :: [number]

  @doc """
  Adds two sequences element-wise to generate a new sequence.

  Example:
    iex> Seriation.add_sequences([1, 2, 3], [4, 5, 6])
    [5, 7, 9]
  """
  @spec add_sequences(seq1 :: sequence, seq2 :: sequence) :: sequence
  def add_sequences(seq1, seq2) when length(seq1) == length(seq2) do
    Enum.zip(seq1, seq2)
    |> Enum.map(fn {a, b} -> a + b end)
  end

  @doc """
  Multiplies two sequences element-wise to generate a new sequence.

  Example:
    iex> Seriation.multiply_sequences([1, 2, 3], [4, 5, 6])
    [4, 10, 18]
  """
  @spec multiply_sequences(seq1 :: sequence, seq2 :: sequence) :: sequence
  def multiply_sequences(seq1, seq2) when length(seq1) == length(seq2) do
    Enum.zip(seq1, seq2)
    |> Enum.map(fn {a, b} -> a * b end)
  end

  @doc """
  Interleaves two sequences to generate a new sequence.

  Example:
    iex> Seriation.interleave_sequences([1, 3, 5], [2, 4, 6])
    [1, 2, 3, 4, 5, 6]
  """
  @spec interleave_sequences(seq1 :: sequence, seq2 :: sequence) :: sequence
  def interleave_sequences(seq1, seq2) do
    Enum.zip(seq1, seq2)
    |> Enum.flat_map(fn {a, b} -> [a, b] end)
  end
end
