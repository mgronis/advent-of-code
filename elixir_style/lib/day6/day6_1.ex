defmodule Day6_1 do

  # Because your neighbors keep defeating you in the holiday house decorating
  # contest year after year, you've decided to deploy one million lights in a
  # 1000x1000 grid.

  # Furthermore, because you've been especially nice this year, Santa has mailed
  # you instructions on how to display the ideal lighting configuration.

  # Lights in your grid are numbered from 0 to 999 in each direction; the lights
  # at each corner are at 0,0, 0,999, 999,999, and 999,0. The instructions
  # include whether to turn on, turn off, or toggle various inclusive ranges
  # given as coordinate pairs. Each coordinate pair represents opposite corners
  # of a rectangle, inclusive; a coordinate pair like 0,0 through 2,2 therefore
  # refers to 9 lights in a 3x3 square. The lights all start turned off.

  # To defeat your neighbors this year, all you have to do is set up your lights
  # by doing the instructions Santa sent you in order.

  # For example:

  #    turn on 0,0 through 999,999 would turn on (or leave on) every light.
  #    toggle 0,0 through 999,0 would toggle the first line of 1000 lights,
  #    turning off the ones that were on, and turning on the ones that were off.
  #    turn off 499,499 through 500,500 would turn off (or leave off) the middle
  #    four lights.

  # After following the instructions, how many lights are lit?

  @initial_grid for n <- 0..999, m <- 0..999, into: %{}, do: {{n, m}, 0}

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
    new_grid = extract_keys(from_x, from_y, to_x, to_y)
    |> Enum.reduce(grid, fn(key, acc) -> Map.update(acc, key, 1, fn(_value) -> 1 end) end)
    flip tail, new_grid
    #flip tail, update_grid(grid, from_x, from_y, to_x, to_y, fn(_value) -> 1 end)
  end

  defp flip([{:off, {from_x, from_y}, {to_x, to_y}} | tail], grid) do
    new_grid = extract_keys(from_x, from_y, to_x, to_y)
    |> Enum.reduce(grid, fn(key, acc) -> Map.update(acc, key, 0, fn(_value) -> 0 end) end)
    flip tail, new_grid
    #flip tail, update_grid(grid, from_x, from_y, to_x, to_y, fn(_value) -> 0 end)
  end

  defp flip([{:toggle, {from_x, from_y}, {to_x, to_y}} | tail], grid) do
    new_grid = extract_keys(from_x, from_y, to_x, to_y)
    |> Enum.reduce(grid, fn(key, acc) -> Map.update!(acc, key, fn(value) -> rem(value+1, 2) end) end)
    flip tail, new_grid
    #flip tail, update_grid(grid, from_x, from_y, to_x, to_y, fn(value) -> rem(value+1, 2) end)
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

  def get_initial_grid do
    @initial_grid
  end

end
