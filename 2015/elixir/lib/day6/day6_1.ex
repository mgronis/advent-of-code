defmodule Day6_1 do

  def get_initial_grid do
    for n <- 0..999, m <- 0..999, into: %{}, do: {{n, m}, 0}
  end

  def lights do
    lights "lib/day6/input", get_initial_grid
  end

  def lights(file_name, grid) do
    parse_input(file_name)
    |> flip_lights(grid)
    |> Map.values()
    |> Enum.sum()
  end

  def flip_lights(commands, grid) do
    flip commands, grid
  end

  defp flip([{:on, {from_x, from_y}, {to_x, to_y}} | tail], grid) do
    flip tail, update_grid(grid, from_x, from_y, to_x, to_y, fn(_value) -> 1 end)
  end

  defp flip([{:off, {from_x, from_y}, {to_x, to_y}} | tail], grid) do
    flip tail, update_grid(grid, from_x, from_y, to_x, to_y, fn(_value) -> 0 end)
  end

  defp flip([{:toggle, {from_x, from_y}, {to_x, to_y}} | tail], grid) do
    flip tail, update_grid(grid, from_x, from_y, to_x, to_y, fn(value) -> rem(value+1, 2) end)
  end

  defp flip([], grid) do
    grid
  end

  defp update_grid(grid, from_x, from_y, to_x, to_y, update_function) do
    extract_keys(from_x, from_y, to_x, to_y)
    |> Enum.reduce(grid, fn(key, acc) -> Map.update!(acc, key, update_function) end)
  end

  defp extract_keys(from_x, from_y, to_x, to_y) do
    for x <- from_x..to_x, y <- from_y..to_y, do: {x, y}
  end

  def parse_input(file_name) do
    File.read!(file_name)
    |> String.split("\n", trim: true)
    |> Enum.map(fn(str) -> separator(String.split(str, " ", trim: true)) end)
  end

  defp separator(["turn", "on", from, _, to | _tail]) do
    {:on, tuplify(from, ","), tuplify(to, ",")}
  end

  defp separator(["turn", "off", from, _, to | _tail]) do
    {:off, tuplify(from, ","), tuplify(to, ",")}
  end

  defp separator(["toggle", from, _, to | _tail]) do
    {:toggle, tuplify(from, ","), tuplify(to, ",")}
  end

  defp tuplify(list, split_char) do
    String.split(list, split_char, trim: true)
    |> Enum.map(fn(str) -> String.to_integer(str) end)
    |> List.to_tuple()
  end

end
