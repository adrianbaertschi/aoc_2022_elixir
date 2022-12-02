defmodule Day01Test do
  use ExUnit.Case

  test "Part 1 - Sample input" do
    input = File.read!("./test/input/day01_sample.txt")
    assert Day01.getMaxCalories(input) == 24000
  end

  test "Part 1 - Challenge" do
    input = File.read!("./test/input/day01_input.txt")
    assert Day01.getMaxCalories(input) == 69626
  end

  test "Part 2 - Sample input" do
    input = File.read!("./test/input/day01_sample.txt")
    assert Day01.getTotalCaloriesFromTop(input, 3) == 45000
  end

  test "Part 2 - Challenge" do
    input = File.read!("./test/input/day01_input.txt")
    assert Day01.getTotalCaloriesFromTop(input, 3) == 206780
  end

end
