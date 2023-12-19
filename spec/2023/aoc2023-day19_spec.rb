
require 'aoc2023'

RSpec.describe Aoc2023::Day19 do

  it "solves part 1 example" do
    day = Aoc2023::Day19.new ::File.expand_path("../../input/2023/day19/input1-example", __dir__), :is_example => true
    expect(day.part1!).to eq(19114)
  end

  it "solves part 1" do
    day = Aoc2023::Day19.new ::File.expand_path("../../input/2023/day19/input1", __dir__)
    expect(day.part1!).to eq(395382)
  end

  it "solves part 2 example" do
    day = Aoc2023::Day19.new ::File.expand_path("../../input/2023/day19/input1-example", __dir__), :is_example => true
    expect(day.part2!).to eq(167409079868000)
  end

  it "solves part 2" do
    day = Aoc2023::Day19.new ::File.expand_path("../../input/2023/day19/input1", __dir__)
    expect(day.part2!).to eq(103557657654583)
  end

end

