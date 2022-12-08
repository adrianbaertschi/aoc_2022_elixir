defmodule Day08 do
  def part_one(input) do
    array = input |> parse()
    l = Enum.count(array) - 1

    for x <- Range.new(0, l) do
      for y <- Range.new(0, l) do
        e = Enum.at(array, x) |> Enum.at(y)
        visible?(e, x, y, l, array)
      end
    end
    |> List.flatten()
    |> Enum.count(fn res -> res == true end)
  end

  def part_two(input) do
    array = input |> parse()
    l = Enum.count(array) - 1

    for x <- Range.new(0, l) do
      for y <- Range.new(0, l) do
        e = Enum.at(array, x) |> Enum.at(y)
        viewing_dist(x, y, l, array)
      end
    end
    |> List.flatten()
    |> Enum.max()
  end

  defp viewing_dist(x, y, l, array) do
    e = Enum.at(array, x) |> Enum.at(y)
    tu = neighbours(0, x, y, l, array)
    calc_dist(tu, e)
  end

  defp calc_dist({up, down, right, left}, e) do
    u = dist(up, e)
    d = dist(down, e)
    r = dist(right, e)
    l = dist(left, e)
    u * d * r * l
  end

  defp dist(list, e) do
    Enum.reduce_while(list, 0, fn x, acc ->
      if x >= e, do: {:halt, acc + 1}, else: {:cont, acc + 1}
    end)
  end

  defp visible?(e, x, y, l, array) do
    case {x, y} do
      {0, y} ->
        true

      {x, 0} ->
        true

      {x, ^l} ->
        true

      {^l, y} ->
        true

      _ ->
        {up, down, right, left} = non_edge(e, x, y, l, array)

        Enum.all?(up, fn ne -> e > ne end) ||
          Enum.all?(down, fn ne -> e > ne end) ||
          Enum.all?(right, fn ne -> e > ne end) ||
          Enum.all?(left, fn ne -> e > ne end)
    end
  end

  defp neighbours(e, x, y, l, array) do
    up =
      if x == 0 do
        []
      else
        for i <- Range.new(0, x - 1) do
          Enum.at(array, i) |> Enum.at(y)
        end
        |> Enum.reverse()
      end

    down =
      if x == l do
        []
      else
        for i <- Range.new(x + 1, l) do
          Enum.at(array, i) |> Enum.at(y)
        end
      end

    right = Enum.at(array, x) |> Enum.slice(y + 1, l)
    left = Enum.at(array, x) |> Enum.slice(0, y) |> Enum.reverse()

    {up, down, right, left}
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

    {up, down, right, left}
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
