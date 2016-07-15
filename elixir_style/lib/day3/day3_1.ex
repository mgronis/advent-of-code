defmodule Day3_1 do

  # Santa is delivering presents to an infinite two-dimensional grid of houses.

  # He begins by delivering a present to the house at his starting location,
  # and then an elf at the North Pole calls him via radio and tells him where
  # to move next. Moves are always exactly one house to the north (^), south
  # (v), east (>), or west (<). After each move, he delivers another present to
  # the house at his new location.

  # However, the elf back at the north pole has had a little too much eggnog,
  # and so his directions are a little off, and Santa ends up visiting some
  # houses more than once. How many houses receive at least one present?

  # For example:

  #    > delivers presents to 2 houses: one at the starting location, and one
  #    to the east.
  #    ^>v< delivers presents to 4 houses in a square, including twice to the
  #    house at his starting/ending location.
  #    ^v^v^v^v^v delivers a bunch of presents to some very lucky children at
  #    only 2 houses.

  def start_moving do
    move_according_to_file("lib/day3/input")
  end

  def move_according_to_file(filename) do
    read_file(filename)
    |> String.trim
    |> String.codepoints
    |> move({0, 0}, %{{0, 0} => 1})
    |> Map.to_list
    |> Enum.reduce(0, fn (_x, acc) -> acc + 1 end)
  end

  def read_file(filename) do
    {:ok, data} = File.open(filename, [:read], fn(file) -> IO.read(file, :all) end)
    data
  end

  def move([], _, map) do
    map
  end

  def move(["^"|tail], {x, y}, map) do
    move(tail, {x, y+1}, update_map(map, {x, y+1}))
  end

  def move([">"|tail], {x, y}, map) do
    move(tail, {x+1, y}, update_map(map, {x+1, y}))
  end

  def move(["<"|tail], {x, y}, map) do
    move(tail, {x-1, y}, update_map(map, {x-1, y}))
  end

  def move(["v"|tail], {x, y}, map) do
    move(tail, {x, y-1}, update_map(map, {x, y-1}))
  end

  def update_map(map, pos) do
    Map.update(map, pos, 1, &(&1 + 1))
  end

end
