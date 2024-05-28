# test/seriation_test.exs
defmodule SeriationTest do
  use ExUnit.Case
  alias Seriation

  test "arithmetic sequence" do
    assert Seriation.arithmetic(1, 2, 5) == [1, 3, 5, 7, 9]
  end

  test "geometric sequence" do
    assert Seriation.geometric(2, 3, 4) == [2, 6, 18, 54]
  end

  test "fibonacci sequence" do
    assert Seriation.fibonacci(5) == [0, 1, 1, 2, 3]
  end

  test "prime sequence" do
    assert Seriation.primes(5) == [2, 3, 5, 7, 11]
  end

  test "triangular sequence" do
    assert Seriation.triangular(5) == [1, 3, 6, 10, 15]
  end

  test "square sequence" do
    assert Seriation.square(5) == [1, 4, 9, 16, 25]
  end

  test "pentagonal sequence" do
    assert Seriation.pentagonal(5) == [1, 5, 12, 22, 35]
  end

  test "hexagonal sequence" do
    assert Seriation.hexagonal(5) == [1, 6, 15, 28, 45]
  end

  test "catalan sequence" do
    assert Seriation.catalan(5) == [1, 1, 2, 5, 14]
    assert Seriation.catalan(12) == [1, 1, 2, 5, 14, 42, 132, 429, 1430, 4862, 16796, 58786]
  end

  test "lucas sequence" do
    assert Seriation.lucas(5) == [2, 1, 3, 4, 7]
  end

  test "harmonic sequence" do
    assert Seriation.harmonic(5) == [
      1.0,
      1.5,
      1.8333333333333333,
      2.083333333333333,
      2.283333333333333
    ]
  end
end
