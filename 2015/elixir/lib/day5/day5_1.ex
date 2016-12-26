defmodule Day5_1 do

  def search do
     search read_file("lib/day5/input")
  end

  def search(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.reject(fn(str) -> String.contains? str, ["ab", "cd", "pq", "xy"] end)
    |> Enum.reject(fn(str) -> Regex.scan(~r/[aeiou]/i, str) |> Enum.count() < 3 end)
    |> Enum.filter(fn(str) -> {_, keep} = String.codepoints(str) |> Enum.reduce({"", false}, fn(symbol, {acc, result}) -> if String.equivalent?(symbol, acc), do: {symbol, true}, else: {symbol, result} end); keep end)
    |> Enum.count()
  end

  def read_file(filename) do
    {:ok, data} = File.open(filename, [:read], fn(file) -> IO.read(file, :all) end)
    data
  end

end
