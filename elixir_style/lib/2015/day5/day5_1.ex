defmodule Day5_1 do

  # Santa needs help figuring out which strings in his text file are naughty or nice.

  # A nice string is one with all of the following properties:

  #    It contains at least three vowels (aeiou only), like aei, xazegov, or aeiouaeiouaeiou.
  #    It contains at least one letter that appears twice in a row, like xx, abcdde (dd), or
  #    aabbccdd (aa, bb, cc, or dd).
  #    It does not contain the strings ab, cd, pq, or xy, even if they are part of one of the
  #    other requirements.

  # For example:

  #    ugknbfddgicrmopn is nice because it has at least three vowels (u...i...o...), a double
  #    letter (...dd...), and none of the disallowed substrings.
  #    aaa is nice because it has at least three vowels and a double letter, even though the
  #    letters used by different rules overlap.
  #    jchzalrnumimnmhp is naughty because it has no double letter.
  #    haegwjzuvuyypxyu is naughty because it contains the string xy.
  #    dvszwmarrgswjxmb is naughty because it contains only one vowel.

  # How many strings are nice?

  def search do
     search read_file("lib/2015/day5/input")
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
