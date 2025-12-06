
require 'aoc2025'

RSpec.describe Aoc2025::Day05 do

  it "solves part 1 example" do
    day = Aoc2025::Day05.new ::File.expand_path("../../input/2025/day05/input1-example", __dir__), :is_example => true
    expect(day.part1!).to eq(3)
  end

  it "solves part 1" do
    day = Aoc2025::Day05.new ::File.expand_path("../../input/2025/day05/input1", __dir__)
    expect(day.part1!).to eq(707)
  end

  it "solves part 2 example" do
    day = Aoc2025::Day05.new ::File.expand_path("../../input/2025/day05/input1-example", __dir__), :is_example => true
    expect(day.part2!).to eq(14)
  end

  it "solves part 2" do
    day = Aoc2025::Day05.new ::File.expand_path("../../input/2025/day05/input1", __dir__)
    expect(day.part2!).to eq(361615643045059)
  end

end

