defmodule Day10 do
  def part_one(input) do
    input |> cycle_values |> Enum.map(fn {_i, v} -> v end) |> Enum.sum()
  end

  def part_two(input) do
    input
    |> parse
    |> run_instructions
    |> Enum.drop(-1)
    |> Enum.map(fn {c, x} -> crt(c - 1, x) end)
    |> Enum.chunk_every(40)
    |> Enum.join("\n")
    |> then(&(&1 <> "\n"))
  end

  def cycle_values(input) do
    input
    |> parse
    |> run_instructions
    |> Enum.drop(19)
    |> Enum.take_every(40)
    |> Enum.map(fn {c, x} -> {c, c * x} end)
  end

  defp run_instructions(parsed) do
    {_c, map} =
      parsed
      |> Enum.reduce({1, %{1 => 1}}, fn instr, acc -> run(instr, acc) end)

    map |> Map.to_list() |> Enum.sort_by(fn {c, _v} -> c end)
  end

  defp run(instruction, {cycle, a}) do
    x = Map.get(a, cycle)
    cycle = cycle + 1

    case elem(instruction, 0) do
      :add ->
        a = Map.put(a, cycle, x)
        cycle = cycle + 1
        x = x + elem(instruction, 1)
        {cycle, Map.put(a, cycle, x)}

      :noop ->
        {cycle, Map.put(a, cycle, x)}
    end
  end

  defp crt(idx, x) do
    if abs(x - rem(idx, 40)) <= 1, do: "#", else: "."
  end

  defp parse(input) do
    input
    |> String.split("\r\n", trim: true)
    |> Enum.map(&cmd/1)
  end

  defp cmd(<<"addx ", num::binary>>) do
    {:add, String.to_integer(num)}
  end

  defp cmd("noop") do
    {:noop, 0}
  end
end
