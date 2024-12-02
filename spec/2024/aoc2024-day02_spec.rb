
require 'aoc2024'

RSpec.describe Aoc2024::Day02 do

  it "solves part 1 example" do
    day = Aoc2024::Day02.new ::File.expand_path("../../input/2024/day02/input1-example", __dir__), :is_example => true
    expect(day.part1!).to eq(2)
  end

  it "solves part 1" do
    day = Aoc2024::Day02.new ::File.expand_path("../../input/2024/day02/input1", __dir__)
    expect(day.part1!).to eq(490)
  end

  it "solves part 2 example" do
    day = Aoc2024::Day02.new ::File.expand_path("../../input/2024/day02/input1-example", __dir__), :is_example => true
    expect(day.part2!).to eq(4)
  end

  it "solves part 2" do
    day = Aoc2024::Day02.new ::File.expand_path("../../input/2024/day02/input1", __dir__)
    expect(day.part2!).to eq(536)
  end

end

