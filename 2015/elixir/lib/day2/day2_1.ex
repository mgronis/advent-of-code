defmodule Day2_1 do

  def calculate do
    calculate_with_file("lib/day2/input")
  end

  def calculate_with_file(filename) do
    read_file(filename)
    |> create_list_of_sides
    |> Enum.map(fn(list) -> Enum.sort(list) end)
    |> Enum.map(fn(sides) -> wrapping_paper_for_one_present(sides) end)
    |> Enum.reduce(0, fn (x, acc) -> x + acc end)
  end

  def read_file(filename) do
    {:ok, data} = File.open(filename, [:read], fn(file) -> IO.read(file, :all) end)
    data
  end

  def create_list_of_sides(string_input) do
    String.split(string_input, "\n", trim: true)
    |> Enum.map(
      fn(str) -> String.split(str, "x")
      |> Enum.map(fn str -> String.to_integer(str)  end)
    end)
  end

  def wrapping_paper_for_one_present([a, b, c]) do
    wrapping_paper_for_one_present(a, b, c)
  end

  def wrapping_paper_for_one_present(a, b, c) do
      2 * (a*b + a*c + c*b) + extra_wrapping_paper(a, b)
  end

  def extra_wrapping_paper(x, y) do
    x*y
  end

end
