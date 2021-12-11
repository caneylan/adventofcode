require 'aoc2021'

RSpec.describe Aoc2021::Day11 do

  it "returns part1 example 2 grid in an expected format" do
    day = Aoc2021::Day11.new ::File.expand_path("../input/2021/day11/input1-example2", __dir__)
    expect(day.grid).to match_array(
      %w{
        11111
        19991
        19191
        19991
        11111
      }.map { |line| line.chars.map(&:to_i) })
  end

  it "steps part 1 example 2" do
    day = Aoc2021::Day11.new ::File.expand_path("../input/2021/day11/input1-example2", __dir__)

    day.step!
    expect(day.grid).to match_array(
      %w{
        34543
        40004
        50005
        40004
        34543
      }.map { |line| line.chars.map(&:to_i) })

    day.step!
    expect(day.grid).to match_array(
      %w{
        45654
        51115
        61116
        51115
        45654
      }.map { |line| line.chars.map(&:to_i) })
  end

  it "returns part1 example 1 grid in an expected format" do
    day = Aoc2021::Day11.new ::File.expand_path("../input/2021/day11/input1-example", __dir__)
    expect(day.grid).to match_array(
      %w{
        5483143223
        2745854711
        5264556173
        6141336146
        6357385478
        4167524645
        2176841721
        6882881134
        4846848554
        5283751526
      }.map { |line| line.chars.map(&:to_i) })
  end

  it "steps part 1 example 1" do
    day = Aoc2021::Day11.new ::File.expand_path("../input/2021/day11/input1-example", __dir__)

    day.step!
    expect(day.grid).to match_array(
      %w{
        6594254334
        3856965822
        6375667284
        7252447257
        7468496589
        5278635756
        3287952832
        7993992245
        5957959665
        6394862637
      }.map { |line| line.chars.map(&:to_i) })

    day.step!
    expect(day.grid).to match_array(
      %w{
        8807476555
        5089087054
        8597889608
        8485769600
        8700908800
        6600088989
        6800005943
        0000007456
        9000000876
        8700006848
      }.map { |line| line.chars.map(&:to_i) })

    8.times { day.step! }
    expect(day.grid).to match_array(
      %w{
        0481112976
        0031112009
        0041112504
        0081111406
        0099111306
        0093511233
        0442361130
        5532252350
        0532250600
        0032240000
      }.map { |line| line.chars.map(&:to_i) })
  end

  it "solves part 1 example" do
    day = Aoc2021::Day11.new ::File.expand_path("../input/2021/day11/input1-example", __dir__)
    expect(day.part1!(100)).to eq(1656)
  end

  it "solves part 1" do
    day = Aoc2021::Day11.new ::File.expand_path("../input/2021/day11/input1", __dir__)
    expect(day.part1!(100)).to eq(1647)
  end

  it "solves part 2 example" do
    day = Aoc2021::Day11.new ::File.expand_path("../input/2021/day11/input1-example", __dir__)
    expect(day.part2!).to eq(195)
  end

  it "solves part 2" do
    day = Aoc2021::Day11.new ::File.expand_path("../input/2021/day11/input1", __dir__)
    expect(day.part2!).to eq(348)
  end

end
