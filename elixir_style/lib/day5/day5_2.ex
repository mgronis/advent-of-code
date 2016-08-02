defmodule Day5_2 do

  # Realizing the error of his ways, Santa has switched to a better model of
  # determining whether a string is naughty or nice. None of the old rules
  # apply, as they are all clearly ridiculous.

  # Now, a nice string is one with all of the following properties:

  #    It contains a pair of any two letters that appears at least twice in
  #    the string without overlapping, like xyxy (xy) or aabcdefgaa (aa),
  #    but not like aaa (aa, but it overlaps).
  #    It contains at least one letter which repeats with exactly one letter
  #    between them, like xyx, abcdefeghi (efe), or even aaa.

  # For example:

  #    qjhvhtzxzqqjkmpb is nice because is has a pair that appears twice (qj)
  #    and a letter that repeats with exactly one letter between them (zxz).
  #    xxyxx is nice because it has a pair that appears twice and a letter
  #    that repeats with one between, even though the letters used by each
  #    rule overlap.
  #    uurcxstgmygtbstg is naughty because it has a pair (tg) but no repeat
  #    with a single letter between them.
  #    ieodomkazucvgmuy is naughty because it has a repeating letter with
  #    one between (odo), but no pair that appears twice.

  # How many strings are nice under these new rules?

  @pairs for n <- ?a..?z, m <- ?a..?z, do: to_string [n, m]
  @tripples for n <- ?a..?z, do: to_string [n, n, n]
  @splitted_pairs for n <- ?a..?z, m <- ?a..?z, do: to_string [n, m, n]

  def search do
    File.read!("lib/day5/input")
    |> String.split("\n")
    |> Enum.filter(fn(str)->is_nice(str) end)
    |> Enum.count()
  end

  def is_nice(str) do
    is_pairs(str) && !is_tripple(str) && is_splitted_pair(str)
  end

  def is_pairs(str) do
    @pairs |> Enum.filter(fn(x)->String.split(str, x) |> Enum.count() > 2 end) |> Enum.count() > 0
  end

  def is_tripple(str) do
    @tripples |> Enum.reduce(false, fn(x, acc)->String.contains?(str, x) || acc end)
  end

  def is_splitted_pair(str) do
    @splitted_pairs |> Enum.reduce(false, fn(x, acc)->String.contains?(str, x) || acc end)
  end

end
