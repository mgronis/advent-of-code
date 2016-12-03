defmodule Day5_2_Test do
  use ExUnit.Case
  import Day5_2

  test "hello is NOT pair" do
    assert is_pairs("hello") == false
  end

  test "hellohello is pair" do
    assert is_pairs("hellohe") == true
  end

  test "xyxy is pair" do
    assert is_pairs("xyxy") == true
  end

  test "aabcdefgaa is pair" do
    assert is_pairs("aabcdefgaa") == true
  end

  test "aaa is NOT pair" do
    assert is_pairs("aaa") == false
  end

  test "aaa is splitted pair" do
    assert is_splitted_pair("aaa") == true
  end

  test "frog is NOT splitted pair" do
    assert is_splitted_pair("frog") == false
  end

  test "xyx is splitted pair" do
    assert is_splitted_pair("xyx") == true
  end

  test "abcdefeghi is splitted pair" do
    assert is_splitted_pair("abcdefeghi") == true
  end

  test "apartment is splitted pair" do
    assert is_splitted_pair("apartment") == true
  end

  test "abbb is NOT nice" do
    assert is_nice("abbb") == false
  end

  test "abcbc is nice" do
    assert is_nice("abcbc") == true
  end

  test "abbbb is nice" do
    assert is_nice("abbbb") == true
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
