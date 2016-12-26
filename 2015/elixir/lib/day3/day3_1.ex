defmodule Day3_1 do

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
