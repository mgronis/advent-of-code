defmodule Day2_2 do

  # The elves are also running low on ribbon. Ribbon is all the same width, so
  # they only have to worry about the length they need to order, which they
  # would again like to be exact.

  # The ribbon required to wrap a present is the shortest distance around its
  # sides, or the smallest perimeter of any one face. Each present also
  # requires a bow made out of ribbon as well; the feet of ribbon required for
  # the perfect bow is equal to the cubic feet of volume of the present. Don't
  # ask how they tie the bow, though; they'll never tell.

  # For example:

  #     A present with dimensions 2x3x4 requires 2+2+3+3 = 10 feet of ribbon to
  #     wrap the present plus 2*3*4 = 24 feet of ribbon for the bow, for a total
  #     of 34 feet.
  #     A present with dimensions 1x1x10 requires 1+1+1+1 = 4 feet of ribbon to
  #     wrap the present plus 1*1*10 = 10 feet of ribbon for the bow, for a total
  #     of 14 feet.

  # How many total feet of ribbon should they order?

  def calculate do
    calculate_with_file("lib/2015/day2/input")
  end

  def calculate_with_file(filename) do
    read_file(filename)
    |> create_list_of_sides
    |> Enum.map(fn(list) -> Enum.sort(list) end)
    |> Enum.map(fn(sides) -> calculate_ribbon(sides) end)
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

  def calculate_ribbon([a, b, c]) do
    feet_of_ribbon_for_present(a, b, c)
  end

  def feet_of_ribbon_for_present(a, b, c) do
    2*a + 2*b + feet_of_ribbon_for_bow(a, b, c)
  end

  def feet_of_ribbon_for_bow(a, b, c) do
    a*b*c
  end

end
