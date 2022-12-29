
require 'aoc2022'

RSpec.describe Aoc2022::Day19 do

  it "solves part 1 example" do
    day = Aoc2022::Day19.new ::File.expand_path("../../input/2022/day19/input1-example", __dir__), :is_example => true
    expect(day.part1!).to eq(33)
  end

  it "solves part 1" do
    day = Aoc2022::Day19.new ::File.expand_path("../../input/2022/day19/input1", __dir__)
    expect(day.part1!).to eq(2193)
  end

  it "solves part 2" do
    day = Aoc2022::Day19.new ::File.expand_path("../../input/2022/day19/input1", __dir__)
    expect(day.part2!).to eq(7200)
  end

end

