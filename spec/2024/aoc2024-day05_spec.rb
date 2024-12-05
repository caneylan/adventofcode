
require 'aoc2024'

RSpec.describe Aoc2024::Day05 do

  it "solves part 1 example" do
    day = Aoc2024::Day05.new ::File.expand_path("../../input/2024/day05/input1-example", __dir__), :is_example => true
    expect(day.part1!).to eq(143)
  end

  it "solves part 1" do
    day = Aoc2024::Day05.new ::File.expand_path("../../input/2024/day05/input1", __dir__)
    expect(day.part1!).to eq(3608)
  end

  it "solves part 2 example" do
    day = Aoc2024::Day05.new ::File.expand_path("../../input/2024/day05/input1-example", __dir__), :is_example => true
    expect(day.part2!).to eq(123)
  end

  it "solves part 2" do
    day = Aoc2024::Day05.new ::File.expand_path("../../input/2024/day05/input1", __dir__)
    expect(day.part2!).to eq(4922)
  end

end

