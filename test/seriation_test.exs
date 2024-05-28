defmodule SeriationTest do
  use ExUnit.Case
  doctest Seriation


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
end
