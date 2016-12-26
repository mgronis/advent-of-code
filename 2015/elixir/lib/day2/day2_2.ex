defmodule Day2_2 do

  def calculate do
    calculate_with_file("lib/day2/input")
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
