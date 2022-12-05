defmodule Day05Test do
  use ExUnit.Case

  test "Part 1 - Sample Input" do
    input = File.read!("./test/input/day05_sample.txt")
    assert Day05.partOne(input) == "CMZ"
  end

  test "Part 1 - Challenge" do
    input = File.read!("./test/input/day05_input.txt")
    assert Day05.partOne(input) == "FJSRQCFTN"
  end

  test "Part 2 - Sample Input" do
    input = File.read!("./test/input/day05_sample.txt")
    assert Day05.partTwo(input) == "MCD"
  end

  test "Part 2 - Challenge" do
    input = File.read!("./test/input/day05_input.txt")
    assert Day05.partTwo(input) == "CJVLJQPHS"
  end

end
