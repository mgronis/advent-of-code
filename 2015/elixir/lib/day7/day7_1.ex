
defmodule Day7_1 do
  use Bitwise

  def solve do
    solve "a", "lib/day7/input"
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
