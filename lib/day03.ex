defmodule Day03 do
  def totalPrioritiesOne(input) do
    String.split(input, "\r\n", trim: true)
    |> Enum.map(fn l -> String.split_at(l, trunc(String.length(l) / 2)) end)
    |> Enum.map(fn ru -> findDuplicates(elem(ru, 0), elem(ru, 1)) end)
    |> List.flatten()
    |> Enum.map(&score/1)
    |> Enum.sum()
  end

  defp findDuplicates(left, right) do
    String.codepoints(left)
    |> Enum.filter(fn e -> Enum.member?(String.codepoints(right), e) end)
    |> Enum.dedup()
  end

  defp findDuplicates(one, two, three) do
    String.codepoints(one)
    |> Enum.filter(fn e -> Enum.member?(String.codepoints(two), e) end)
    |> Enum.filter(fn e -> Enum.member?(String.codepoints(three), e) end)
    |> Enum.dedup()
  end

  defp score(c) do
    <<i::utf8>> = c

    cond do
      String.upcase(c) == c -> i - 38
      String.downcase(c) == c -> i - 96
    end
  end

  def totalPrioritiesTwo(input) do
    String.split(input, "\r\n", trim: true)
    |> Enum.chunk_every(3)
    |> Enum.map(fn ru -> findDuplicates(Enum.at(ru, 0), Enum.at(ru, 1), Enum.at(ru, 2)) end)
    |> List.flatten()
    |> Enum.map(&score/1)
    |> Enum.sum()
  end
end
