
require 'aoc2025'

RSpec.describe Aoc2025::Day04 do

  it "solves part 1 example" do
    day = Aoc2025::Day04.new ::File.expand_path("../../input/2025/day04/input1-example", __dir__), :is_example => true
    expect(day.part1!).to eq(13)
  end

  it "solves part 1" do
    day = Aoc2025::Day04.new ::File.expand_path("../../input/2025/day04/input1", __dir__)
    expect(day.part1!).to eq(1516)
  end

  it "solves part 2 example" do
    day = Aoc2025::Day04.new ::File.expand_path("../../input/2025/day04/input1-example", __dir__), :is_example => true
    expect(day.part2!).to eq(43)
  end

  it "solves part 2" do
    day = Aoc2025::Day04.new ::File.expand_path("../../input/2025/day04/input1", __dir__)
    expect(day.part2!).to eq(9122)
  end

end

