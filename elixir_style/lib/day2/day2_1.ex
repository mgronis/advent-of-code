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

  def read_file(filename) do
    {:ok, data} = File.open(filename, [:read], fn(file) -> IO.read(file, :all) end)
    data
  end

  def wrapping_paper_for_one_present(a, b, c) when a <= b and b <= c do
    a*b + a*c + c*b + extra_wrapping_paper(a, b)
  end

  def wrapping_paper_for_one_present(a, b, c) when a <= c and b <= c do
    a*b + a*c + c*b + extra_wrapping_paper(a, b)
  end

  def wrapping_paper_for_one_present(a, b, c) when b <= c and c <= a do
    a*b + a*c + c*b + extra_wrapping_paper(b, c)
  end

  def wrapping_paper_for_one_present(a, b, c) when a <= c and c <= b do
    a*b + a*c + c*b + extra_wrapping_paper(a, c)
  end

  def wrapping_paper_for_one_present(a, b, c) when c <= a and b <= a do
    a*b + a*c + c*b + extra_wrapping_paper(b, c)
  end

  def wrapping_paper_for_one_present(a, b, c) when a <= b and c <= a do
    a*b + a*c + c*b + extra_wrapping_paper(a, c)
  end

  def extra_wrapping_paper(x, y) do
    x*y
  end

end
