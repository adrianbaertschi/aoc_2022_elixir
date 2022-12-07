# https://github.com/sevenseacat/advent_of_code/blob/main/lib/y2022/day07.ex

defmodule Day07 do
  def part_one(input) do
    parsed = parse(input)

    calc_sizes({"/", parsed}, [])
    |> Enum.filter(fn {_k, v} -> v <= 100_000 end)
    |> Enum.map(&elem(&1, 1))
    |> Enum.sum()
  end

  def part_two(input) do
    parsed = parse(input)

    sizes =
      calc_sizes({"/", parsed}, [])
      |> Enum.map(fn {_a, b} -> b end)
      |> Enum.sort()

    Enum.filter(sizes, fn s -> List.last(sizes) - s <= 40_000_000 end)
    |> List.first()
  end

  defp calc_sizes({_name, size}, acc) when is_integer(size), do: acc

  defp calc_sizes({name, children}, acc) do
    Enum.reduce(children, [{name, dir_size(children)} | acc], fn child, acc ->
      calc_sizes(child, acc)
    end)
  end

  defp dir_size(int) when is_integer(int), do: int

  defp dir_size(directory) do
    Enum.map(
      directory,
      fn
        {_key, size} when is_integer(size) -> size
        {_key, children} when is_map(children) -> dir_size(children)
      end
    )
    |> Enum.sum()
  end

  def parse(input) do
    input
    |> String.split("\r\n", trim: true)
    |> Enum.drop(1)
    |> Enum.reduce({%{"/" => %{}}, ["/"]}, &parse_row/2)
    |> elem(0)
    |> Map.get("/")
  end

  defp parse_row("$ ls", {data, path}), do: {data, path}
  defp parse_row(<<"$ cd ..">>, {data, path}), do: {data, Enum.drop(path, -1)}
  defp parse_row(<<"$ cd ", name::binary>>, {data, path}), do: {data, path ++ [name]}

  defp parse_row(<<"dir ", name::binary>>, {data, index}) do
    {update_in(data, index, fn folder -> Map.put(folder, name, %{}) end), index}
  end

  defp parse_row(file, {data, index}) do
    [size, name] = String.split(file, " ")

    {update_in(data, index, fn folder -> Map.put(folder, name, String.to_integer(size)) end),
     index}
  end
end
