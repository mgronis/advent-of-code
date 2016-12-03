defmodule Day5_1_Test do
  use ExUnit.Case
  import Day5_1

  test "jchzalrnumimnmhp is naughty, result is zero" do
    assert search("jchzalrnumimnmhp") == 0
  end

  test "haegwjzuvuyypxyu is naughty, result is zero" do
    assert search("haegwjzuvuyypxyu") == 0
  end

  test "dvszwmarrgswjxmb is naughty, result is zero" do
    assert search("dvszwmarrgswjxmb") == 0
  end

end
