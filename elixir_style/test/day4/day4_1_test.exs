defmodule Day4_1_Test do
  use ExUnit.Case
  import Day4_1

  test "auxiliary function f" do
    assert func_f(1, 3, 4) == 5
  end

  test "auxiliary function g" do
    assert func_g(5, 5, 1) == 5
  end

  test "auxiliary function h" do
    assert func_h(5, 2, 3) == 4
  end

  test "auxiliary function i" do
    assert func_i(5, 2, -2) == 6
  end

end