defmodule Day06Test do
  use ExUnit.Case

  test "Part 1 - Sample Input" do
    assert Day06.part_one("mjqjpqmgbljsphdztnvjfqwrcgsmlb") == 7
    assert Day06.part_one("bvwbjplbgvbhsrlpgdmjqwftvncz") == 5
    assert Day06.part_one("nppdvjthqldpwncqszvftbrmjlhg") == 6
    assert Day06.part_one("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg") == 10
    assert Day06.part_one("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw") == 11
  end

  test "Part 1 - Challenge" do
    input = File.read!("./test/input/day06_input.txt")
    assert Day06.part_one(input) == 1142
  end

  test "Part 2 - Sample Input" do
    assert Day06.part_two("mjqjpqmgbljsphdztnvjfqwrcgsmlb") == 19
    assert Day06.part_two("bvwbjplbgvbhsrlpgdmjqwftvncz") == 23
    assert Day06.part_two("nppdvjthqldpwncqszvftbrmjlhg") == 23
    assert Day06.part_two("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg") == 29
    assert Day06.part_two("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw") == 26
  end

  test "Part 2 - Challenge" do
    input = File.read!("./test/input/day06_input.txt")
    assert Day06.part_two(input) == 2803
  end
end
