defmodule Day08 do
  def part_one(input) do
    array = input |> parse()
    l = Enum.count(array) - 1

    for x <- Range.new(0, l) do
      for y <- Range.new(0, l) do
        e = Enum.at(array, x) |> Enum.at(y)
        v = visible?(e, x, y, l, array)
        IO.puts("#{x}/#{y} = #{e} : #{v}")
        v
      end
    end
    |> List.flatten()
    |> Enum.count(fn res -> res == true end)
  end

  defp visible?(e, x, y, l, array) do
    case {x, y} do
      {0, y} -> true
      {x, 0} -> true
      {x, ^l} -> true
      {^l, y} -> true
      _ -> non_edge(e, x, y, l, array)
    end
  end

  defp non_edge(e, x, y, l, array) do
    up =
      for i <- Range.new(0, x - 1) do
        Enum.at(array, i) |> Enum.at(y)
      end

    down =
      for i <- Range.new(x + 1, l) do
        Enum.at(array, i) |> Enum.at(y)
      end

    right = Enum.at(array, x) |> Enum.slice(y + 1, l - 1)
    left = Enum.at(array, x) |> Enum.slice(0, y)

    Enum.all?(up, fn ne -> e > ne end) ||
      Enum.all?(down, fn ne -> e > ne end) ||
      Enum.all?(right, fn ne -> e > ne end) ||
      Enum.all?(left, fn ne -> e > ne end)
  end

  defp parse(input) do
    input
    |> String.split("\r\n", trim: true)
    |> Enum.map(fn line -> String.codepoints(line) end)
    |> Enum.map(fn list ->
      for s <- list do
        String.to_integer(s)
      end
    end)
  end
end
