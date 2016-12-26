defmodule Day1_2_Test do
  use ExUnit.Case
  import Day1_2

  test "first character is basment" do
    assert resolve(")") == 1
  end

  test "third character is basment" do
    assert resolve("())") == 3
  end

  test "one character is opening parenthesis" do
    assert resolve("(") == -1
  end

  test "one pair of opening and closing parenthesis" do
    assert resolve("()") == -1
  end

  test "one pair of opening and closing plus extra opening parenthesis" do
    assert resolve("()(") == -1
  end

  test "two pairs of opening and closing parenthesis" do
    assert resolve("()()") == -1
  end

  test "should retrun after fifth character" do
    assert resolve("()())(()(())") == 5
  end

end
