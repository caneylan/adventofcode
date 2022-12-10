
require 'aoc2022'

RSpec.describe Aoc2022::Day10 do

  it "solves part 1 example" do
    day = Aoc2022::Day10.new ::File.expand_path("../../input/2022/day10/input1-example", __dir__)
    expect(day.part1!).to eq(13140)
  end

  it "solves part 1" do
    day = Aoc2022::Day10.new ::File.expand_path("../../input/2022/day10/input1", __dir__)
    expect(day.part1!).to eq(15260)
  end

  it "solves part 2 example" do
    day = Aoc2022::Day10.new ::File.expand_path("../../input/2022/day10/input1-example", __dir__)
    expect(day.part2!).to eq(
      "##..##..##..##..##..##..##..##..##..##..\n" + \
      "###...###...###...###...###...###...###.\n" + \
      "####....####....####....####....####....\n" + \
      "#####.....#####.....#####.....#####.....\n" + \
      "######......######......######......####\n" + \
      "#######.......#######.......#######.....\n"
    )
  end

  it "solves part 2" do
    day = Aoc2022::Day10.new ::File.expand_path("../../input/2022/day10/input1", __dir__)
    expect(day.part2!).to eq(
      "###...##..#..#.####..##..#....#..#..##..\n" + \
      "#..#.#..#.#..#.#....#..#.#....#..#.#..#.\n" + \
      "#..#.#....####.###..#....#....#..#.#....\n" + \
      "###..#.##.#..#.#....#.##.#....#..#.#.##.\n" + \
      "#....#..#.#..#.#....#..#.#....#..#.#..#.\n" + \
      "#.....###.#..#.#.....###.####..##...###.\n"
    )
  end

end

