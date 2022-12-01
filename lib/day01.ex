defmodule Day01 do
  def getMaxCalories(input) do
    getTotalCaloriesFromTop(input, 1)
  end

  def getTotalCaloriesFromTop(input, num) do
    String.split(input, "\r\n")
    |> Enum.chunk_by(fn e -> e == "" end)
    |> Enum.filter(fn l -> Enum.at(l, 0) != "" end)
    |> Enum.map(fn l -> Enum.map(l, fn i -> String.to_integer(i) end) end)
    |> Enum.map(fn i -> Enum.sum(i) end)
    |> Enum.sort(:desc)
    |> Enum.take(num)
    |> Enum.sum()
  end
end
