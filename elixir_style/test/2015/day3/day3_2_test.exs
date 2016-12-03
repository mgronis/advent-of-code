defmodule Day3_2_Test do
  use ExUnit.Case
  import Day3_2

  test "santas turn is over give robo-santa a go at it" do
    assert next_player(0) == 1
  end

  test "robo-santas turn is over give santa a go at it" do
    assert next_player(0) == 1
  end

  test "make sure that we are cought by the end condition" do
    assert move([], 1, %{}, %{a: 1}) == %{a: 1}
  end

  test "go down one pace" do
    assert move(["v"], 1, %{1 => {1, 2}, 0 => {0, 0}}, %{{1, 2} => 1}) == %{{1, 2} => 1, {1, 1} => 1}
  end

  test "go up one pace" do
    assert move(["^"], 1, %{1 => {1, 2}, 0 => {0, 0}}, %{{1, 2} => 1}) == %{{1, 2} => 1, {1, 3} => 1}
  end

  test "go left one pace" do
    assert move(["<"], 1, %{1 => {1, 2}, 0 => {0, 0}}, %{{1, 2} => 1}) == %{{1, 2} => 1, {0, 2} => 1}
  end

  test "go right one pace" do
    assert move([">"], 1, %{1 => {1, 2}, 0 => {0, 0}}, %{{1, 2} => 1}) == %{{1, 2} => 1, {2, 2} => 1}
  end

  test "go left-right-left" do
    assert move(["<", ">", "<"], 0, %{0 => {1, 2}, 1 => {0, 0}}, %{{1, 2} => 1}) == %{{1, 2} => 1, {1, 0} => 1, {0, 2} => 1, {-1, 2} => 1}
  end

  test "move with test file" do
    assert move_according_to_file("test/2015/day3/input_for_tests") == 7
  end

end
