
require 'aoc2024'

RSpec.describe Aoc2024::Day01 do

  it "solves part 1 example" do
    day = Aoc2024::Day01.new ::File.expand_path("../../input/2024/day01/input1-example", __dir__), :is_example => true
    expect(day.part1!).to eq(11)
  end

  it "solves part 1" do
    day = Aoc2024::Day01.new ::File.expand_path("../../input/2024/day01/input1", __dir__)
    expect(day.part1!).to eq(2031679)
  end

  it "solves part 2 example" do
    day = Aoc2024::Day01.new ::File.expand_path("../../input/2024/day01/input1-example", __dir__), :is_example => true
    expect(day.part2!).to eq(31)
  end

  it "solves part 2" do
    day = Aoc2024::Day01.new ::File.expand_path("../../input/2024/day01/input1", __dir__)
    expect(day.part2!).to eq(19678534)
  end

end

