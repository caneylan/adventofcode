
require 'aoc2022'

RSpec.describe Aoc2022::Day18 do

  it "solves part 1 example" do
    day = Aoc2022::Day18.new ::File.expand_path("../../input/2022/day18/input1-example", __dir__), :is_example => true
    expect(day.part1!).to eq(64)
  end

  it "solves part 1" do
    day = Aoc2022::Day18.new ::File.expand_path("../../input/2022/day18/input1", __dir__)
    expect(day.part1!).to eq(4282)
  end

  it "solves part 2 example" do
    day = Aoc2022::Day18.new ::File.expand_path("../../input/2022/day18/input1-example", __dir__), :is_example => true
    expect(day.part2!).to eq(58)
  end

  it "solves part 2" do
    day = Aoc2022::Day18.new ::File.expand_path("../../input/2022/day18/input1", __dir__)
    expect(day.part2!).to eq(2452)
  end

end

