defmodule Day2_1 do

  # The elves are running low on wrapping paper, and so they need to submit an
  # order for more. They have a list of the dimensions (length l, width w, and
  # height h) of each present, and only want to order exactly as much as they
  # need.

  # Fortunately, every present is a box (a perfect right rectangular prism),
  # which makes calculating the required wrapping paper for each gift a little
  # easier: find the surface area of the box, which is 2*l*w + 2*w*h + 2*h*l.
  # The elves also need a little extra paper for each present: the area of the
  # smallest side.

  # For example:

  #    A present with dimensions 2x3x4 requires 2*6 + 2*12 + 2*8 = 52 square
  #    feet of wrapping paper plus 6 square feet of slack, for a total of 58
  #    square feet.
  #    A present with dimensions 1x1x10 requires 2*1 + 2*10 + 2*10 = 42 square
  #    feet of wrapping paper plus 1 square foot of slack, for a total of 43
  #    square feet.

  # All numbers in the elves' list are in feet. How many total square feet of
  # wrapping paper should they order?

  def calculate do
    calculate_with_file("lib/2015/day2/input")
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
