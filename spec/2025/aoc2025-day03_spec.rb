
require 'aoc2025'

RSpec.describe Aoc2025::Day03 do

  it "solves part 1 example" do
    day = Aoc2025::Day03.new ::File.expand_path("../../input/2025/day03/input1-example", __dir__), :is_example => true
    expect(day.part1!).to eq(357)
  end

  it "solves part 1" do
    day = Aoc2025::Day03.new ::File.expand_path("../../input/2025/day03/input1", __dir__)
    expect(day.part1!).to eq(17435)
  end

  it "solves part 2 example" do
    day = Aoc2025::Day03.new ::File.expand_path("../../input/2025/day03/input1-example", __dir__), :is_example => true
    expect(day.part2!).to eq(3121910778619)
  end

  it "solves part 2" do
    day = Aoc2025::Day03.new ::File.expand_path("../../input/2025/day03/input1", __dir__)
    expect(day.part2!).to eq(172886048065379)
  end

end

