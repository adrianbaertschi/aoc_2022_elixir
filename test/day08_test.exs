defmodule Day08Test do
  use ExUnit.Case

  test "Part 1 - Sample Input" do
    input = File.read!("./test/input/day08_sample.txt")
    assert Day08.part_one(input) == 21
  end

  test "Part 1 - Challenge" do
    input = File.read!("./test/input/day08_input.txt")
    assert Day08.part_one(input) == 1829
  end

  test "Part 2 - Sample Input" do
    input = File.read!("./test/input/day08_sample.txt")
    assert Day08.part_two(input) == 8
  end

  test "Part 2 - Challenge" do
    input = File.read!("./test/input/day08_input.txt")
    assert Day08.part_two(input) == 291_840
  end
end
