require 'aoc2021'

RSpec.describe Aoc2021::Day12 do

  it "solves part 1 example 1" do
    day = Aoc2021::Day12.new ::File.expand_path("../../input/2021/day12/input1-example", __dir__)
    expect(day.part1!).to eq(10)
  end

  it "solves part 1 example 2" do
    day = Aoc2021::Day12.new ::File.expand_path("../../input/2021/day12/input1-example2", __dir__)
    expect(day.part1!).to eq(19)
  end

  it "solves part 1 example 3" do
    day = Aoc2021::Day12.new ::File.expand_path("../../input/2021/day12/input1-example3", __dir__)
    expect(day.part1!).to eq(226)
  end

  it "solves part 1" do
    day = Aoc2021::Day12.new ::File.expand_path("../../input/2021/day12/input1", __dir__)
    expect(day.part1!).to eq(3230)
  end

  it "solves part 2 example 1" do
    day = Aoc2021::Day12.new ::File.expand_path("../../input/2021/day12/input1-example", __dir__)
    expect(day.part2!).to eq(36)
  end

  it "solves part 2 example 2" do
    day = Aoc2021::Day12.new ::File.expand_path("../../input/2021/day12/input1-example2", __dir__)
    expect(day.part2!).to eq(103)
  end

  it "solves part 2 example 3" do
    day = Aoc2021::Day12.new ::File.expand_path("../../input/2021/day12/input1-example3", __dir__)
    expect(day.part2!).to eq(3509)
  end

  it "solves part 2" do
    day = Aoc2021::Day12.new ::File.expand_path("../../input/2021/day12/input1", __dir__)
    expect(day.part2!).to eq(83475)
  end

end
