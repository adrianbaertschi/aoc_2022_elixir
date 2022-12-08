defmodule Day08 do
  def part_one(input) do
    array = input |> parse()
    l = Enum.count(array) - 1

    for x <- Range.new(0, l) do
      for y <- Range.new(0, l) do
        visible?(x, y, l, array)
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
        viewing_dist(x, y, l, array)
      end
    end
    |> List.flatten()
    |> Enum.max()
  end

  defp viewing_dist(x, y, l, array) do
    parts = neighbours_two(x, y, l, array)
    e = array |> Enum.at(x) |> Enum.at(y)
    calc_dist(parts, e)
  end

  defp calc_dist(parts, e) do
    parts
    |> Enum.map(fn el -> dist(el, e) end)
    |> Enum.product()
  end

  defp dist(list, e) do
    Enum.reduce_while(list, 0, fn x, acc ->
      if x >= e, do: {:halt, acc + 1}, else: {:cont, acc + 1}
    end)
  end

  defp visible?(x, y, l, array) do
    case {x, y} do
      {x, _y} when x in [0, l] ->
        true

      {_x, y} when y in [0, l] ->
        true

      _ ->
        e = array |> Enum.at(x) |> Enum.at(y)

        neighbours_one(x, y, l, array)
        |> Enum.any?(fn list -> Enum.all?(list, fn ne -> e > ne end) == true end)
    end
  end

  defp neighbours_two(x, y, l, array) do
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

    [up, down, right, left]
  end

  defp neighbours_one(x, y, l, array) do
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

    [up, down, right, left]
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
