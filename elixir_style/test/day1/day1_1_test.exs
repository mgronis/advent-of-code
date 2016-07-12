defmodule Day1_1_Test do
  use ExUnit.Case
  import Day1_1

  test "opening parenthesis adds a floor" do
    assert resolve("(") == 1
  end

  test "closing parenthesis subtracts a floor" do
    assert resolve(")") == -1
  end

  test "double opening parenthesis adds a floor" do
    assert resolve("((") == 2
  end

  test "double closing parenthesis subtracts a floor" do
    assert resolve("))") == -2
  end


end
