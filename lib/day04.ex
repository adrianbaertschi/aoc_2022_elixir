defmodule Day04 do
  def partOne(input) do
    parse(input)
    |> Enum.filter(fn pair ->
      contains?(Enum.at(pair, 0), Enum.at(pair, 1)) ||
        contains?(Enum.at(pair, 1), Enum.at(pair, 0))
    end)
    |> Enum.count()
  end

  def partTwo(input) do
    parse(input)
    |> Enum.filter(fn pair -> overlaps?(Enum.at(pair, 0), Enum.at(pair, 1)) end)
    |> Enum.count()
  end

  defp parse(input) do
    input
    |> String.split("\r\n", trim: true)
    |> Enum.map(fn line -> String.split(line, ",") end)
    |> Enum.flat_map(fn rangePair ->
      [range(Enum.at(rangePair, 0)), range(Enum.at(rangePair, 1))]
    end)
    |> Enum.chunk_every(2)
  end

  defp range(s) do
    String.split(s, "-")
    |> Enum.map(&String.to_integer/1)
  end

  defp contains?(first, second) do
    a = Enum.at(first, 0) <= Enum.at(second, 0)
    b = Enum.at(first, 1) >= Enum.at(second, 1)
    a && b
  end

  defp overlaps?(first, second) do
    a = Range.new(Enum.at(first, 0), Enum.at(first, 1))
    b = Range.new(Enum.at(second, 0), Enum.at(second, 1))
    !Range.disjoint?(a, b)
  end
end
