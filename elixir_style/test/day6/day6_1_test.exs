defmodule Day6_1_Test do
  use ExUnit.Case
  import Day6_1

  test "parse input form test file" do
    assert parse_input("test/day6/input_for_tests") ==
      [{:on, {0, 1}, {0, 2}},
      {:off, {1, 1}, {1, 2}},
      {:toggle, {0, 0}, {2, 1}}]
  end

  test "flip lights with on command" do
    assert flip_lights([{:on, {0, 1}, {1, 1}}], test_grid) ==
      %{ {0,0} => 1, {0,1} => 1, {1,0} => 0, {1,1} => 1}
  end

  test "flip lights with off command" do
    assert flip_lights([{:off, {0, 1}, {1, 1}}], test_grid) ==
      %{ {0,0} => 1, {0,1} => 0, {1,0} => 0, {1,1} => 0}
  end

  test "flip lights with toggle command" do
    assert flip_lights([{:toggle, {0, 1}, {1, 1}}], test_grid) ==
      %{ {0,0} => 1, {0,1} => 1, {1,0} => 0, {1,1} => 0}
  end

  defp test_grid do
    %{
      {0,0} => 1,
      {0,1} => 0,
      {1,0} => 0,
      {1,1} => 1
    }
  end

end
