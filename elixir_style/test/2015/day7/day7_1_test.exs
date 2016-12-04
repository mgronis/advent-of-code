defmodule Day7_1_Test do
  use ExUnit.Case
  import Day7_1

  test "pase file" do
    assert parse_input("test/2015/day7/input_for_test") ==
       %{"x" => ["123"],
       "y" => ["456"],
       "d" => ["x", "AND", "y"],
       "e" => ["x", "OR", "y"],
       "f" => ["x", "LSHIFT", "2"],
       "g" => ["y", "RSHIFT", "2"],
       "h" => ["NOT", "x"],
       "i" => ["NOT", "y"]}
  end

  test "calculate test data for lead x" do
    assert solve("x", "test/2015/day7/input_for_test") == 123
  end

  test "calculate test data for lead e" do
    assert solve("e", "test/2015/day7/input_for_test") == 507
  end

  test "calculate test data for lead f" do
    assert solve("f", "test/2015/day7/input_for_test") == 492
  end

  test "calculate test data for lead g" do
    assert solve("g", "test/2015/day7/input_for_test") == 114
  end

  test "calculate test data for lead h" do
    assert solve("h", "test/2015/day7/input_for_test") == 65412
  end

  test "calculate test data for lead i" do
    assert solve("i", "test/2015/day7/input_for_test") == 65079
  end

  test "calculate test data for lead y" do
    assert solve("y", "test/2015/day7/input_for_test") == 456
  end

  test "calculate test data for lead d" do
    assert solve("d", "test/2015/day7/input_for_test") == 72
  end

end
