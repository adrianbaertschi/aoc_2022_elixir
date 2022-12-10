defmodule Day10 do
  def part_one(input) do
    input
    |> cycle_values
    |> Enum.map(fn {_i, v} -> v end)
    |> Enum.sum()
  end

  def cycle_values(input) do
    x = 1
    cycle = 1

    {_x, _c, map} =
      input
      |> parse
      |> Enum.reduce({x, cycle, %{}}, fn instr, acc -> run(instr, acc) end)

    map
    |> Map.to_list()
    |> Enum.map(fn {c, x} -> {c, c * x} end)
    |> Enum.sort_by(fn {c, _v} -> c end)
    |> Enum.drop(19)
    |> Enum.take_every(40)
  end

  defp run(instruction, {x, cycle, a}) do
    {x, cycle, a} =
      case elem(instruction, 0) do
        :add ->
          a = Map.put(a, cycle, x)
          cycle = cycle + 1

          a = Map.put(a, cycle, x)
          cycle = cycle + 1

          x = x + elem(instruction, 2)
          {x, cycle, a}

        :noop ->
          a = Map.put(a, cycle, x)
          cycle = cycle + 1
          {x, cycle, a}
      end

    {x, cycle, Map.put(a, cycle, x)}
  end

  defp parse(input) do
    input
    |> String.split("\r\n", trim: true)
    |> Enum.map(&cmd/1)
  end

  defp cmd(<<"addx ", num::binary>>) do
    {:add, 2, String.to_integer(num)}
  end

  defp cmd("noop") do
    {:noop, 1, 0}
  end
end
