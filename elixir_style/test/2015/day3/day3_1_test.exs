defmodule Day3_1_Test do
  use ExUnit.Case
  import Day3_1

  test "make sure that we are cought by the end condition" do
    assert move([], {}, %{a: 1}) == %{a: 1}
  end

  test "go down one pace" do
    assert move(["v"], {1, 2}, %{{1, 2} => 1}) == %{{1, 2} => 1, {1, 1} => 1}
  end

  test "go up one pace" do
    assert move(["^"], {1, 2}, %{{1, 2} => 1}) == %{{1, 2} => 1, {1, 3} => 1}
  end

  test "go left one pace" do
    assert move(["<"], {1, 2}, %{{1, 2} => 1}) == %{{1, 2} => 1, {0, 2} => 1}
  end

  test "go right one pace" do
    assert move([">"], {1, 2}, %{{1, 2} => 1}) == %{{1, 2} => 1, {2, 2} => 1}
  end

  test "go left-right-left" do
    assert move(["<", ">", "<"], {1, 2}, %{{1, 2} => 1}) == %{{1, 2} => 2, {0, 2} => 2}
  end

  test "update empty map" do
    assert update_map(%{}, {1, 2}) == %{{1, 2} => 1}
  end

  test "update existing entry in map" do
    assert update_map(%{{1, 2} => 1}, {1, 2}) == %{{1, 2} => 2}
  end

  test "update populated map with new entry" do
    assert update_map(%{{1, 2} => 1}, {2, 2}) == %{{1, 2} => 1, {2, 2} => 1}
  end

  test "move with test file" do
    assert move_according_to_file("test/2015/day3/input_for_tests") == 5
  end

end
