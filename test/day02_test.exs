defmodule Day02Test do
  use ExUnit.Case

  test "Part 1 - Sample Input" do
    input = File.read!("./test/input/day02_sample.txt")
    assert Day02.totalScorePart1(input) == 15
  end

  test "Part 1 - Challenge" do
    input = File.read!("./test/input/day02_input.txt")
    assert Day02.totalScorePart1(input) == 14069
  end

  test "Part 2 - Sample Input" do
    input = File.read!("./test/input/day02_sample.txt")
    assert Day02.totalScorePart2(input) == 12
  end

  test "Part 2 - Challenge" do
    input = File.read!("./test/input/day02_input.txt")
    assert Day02.totalScorePart2(input) == 12411
  end
end
