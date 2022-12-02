defmodule Day02 do
  @win 6
  @draw 3
  @lose 0

  @rock "A"
  @paper "B"
  @scissors "C"

  # A, X: Rock      1
  # B, Y: Paper     2
  # C, Z: Scissors  3
  def totalScorePart1(input) do
    String.split(input, "\r\n", trim: true)
    |> Enum.map(fn b -> String.split(b) end)
    |> Enum.map(fn r -> score1(r) end)
    |> Enum.sum()
  end

  def score1(round) do
    case Enum.at(round, 1) do
      "X" -> 1 + rock(Enum.at(round, 0))
      "Y" -> 2 + paper(Enum.at(round, 0))
      "Z" -> 3 + sci(Enum.at(round, 0))
    end
  end

  def rock(opp) do
    case opp do
      @rock -> @draw
      @paper -> @lose
      @scissors -> @win
    end
  end

  def paper(opp) do
    case opp do
      @rock -> @win
      @paper -> @draw
      @scissors -> @lose
    end
  end

  def sci(opp) do
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
    String.split(input, "\r\n", trim: true)
    |> Enum.map(fn b -> String.split(b) end)
    |> Enum.map(fn r -> score2(r) end)
    |> Enum.sum()
  end

  def score2(round) do
    case Enum.at(round, 1) do
      "X" -> @lose + lose(Enum.at(round, 0))
      "Y" -> @draw + draw(Enum.at(round, 0))
      "Z" -> @win + win(Enum.at(round, 0))
    end
  end

  def win(opp) do
    case opp do
      @rock -> 2
      @paper -> 3
      @scissors -> 1
    end
  end

  def lose(opp) do
    case opp do
      @rock -> 3
      @paper -> 1
      @scissors -> 2
    end
  end

  def draw(opp) do
    case opp do
      @rock -> 1
      @paper -> 2
      @scissors -> 3
    end
  end
end
