defmodule Day6_1_Test do
  use ExUnit.Case
  import Day6_1

  test "parse input form test file" do
    assert parse_input("test/day6/input_for_tests") ==
      [["turn", "on", "489,959", "through", "759,964"],
      ["turn", "off", "820,516", "through", "871,914"]]
  end

end
