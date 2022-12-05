defmodule Day05 do
  def partOne(input) do
    stacks = parseStacks(input)
    commands = parseCommands(input) |> Enum.map(&expand/1) |> Enum.flat_map(&Function.identity/1)
    run(stacks, commands) |> topRow()
  end

  defp expand(command) do
    for _i <- Range.new(1, List.first(command)) do
      List.replace_at(command, 0, 1)
    end
  end

  def partTwo(input) do
    stacks = parseStacks(input)
    commands = parseCommands(input)
    run(stacks, commands) |> topRow()
  end

  defp parseStacks(input) do
    lines =
      input
      |> String.split("\r\n", trim: true)
      |> Enum.filter(fn line -> !String.starts_with?(line, "move") end)
      |> Enum.reverse()

    indexes = lines |> List.first() |> String.length() |> then(&Range.new(1, &1, 4))

    for i <- indexes do
      for l <- lines do
        String.at(l, i)
      end
      |> Enum.filter(fn s -> String.trim(s) != "" end)
    end
    |> Enum.with_index(fn element, index -> {index + 1, element} end)
    |> Map.new(fn {i, l} -> {i, l} end)
  end

  defp parseCommands(input) do
    input
    |> String.split("\r\n", trim: true)
    |> Enum.filter(fn line -> String.starts_with?(line, "move") end)
    |> Enum.map(fn line -> Regex.scan(~r/\d+/, line) end)
    |> Enum.map(&List.flatten/1)
    |> Enum.map(fn list -> Enum.map(list, &String.to_integer/1) end)
  end

  defp run(stacks, commands) do
    Enum.reduce(commands, stacks, fn cmd, acc -> move(cmd, acc) end)
  end

  defp move(cmd, acc) do
    [count, from, to] = cmd
    {keep, move} = Map.get(acc, from) |> Enum.split(-count)
    acc = Map.put(acc, from, keep)
    Map.update!(acc, to, fn existing -> existing ++ move end)
  end

  defp topRow(stacks) do
    stacks |> Map.values() |> Enum.map(&List.last/1) |> Enum.join()
  end
end
