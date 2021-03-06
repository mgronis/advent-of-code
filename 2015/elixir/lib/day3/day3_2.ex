defmodule Day3_2 do

  def start_moving do
    move_according_to_file("lib/day3/input")
  end

  def move_according_to_file(filename) do
    read_file(filename)
    |> String.trim
    |> String.codepoints
    |> move(0, %{0 => {0, 0}, 1 => {0, 0}}, %{{0, 0} => 2})
    |> Map.to_list
    |> Enum.reduce(0, fn (_x, acc) -> acc + 1 end)
  end

  def read_file(filename) do
    {:ok, data} = File.open(filename, [:read], fn(file) -> IO.read(file, :all) end)
    data
  end

  def move([], _, _, visited_houses) do
    visited_houses
  end

  def move(["^"|tail], player, player_position, visited_houses) do
    {x, y} = Map.get(player_position, player)
    new_pos = {x, y+1}
    move(tail, next_player(player), update_player_possition(player_position, player, new_pos), update_visited_possition(visited_houses, new_pos))
  end

  def move([">"|tail], player, player_position, visited_houses) do
    {x, y} = Map.get(player_position, player)
    new_pos = {x+1, y}
    move(tail, next_player(player), update_player_possition(player_position, player, new_pos), update_visited_possition(visited_houses, new_pos))
  end

  def move(["<"|tail], player, player_position, visited_houses) do
    {x, y} = Map.get(player_position, player)
    new_pos = {x-1, y}
    move(tail, next_player(player), update_player_possition(player_position, player, new_pos), update_visited_possition(visited_houses, new_pos))
  end

  def move(["v"|tail], player, player_position, visited_houses) do
    {x, y} = Map.get(player_position, player)
    new_pos = {x, y-1}
    move(tail, next_player(player), update_player_possition(player_position, player, new_pos), update_visited_possition(visited_houses, new_pos))
  end

  def update_player_possition(player_position, player, pos) do
    Map.put(player_position, player, pos)
  end

  def update_visited_possition(visited_houses, pos) do
    Map.update(visited_houses, pos, 1, &(&1 + 1))
  end

  def next_player(current_player) do
    rem(current_player + 1, 2)
  end

end
