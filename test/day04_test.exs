defmodule Day04Test do
  use ExUnit.Case

  test "Part 1 - Sample Input" do
    input = File.read!("./test/input/day04_sample.txt")
    assert Day04.partOne(input) == 2
  end

  test "Part 1 - Challenge" do
    input = File.read!("./test/input/day04_input.txt")
    assert Day04.partOne(input) == 515
  end

  test "Part 2 - Sample Input" do
    input = File.read!("./test/input/day04_sample.txt")
    assert Day04.partTwo(input) == 4
  end

  test "Part 2 - Challenge" do
    input = File.read!("./test/input/day04_input.txt")
    assert Day04.partTwo(input) == 883
  end
end
