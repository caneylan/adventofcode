
require 'aoc2024'

RSpec.describe Aoc2024::Day06 do

  it "solves part 1 example" do
    day = Aoc2024::Day06.new ::File.expand_path("../../input/2024/day06/input1-example", __dir__), :is_example => true
    expect(day.part1!).to eq(41)
  end

  it "solves part 1" do
    day = Aoc2024::Day06.new ::File.expand_path("../../input/2024/day06/input1", __dir__)
    expect(day.part1!).to eq(4939)
  end

  it "solves part 2 example" do
    day = Aoc2024::Day06.new ::File.expand_path("../../input/2024/day06/input1-example", __dir__), :is_example => true
    expect(day.part2!).to eq(6)
  end

  it "solves part 2" do
    day = Aoc2024::Day06.new ::File.expand_path("../../input/2024/day06/input1", __dir__)
    expect(day.part2!).to eq(1434)
  end

end

