defmodule Day07Test do
  use ExUnit.Case

  test "Part 1 - Sample parse input" do
    input = File.read!("./test/input/day07_sample.txt")

    t = %{
      "a" => %{
        "e" => %{
          "i" => 584
        },
        "f" => 29116,
        "g" => 2557,
        "h.lst" => 62596
      },
      "b.txt" => 14_848_514,
      "c.dat" => 8_504_156,
      "d" => %{
        "j" => 4_060_174,
        "d.log" => 8_033_020,
        "d.ext" => 5_626_152,
        "k" => 7_214_296
      }
    }

    assert Day07.parse(input) == t
  end

  test "Part 1 - Sample result" do
    input = File.read!("./test/input/day07_sample.txt")
    assert Day07.part_one(input) == 95437
  end

  test "Part 1 - Challenge" do
    input = File.read!("./test/input/day07_input.txt")
    assert Day07.part_one(input) == 1_642_503
  end

  test "Part 2 - Sample Input" do
    input = File.read!("./test/input/day07_sample.txt")
    assert Day07.part_two(input) == 24_933_642
  end

  test "Part 2 - Challenge" do
    input = File.read!("./test/input/day07_input.txt")
    assert Day07.part_two(input) == 6_999_588
  end
end
