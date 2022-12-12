defmodule Day09Test do
  use ExUnit.Case

  test "Part 1 - Sample Input" do
    input = File.read!("./test/input/day09_sample.txt")
    assert Day09.part_one(input) == 13
  end

  test "Part 1 - Challenge" do
    input = File.read!("./test/input/day09_input.txt")
    assert Day09.part_one(input) == 6498
  end
end
