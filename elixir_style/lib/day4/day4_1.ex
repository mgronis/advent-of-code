defmodule Day4_1 do

  # Santa needs help mining some AdventCoins (very similar to bitcoins) to use
  # as gifts for all the economically forward-thinking little girls and boys.

  # To do this, he needs to find MD5 hashes which, in hexadecimal, start with
  # at least five zeroes. The input to the MD5 hash is some secret key (your
  # puzzle input, given below) followed by a number in decimal. To mine
  # AdventCoins, you must find Santa the lowest positive number (no leading
  # zeroes: 1, 2, 3, ...) that produces such a hash.

  #For example:

  #    If your secret key is abcdef, the answer is 609043, because the MD5 hash
  #    of abcdef609043 starts with five zeroes (000001dbbfa...), and it is the
  #    lowest such number to do so.
  #    If your secret key is pqrstuv, the lowest number it combines with to
  #    make an MD5 hash starting with five zeroes is 1048970; that is, the MD5
  #    hash of pqrstuv1048970 looks like 000006136ef....

  # Your puzzle input is iwrupvqb.

  use Bitwise

  def add_padding_and_length(str) do
    with_padding = append_padding_bits(str, 448 - bit_size(str))
    append_length(bit_size(str), with_padding)
  end

  def append_padding_bits(str, bits_to_append) when bits_to_append > 0 do
    extra_zeroes = bits_to_append-8
    str <> <<128 :: size(8)>> <> <<0 :: size(extra_zeroes)>>
  end

  def append_padding_bits(str, bits_to_append) do
    extra_zeroes = 512-bits_to_append-8
    str <> <<128 :: size(8)>> <> <<0 :: size(extra_zeroes)>>
  end

  def append_length(length, message) do
  end
   
  def func_f(b, c, d) do
    (b &&& c) ^^^ (~~~b &&& d)
  end

  def func_g(b, c, d) do
    (b &&& d) ^^^ (c &&& ~~~d)
  end

  def func_h(b, c, d) do
    bxor(b, bxor(c, d))
  end

  def func_i(b, c, d) do
    bxor(c, (b ^^^ ~~~d))
  end

end
