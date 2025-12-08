
require 'aoc2025'

RSpec.describe Aoc2025::Day07 do

  it "solves part 1 example" do
    day = Aoc2025::Day07.new ::File.expand_path("../../input/2025/day07/input1-example", __dir__), :is_example => true
    expect(day.part1!).to eq(21)
  end

  it "solves part 1" do
    day = Aoc2025::Day07.new ::File.expand_path("../../input/2025/day07/input1", __dir__)
    expect(day.part1!).to eq(1642)
  end

  it "solves part 2 example" do
    day = Aoc2025::Day07.new ::File.expand_path("../../input/2025/day07/input1-example", __dir__), :is_example => true
    expect(day.part2!).to eq(40)
  end

  it "solves part 2" do
    day = Aoc2025::Day07.new ::File.expand_path("../../input/2025/day07/input1", __dir__)
    expect(day.part2!).to eq(47274292756692)
  end

end

