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

  test "append padding to one character message" do
    assert append_padding_bits("k", 440) == <<107 :: size(8), 128 :: size(8), 0 :: size(432)>>
  end
  
  test "append padding one character short of 448 bits" do
    assert append_padding_bits(<<1 :: size(440)>>, 8) == <<1 :: size(440), 128 :: size(8)>>
  end

  test "append padding to message of 448 bits" do
    assert append_padding_bits(<<1 :: size(448)>>, 0) == <<1 :: size(448), 128 :: size(8), 0 :: size(504)>>
  end

  test "append length to message" do
    assert append_length(8, "k") == <<107 :: size(8), 8 :: size(64)>>
  end

  test "append length larger than field can hold to message" do
    assert append_length((:math.pow(2, 64) |> round) + 1, "k") == <<107 :: size(8), 1 :: size(64)>>
  end

end
