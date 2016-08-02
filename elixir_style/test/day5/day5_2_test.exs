defmodule Day5_2_Test do
  use ExUnit.Case
  import Day5_2

  test "hello is NOT pair" do
    assert is_pairs("hello") == false
  end

  test "hellohello is pair" do
    assert is_pairs("hellohe") == true
  end

  test "hello is NOT tripple" do
    assert is_tripple("hello") == false
  end

  test "helllo is tripple" do
    assert is_tripple("helllo") == true
  end

  test "frog is NOT splitted pair" do
    assert is_splitted_pair("frog") == false
  end

  test "apartment is splitted pair" do
    assert is_splitted_pair("apartment") == true
  end

  test "qjhvhtzxzqqjkmpb is nice" do
    assert is_nice("qjhvhtzxzqqjkmpb") == true
  end

  test "xxyxx is nice" do
    assert is_nice("xxyxx") == true
  end

  test "uurcxstgmygtbstg is NOT nice" do
    assert is_nice("uurcxstgmygtbstg") == false
  end

  test "ieodomkazucvgmuy is NOT nice" do
    assert is_nice("ieodomkazucvgmuy") == false
  end

end
