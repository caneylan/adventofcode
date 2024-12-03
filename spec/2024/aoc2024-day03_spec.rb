
require 'aoc2024'

RSpec.describe Aoc2024::Day03 do

  it "solves part 1 example" do
    day = Aoc2024::Day03.new ::File.expand_path("../../input/2024/day03/input1-example", __dir__), :is_example => true
    expect(day.part1!).to eq(161)
  end

  it "solves part 1" do
    day = Aoc2024::Day03.new ::File.expand_path("../../input/2024/day03/input1", __dir__)
    expect(day.part1!).to eq(159892596)
  end

  it "solves part 2 example" do
    day = Aoc2024::Day03.new ::File.expand_path("../../input/2024/day03/input2-example", __dir__), :is_example => true
    expect(day.part2!).to eq(48)
  end

  it "solves part 2" do
    day = Aoc2024::Day03.new ::File.expand_path("../../input/2024/day03/input1", __dir__)
    expect(day.part2!).to eq(92626942)
  end

end

