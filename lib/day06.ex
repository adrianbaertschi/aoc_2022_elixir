defmodule Day06 do
  def part_one(input) do
    find_unique_seq_idx(input, 4)
  end

  def part_two(input) do
    find_unique_seq_idx(input, 14)
  end

  defp find_unique_seq_idx(input, length) do
    startIndex =
      0..(String.length(input) - length)
      |> Enum.map(fn i -> String.slice(input, i, length) end)
      |> Enum.find_index(&all_different?/1)

    startIndex + length
  end

  defp all_different?(seq) do
    String.split(seq, "", trim: true) |> Enum.uniq() |> Enum.count() == String.length(seq)
  end
end
