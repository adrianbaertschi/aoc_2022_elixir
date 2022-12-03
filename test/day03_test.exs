defmodule Day03Test do
  use ExUnit.Case

  test "Part 1 - Sample Input" do
    input = File.read!("./test/input/day03_sample.txt")
    assert Day03.totalPrioritiesOne(input) == 157
  end

  test "Part 1 - Challenge" do
    input = File.read!("./test/input/day03_input.txt")
    assert Day03.totalPrioritiesOne(input) == 7553
  end

  test "Part 2 - Sample Input" do
    input = File.read!("./test/input/day03_sample.txt")
    assert Day03.totalPrioritiesTwo(input) == 70
  end

  test "Part 2 - Challenge" do
    input = File.read!("./test/input/day03_input.txt")
    assert Day03.totalPrioritiesTwo(input) == 2758
  end
end
