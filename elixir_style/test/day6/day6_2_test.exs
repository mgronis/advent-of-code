defmodule Day6_2_Test do
  use ExUnit.Case
  import Day6_2

  test "flip lights with on command" do
    assert flip_lights([{:on, {0, 1}, {1, 1}}], test_grid) ==
      %{ {0,0} => 1, {0,1} => 1, {1,0} => 0, {1,1} => 2}
  end

  test "flip lights with off command" do
    assert flip_lights([{:off, {0, 1}, {1, 1}}], test_grid) ==
      %{ {0,0} => 1, {0,1} => 0, {1,0} => 0, {1,1} => 0}
  end

  test "flip lights with toggle command" do
    assert flip_lights([{:toggle, {0, 1}, {1, 1}}], test_grid) ==
      %{ {0,0} => 1, {0,1} => 2, {1,0} => 0, {1,1} => 3}
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
