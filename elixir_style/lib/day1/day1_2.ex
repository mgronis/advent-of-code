defmodule Day1_2 do
  import Day1_Constants

  # Now, given the same instructions, find the position of the first character
  # that causes him to enter the basement (floor -1). The first character in the
  # instructions has position 1, the second character has position 2, and so on.

  # For example:

  #  ) causes him to enter the basement at character position 1.
  #  ()()) causes him to enter the basement at character position 5.

  def resolve do
    resolve(santas_ride)
  end

  def resolve(input) do
    [h|tail] = String.codepoints(input)
    resolve_internal(h, tail, 0, 1)
  end

  defp resolve_internal("(", [], _floor, _acc) do
    -1
  end

  defp resolve_internal(")", [_h|_tail], floor, acc) when floor == 0 do
    acc
  end

  defp resolve_internal(")", [], floor, acc) when floor == 0 do
    acc
  end

  defp resolve_internal(")", [], _floor, _acc) do
    -1
  end

  defp resolve_internal("(", [h|tail], floor, acc) do
    resolve_internal(h, tail, floor+1, acc+1)
  end

  defp resolve_internal(")", [h|tail], floor, acc) do
    resolve_internal(h, tail, floor-1, acc+1)
  end

end
