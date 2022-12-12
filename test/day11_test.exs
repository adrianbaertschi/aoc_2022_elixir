defmodule Day11Test do
  use ExUnit.Case

  test "Part 1 - Sample Input - Parsing" do
    input = File.read!("./test/input/day11_sample.txt")

    assert Day11.parse(input) == %{
             0 => %Day11.Monkey{
               id: 0,
               items: [79, 98],
               operation: {"*", 19},
               test_div: 23,
               if_true: 2,
               if_false: 3
             },
             1 => %Day11.Monkey{
               id: 1,
               items: [54, 65, 75, 74],
               operation: {"+", 6},
               test_div: 19,
               if_true: 2,
               if_false: 0
             },
             2 => %Day11.Monkey{
               id: 2,
               items: [79, 60, 97],
               operation: {"^", 2},
               test_div: 13,
               if_true: 1,
               if_false: 3
             },
             3 => %Day11.Monkey{
               id: 3,
               items: [74],
               operation: {"+", 3},
               test_div: 17,
               if_true: 0,
               if_false: 1
             }
           }
  end

  test "Part 1 - Sample Input - Sum" do
    input = File.read!("./test/input/day11_sample.txt")
    assert Day11.part_one(input) == 10605
  end

  #
  #  test "Part 1 - Challenge" do
  #    input = File.read!("./test/input/day11_input.txt")
  #    assert Day11.part_one(input) == 1
  #  end
  #
  #  test "Part 2 - Sample Input" do
  #    input = File.read!("./test/input/day11_sample.txt")
  #    assert Day11.part_two(input) == 1
  #  end
  #
  #  test "Part 2 - Challenge" do
  #    input = File.read!("./test/input/day11_input.txt")
  #    assert Day11.part_two(input) == 1
  #  end
end
