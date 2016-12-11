
defmodule Day7_1 do
  use Bitwise

  # This year, Santa brought little Bobby Tables a set of wires and bitwise
  # logic gates! Unfortunately, little Bobby is a little under the recommended
  # age range, and he needs help assembling the circuit.

  # Each wire has an identifier (some lowercase letters) and can carry a 16-bit
  # signal (a number from 0 to 65535). A signal is provided to each wire by a
  # gate, another wire, or some specific value. Each wire can only get a signal
  # from one source, but can provide its signal to multiple destinations. A
  # gate provides no signal until all of its inputs have a signal.

  # The included instructions booklet describes how to connect the parts
  # together: x AND y -> z means to connect wires x and y to an AND gate, and
  # then connect its output to wire z.

  # For example:

  #    123 -> x means that the signal 123 is provided to wire x.
  #    x AND y -> z means that the bitwise AND of wire x and wire y is provided
  #    to wire z.
  #    p LSHIFT 2 -> q means that the value from wire p is left-shifted by 2
  #    and then provided to wire q.
  #    NOT e -> f means that the bitwise complement of the value from wire e is
  #    provided to wire f.

  # Other possible gates include OR (bitwise OR) and RSHIFT (right-shift). If,
  # for some reason, you'd like to emulate the circuit instead, almost all
  # programming languages (for example, C, JavaScript, or Python) provide
  # operators for these gates.

  # For example, here is a simple circuit:

  # 123 -> x
  # 456 -> y
  # x AND y -> d
  # x OR y -> e
  # x LSHIFT 2 -> f
  # y RSHIFT 2 -> g
  # NOT x -> h
  # NOT y -> i

  # After it is run, these are the signals on the wires:

  # d: 72
  # e: 507
  # f: 492
  # g: 114
  # h: 65412
  # i: 65079
  # x: 123
  # y: 456

  # In little Bobby's kit's instructions booklet (provided as your puzzle
  # input), what signal is ultimately provided to wire a?

  def solve do
    solve "a", "lib/2015/day7/input"
  end

  def solve(lead, file_name) do
    instructions = parse_input(file_name)
    calculate_lead(lead, instructions)[lead]
  end

  def calculate_lead_for_test(lead, instructions) do
    calculate_lead(lead, instructions)[lead]
  end

  defp calculate_lead(lead, instructions) do
    case instructions[lead] do
      ["NOT", value] ->
        instructions = calculate_lead(value, instructions)
        Map.put(instructions, lead, 65535 ^^^ instructions[value])
      [value_x, "AND", value_y] ->
        instructions = calculate_lead(value_x, instructions)
        instructions = calculate_lead(value_y, instructions)
        Map.put(instructions, lead, instructions[value_x] &&& instructions[value_y])
      [value_x, "OR", value_y] ->
        instructions = calculate_lead(value_x, instructions)
        instructions = calculate_lead(value_y, instructions)
        Map.put(instructions, lead, instructions[value_x] ||| instructions[value_y])
      [value, "LSHIFT", amount] ->
        instructions = calculate_lead(value, instructions)
        Map.put(instructions, lead, instructions[value] <<< amount)
      [value, "RSHIFT", amount] ->
        instructions = calculate_lead(value, instructions)
        Map.put(instructions, lead, instructions[value] >>> amount)
      value when is_binary(value) ->
        instructions = calculate_lead(value, instructions)
        Map.put(instructions, lead, instructions[value])
      value when is_integer(value) ->
        instructions
      nil ->
        Map.put(instructions, lead, lead)
    end
  end

  def parse_input(file_name) do
    File.read!(file_name)
    |> String.split("\n", trim: true)
    |> Enum.reduce(%{}, fn(str, acc) -> as_map(str, acc) end)
  end

  defp as_map(str, acc) do
    case String.split(str, " ", trim: true) do
      [operator, value, "->", key] -> Map.put(acc, key, [operator, as_value(value)])
      [value_x, operator, value_y, "->", key] -> Map.put(acc, key, [as_value(value_x), operator, as_value(value_y)])
      [value, "->", key] -> Map.put(acc, key, as_value(value))
    end
  end

  defp as_value(value) do
    case Integer.parse(value) do
      :error -> value
      {number, _} -> number
    end
  end

end
