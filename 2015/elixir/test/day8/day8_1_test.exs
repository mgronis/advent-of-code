defmodule Day8_1_Test do
  use ExUnit.Case
  import Day8_1

  test "calculate empty" do
    assert memory_portion([?", ?"], 0) == 2
  end

  test "calculate \"" do
    assert memory_portion([?", ?\\, ?", ?"], 0) == 3
  end

  test "calculate \\xfb" do
    assert memory_portion([?", ?\\, ?x, ?f, ?b, ?"], 0) == 3
  end

  test "calculate \\\\" do
    assert memory_portion([?", ?\\, ?\\, ?"], 0) == 3
  end

  test "calculate \\xfb and \"" do
    assert memory_portion([?", ?\\, ?x, ?f, ?b, ?\\, ?", ?"], 0) == 4
  end

  test "simple input" do
    assert solve("test/day8/simple_input_for_test") == 4
  end

  test "tricky input" do
    assert solve("test/day8/tricky_input_for_test") == 15
  end

end
