defmodule Day7_1_Test do
  use ExUnit.Case
  import Day7_1

  test "pase file" do
    assert parse_input("test/2015/day7/input_for_test") ==
       %{"x" => 123,
       "y" => 456,
       "d" => ["x", "AND", "y"],
       "e" => ["x", "OR", "y"],
       "f" => ["x", "LSHIFT", 2],
       "g" => ["y", "RSHIFT", 2],
       "h" => ["NOT", "x"],
       "i" => ["NOT", "y"]}
  end

  test "calculate value" do
    assert calculate_lead_for_test("f", %{"f" => 1}) == 1
  end

  test "calculate variable pointing to value" do
    assert calculate_lead_for_test("f", %{"f" => "a", "a" => 2}) == 2
  end

  test "calculate NOT" do
    assert calculate_lead_for_test("f", %{"f" => ["NOT", 1]}) == 65534
  end

  test "calculate AND with values" do
    assert calculate_lead_for_test("f", %{"f" => [2, "AND", 1]}) == 0
  end

  test "calculate AND with variables" do
    assert calculate_lead_for_test("f", %{"f" => ["d", "AND", "e"], "d" => 3, "e" => 2}) == 2
  end

  test "calculate OR with values" do
    assert calculate_lead_for_test("f", %{"f" => [2, "OR", 1]}) == 3
  end

  test "calculate OR with variables" do
    assert calculate_lead_for_test("f", %{"f" => ["d", "OR", "e"], "d" => 4, "e" => 2}) == 6
  end

  test "calculate LSHIFT with values" do
    assert calculate_lead_for_test("f", %{"f" => [2, "LSHIFT", 1]}) == 4
  end

  test "calculate LSHIFT with variables" do
    assert calculate_lead_for_test("f", %{"f" => ["d", "LSHIFT", 2], "d" => 4}) == 16
  end

  test "calculate RSHIFT with values" do
    assert calculate_lead_for_test("f", %{"f" => [2, "RSHIFT", 1]}) == 1
  end

  test "calculate RSHIFT with variables" do
    assert calculate_lead_for_test("f", %{"f" => ["d", "RSHIFT", 2], "d" => 4}) == 1
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
