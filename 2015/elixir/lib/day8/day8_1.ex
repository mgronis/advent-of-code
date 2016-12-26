defmodule Day8_1 do

  def solve do
    solve "lib/day8/input"
  end

  def solve(file) do
    File.read!(file)
    |> String.split("\n", trim: true)
    |> Enum.reduce(0, fn(x, acc) -> String.length(x) - memory_portion(String.to_char_list(x), -2) + acc end)
  end

  def memory_portion(list, acc) do
    case list do
      [] -> acc
      [?\\, ?" | t] -> memory_portion(t, acc + 1)
      [?\\, ?\\ | t] -> memory_portion(t, acc + 1)
      [?\\, ?x, _, _ | t] -> memory_portion(t, acc + 1)
      [_ | t] -> memory_portion(t, acc + 1)
    end
  end

end
