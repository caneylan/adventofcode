
require 'aoc2022'

RSpec.describe Aoc2022::Day12 do

  it "solves part 1 example" do
    day = Aoc2022::Day12.new ::File.expand_path("../../input/2022/day12/input1-example", __dir__)
    expect(day.part1!).to eq(31)
  end

  it "solves part 1" do
    day = Aoc2022::Day12.new ::File.expand_path("../../input/2022/day12/input1", __dir__)
    expect(day.part1!).to eq(447)
  end

  it "solves part 2 example" do
    day = Aoc2022::Day12.new ::File.expand_path("../../input/2022/day12/input1-example", __dir__)
    expect(day.part2!).to eq(29)
  end

  it "solves part 2" do
    day = Aoc2022::Day12.new ::File.expand_path("../../input/2022/day12/input1", __dir__)
    expect(day.part2!).to eq(446)
  end

end

