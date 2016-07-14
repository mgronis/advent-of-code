defmodule Day2_2_Test do
  use ExUnit.Case
  import Day2_2

  test "feet of ribbon for an entire present 1" do
    assert feet_of_ribbon_for_present(2, 3, 4) == 34
  end

  test "feet of ribbon for an entire present 2" do
    assert feet_of_ribbon_for_present(1, 1, 10) == 14
  end

end
