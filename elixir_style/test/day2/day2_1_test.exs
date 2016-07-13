defmodule Day2_1_Test do
  use ExUnit.Case
  import Day2_1

  test "calculate wrapping paper for one cube shaped present" do
    assert wrapping_paper_for_one_present(4, 4, 4) == 64
  end

  test "calculate wrapping paper for one non cube shaped present 1" do
    assert wrapping_paper_for_one_present(2, 3, 4) == 32
  end

  test "calculate wrapping paper for one non cube shaped present 2" do
    assert wrapping_paper_for_one_present(2, 4, 3) == 32
  end

  test "calculate wrapping paper for one non cube shaped present 3" do
    assert wrapping_paper_for_one_present(3, 4, 2) == 32
  end

  test "calculate wrapping paper for one non cube shaped present 4" do
    assert wrapping_paper_for_one_present(3, 2, 4) == 32
  end

  test "calculate wrapping paper for one non cube shaped present 5" do
    assert wrapping_paper_for_one_present(4, 3, 2) == 32
  end

  test "calculate wrapping paper for one non cube shaped present 6" do
    assert wrapping_paper_for_one_present(4, 2, 3) == 32
  end

end
