defmodule Seriation.ThueMorseTest do
  use ExUnit.Case
  alias Seriation.ThueMorse

  @moduletag :thue_morse

  describe "Thue-Morse Sequence" do
    test "generate sequence of length 1" do
      assert ThueMorse.generate(1) == [0]
    end

    test "generate sequence of length 2" do
      assert ThueMorse.generate(2) == [0, 1]
    end

    test "generate sequence of length 4" do
      assert ThueMorse.generate(4) == [0, 1, 1, 0]
    end

    test "generate sequence of length 8" do
      assert ThueMorse.generate(8) == [0, 1, 1, 0, 1, 0, 0, 1]
    end

    test "generate sequence of length 16" do
      expected = [0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0]
      assert ThueMorse.generate(16) == expected
    end

    test "generate sequence of length 10" do
      expected = [0, 1, 1, 0, 1, 0, 0, 1, 1, 0]
      assert ThueMorse.generate(10) == expected
    end
  end
end
