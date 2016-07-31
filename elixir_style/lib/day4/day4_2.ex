defmodule Day4_2 do

  # Now find one that starts with six zeroes.

  # Your puzzle input is still iwrupvqb.

  def calculate do
    calculate "iwrupvqb", 1
  end

  def calculate(str, number, "000000" <> _tail) do
    number-1
  end

  def calculate(str, number, _hash \\ "") do
    calculate str, number+1, :crypto.hash(:md5, str <> Integer.to_string(number) ) |> Base.encode16
  end

end
