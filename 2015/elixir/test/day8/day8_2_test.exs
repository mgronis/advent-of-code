defmodule Day8_2_Test do
  use ExUnit.Case
  import Day8_2

  test "calculate empty" do
    assert encoding_size([?", ?"], 0) == 4
  end

  test "calculate abc" do
    assert encoding_size([?", ?a, ?b, ?c, ?"], 0) == 7
  end

  test "calculate aaa\"aaa" do
    assert encoding_size([?", ?a, ?a, ?a, ?\\, ?", ?a, ?a, ?a, ?"], 0) == 14
  end

  test "calculate \\xfb" do
    assert encoding_size([?", ?\\, ?x, ?f, ?b, ?"], 0) == 9
  end

  test "simple input" do
    assert solve("test/day8/simple_input_for_test") == 8
  end

  test "tricky input" do
    assert solve("test/day8/tricky_input_for_test") == 20
  end

end
