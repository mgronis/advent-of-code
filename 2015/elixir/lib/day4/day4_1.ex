defmodule Day4_1 do

  def calculate do
    calculate "iwrupvqb", 1
  end

  def calculate(str, number, _hash \\ "")

  def calculate(_str, number, "00000" <> _tail) do
    number-1
  end

  def calculate(str, number, _hash) do
    calculate str, number+1, :crypto.hash(:md5, str <> Integer.to_string(number) ) |> Base.encode16
  end

end
