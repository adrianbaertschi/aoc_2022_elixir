defmodule Day10Test do
  use ExUnit.Case

  test "Part 1 - Sample Input - List" do
    input = File.read!("./test/input/day10_sample.txt")

    assert Day10.cycle_values(input) == [
             {20, 420},
             {60, 1140},
             {100, 1800},
             {140, 2940},
             {180, 2880},
             {220, 3960}
           ]
  end

  test "Part 1 - Sample Input - Sum" do
    input = File.read!("./test/input/day10_sample.txt")
    assert Day10.part_one(input) == 13140
  end

  test "Part 1 - Challenge" do
    input = File.read!("./test/input/day10_input.txt")
    assert Day10.part_one(input) == 13440
  end

  test "Part 2 - Sample Input" do
    input = File.read!("./test/input/day10_sample.txt")

    expected = """
    ##..##..##..##..##..##..##..##..##..##..
    ###...###...###...###...###...###...###.
    ####....####....####....####....####....
    #####.....#####.....#####.....#####.....
    ######......######......######......####
    #######.......#######.......#######.....
    """

    assert Day10.part_two(input) == expected
  end

  test "Part 2 - Challenge" do
    input = File.read!("./test/input/day10_input.txt")

    expected = """
    ###..###..####..##..###...##..####..##..
    #..#.#..#....#.#..#.#..#.#..#....#.#..#.
    #..#.###....#..#....#..#.#..#...#..#..#.
    ###..#..#..#...#.##.###..####..#...####.
    #....#..#.#....#..#.#.#..#..#.#....#..#.
    #....###..####..###.#..#.#..#.####.#..#.
    """

    assert Day10.part_two(input) == expected
  end
end
