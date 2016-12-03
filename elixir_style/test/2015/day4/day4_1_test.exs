defmodule Day4_1_Test do
  use ExUnit.Case
  import Day4_1

  test "abcdef as input" do
    assert calculate("abcdef", 609043) == 609043
  end

  test "pqrstuv as input" do
    assert calculate("pqrstuv", 1048970) == 1048970
  end

end
