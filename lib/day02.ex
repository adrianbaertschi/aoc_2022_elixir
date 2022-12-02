defmodule Day02 do
  @win 6
  @draw 3
  @lose 0

  @rock "A"
  @paper "B"
  @scissors "C"

  @p_rock 1
  @p_paper 2
  @p_scissors 3

  # A, X: Rock      1
  # B, Y: Paper     2
  # C, Z: Scissors  3
  def totalScorePart1(input) do
    parse(input)
    |> Enum.map(&score1/1)
    |> Enum.sum()
  end

  defp score1(round) do
    case Enum.at(round, 1) do
      "X" -> @p_rock + rock(Enum.at(round, 0))
      "Y" -> @p_paper + paper(Enum.at(round, 0))
      "Z" -> @p_scissors + sci(Enum.at(round, 0))
    end
  end

  defp rock(opp) do
    case opp do
      @rock -> @draw
      @paper -> @lose
      @scissors -> @win
    end
  end

  defp paper(opp) do
    case opp do
      @rock -> @win
      @paper -> @draw
      @scissors -> @lose
    end
  end

  defp sci(opp) do
    case opp do
      @rock -> @lose
      @paper -> @win
      @scissors -> @draw
    end
  end

  # X: lose 0
  # Y: win  6
  # Z: draw 3
  def totalScorePart2(input) do
    parse(input)
    |> Enum.map(&score2/1)
    |> Enum.sum()
  end

  defp score2(round) do
    case Enum.at(round, 1) do
      "X" -> @lose + lose(Enum.at(round, 0))
      "Y" -> @draw + draw(Enum.at(round, 0))
      "Z" -> @win + win(Enum.at(round, 0))
    end
  end

  defp win(opp) do
    case opp do
      @rock -> @p_paper
      @paper -> @p_scissors
      @scissors -> @p_rock
    end
  end

  defp lose(opp) do
    case opp do
      @rock -> @p_scissors
      @paper -> @p_rock
      @scissors -> @p_paper
    end
  end

  defp draw(opp) do
    case opp do
      @rock -> @p_rock
      @paper -> @p_paper
      @scissors -> @p_scissors
    end
  end

  defp parse(input) do
    String.split(input, "\r\n", trim: true)
    |> Enum.map(&String.split/1)
  end
end
