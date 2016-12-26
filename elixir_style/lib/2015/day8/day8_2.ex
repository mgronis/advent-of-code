defmodule Day8_2 do

  def solve do
    solve "lib/2015/day8/input"
  end

  def solve(file) do
    File.read!(file)
    |> String.split("\n", trim: true)
    |> Enum.reduce(0, fn(x, acc) -> encoding_size(String.to_char_list(x), 2) - String.length(x) + acc end)
  end

  def encoding_size(list, acc) do
    case list do
      [] -> acc
      [?" | t] -> encoding_size(t, acc + 2)
      [?\\, ?" | t] -> encoding_size(t, acc + 4)
      [?\\, ?\\ | t] -> encoding_size(t, acc + 4)
      [?\\, ?x, _, _ | t] -> encoding_size(t, acc + 5)
      [_ | t] -> encoding_size(t, acc + 1)
    end
  end

end
