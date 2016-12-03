defmodule Day2_2_Test do
  use ExUnit.Case
  import Day2_2

  test "feet of ribbon for an entire present 1" do
    assert feet_of_ribbon_for_present(2, 3, 4) == 34
  end

  test "feet of ribbon for an entire present 2" do
    assert feet_of_ribbon_for_present(1, 1, 10) == 14
  end

  test "feet of ribbon from list" do
    assert calculate_ribbon([2, 3, 4]) == 34
  end

  test "read test input" do
    assert read_file("test/2015/day2/input_for_tests") == "29x13x26\n11x11x14\n27x2x5\n"
  end

  test "calculate with test file" do
    assert calculate_with_file("test/2015/day2/input_for_tests") == 11902
  end

end
