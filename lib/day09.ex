defmodule Day09 do
  @row_max 4
  @col_max 5
  def part_one(input) do
    s = MapSet.new([[4, 0]])
    h = [4, 0]
    t = [4, 0]

    IO.puts("== Initial State ==\n")

    grid = {s, h, t}
    print_grid(grid)

    commands = parse(input)
    {visited, h, t} = Enum.reduce(commands, grid, fn c, acc -> move(acc, c) end)
    visited |> MapSet.size()
  end

  defp move(grid, {direction, count}) do
    IO.puts("== #{direction} #{count} ==")

    Enum.reduce(1..count, grid, fn _x, acc ->
      {visited, h, t} = acc

      h =
        case direction do
          "R" ->
            List.update_at(h, 1, &(&1 + 1))

          "L" ->
            List.update_at(h, 1, &(&1 - 1))

          "U" ->
            List.update_at(h, 0, &(&1 - 1))

          "D" ->
            List.update_at(h, 0, &(&1 + 1))
        end

      t = follow(t, h)
      visited = MapSet.put(visited, t)
      acc = {visited, h, t}
      print_grid(acc)
      acc
    end)
  end

  defp follow(t, h) do
    {x_diff, y_diff} = diffs(t, h)

    if abs(x_diff) <= 1 && abs(y_diff) <= 1 do
      t
    else
      move_tail(t, {x_diff, y_diff})
    end
  end

  defp move_tail(t, {x_diff, y_diff}) do
    [x, y] = t
    [x + sign(x_diff), y + sign(y_diff)]
  end

  defp sign(number), do: if(number > 0, do: 1, else: if(number < 0, do: -1, else: 0))

  defp diffs(t, h) do
    x = List.first(h) - List.first(t)
    y = List.last(h) - List.last(t)
    {x, y}
  end

  defp print_grid({visited, h, t}) do
    for x <- 0..@row_max do
      for y <- 0..@col_max do
        case [x, y] do
          ^h -> IO.write("H")
          ^t -> IO.write("T")
          _ -> IO.write(".")
        end
      end

      IO.puts("")
    end

    IO.puts("\n")
  end

  defp parse(input) do
    input
    |> String.split("\r\n", trim: true)
    |> Enum.map(fn l -> List.to_tuple(String.split(l)) end)
    |> Enum.map(fn {dir, count} -> {dir, String.to_integer(count)} end)
  end
end
