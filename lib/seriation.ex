defmodule Seriation do
  @moduledoc """
  A library for generating various mathematical sequences.

  This module provides a unified interface for generating core sequences,
  special sequences, prime numbers, and composite sequences by combining or
  transforming existing sequences.
  """

  # Import functions from core sequences module
  defdelegate arithmetic(start, step, count), to: Seriation.CoreSequences
  defdelegate geometric(start, ratio, count), to: Seriation.CoreSequences
  defdelegate fibonacci(count), to: Seriation.CoreSequences

  # Import functions from special sequences module
  defdelegate triangular(count), to: Seriation.SpecialSequences
  defdelegate square(count), to: Seriation.SpecialSequences
  defdelegate pentagonal(count), to: Seriation.SpecialSequences
  defdelegate hexagonal(count), to: Seriation.SpecialSequences
  defdelegate catalan(count), to: Seriation.SpecialSequences
  defdelegate lucas(count), to: Seriation.SpecialSequences
  defdelegate harmonic(count), to: Seriation.SpecialSequences

  # Import functions from prime module
  defdelegate primes(count), to: Seriation.Prime

  # Import functions from composite sequences module
  defdelegate add_sequences(seq1, seq2), to: Seriation.CompositeSequences
  defdelegate multiply_sequences(seq1, seq2), to: Seriation.CompositeSequences
  defdelegate interleave_sequences(seq1, seq2), to: Seriation.CompositeSequences
end
