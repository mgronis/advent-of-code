defmodule Day5_2 do

  @pairs for n <- ?a..?z, m <- ?a..?z, do: to_string [n, m]
  @splitted_pairs for n <- ?a..?z, m <- ?a..?z, do: to_string [n, m, n]

  def search do
    File.read!("lib/day5/input")
    |> String.split("\n", trim: true)
    |> Enum.filter(fn(str)->is_nice(str) end)
    |> Enum.count()
  end

  def is_nice(str) do
    is_pairs(str) && is_splitted_pair(str)
  end

  def is_pairs(str) do
    @pairs |> Enum.reduce(false, fn(x, acc)->String.split(str, x) |> Enum.count() > 2 || acc end)
  end

  def is_splitted_pair(str) do
    @splitted_pairs |> Enum.reduce(false, fn(x, acc)->String.contains?(str, x) || acc end)
  end

end
