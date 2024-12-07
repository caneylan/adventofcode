
require 'aoc2024'

RSpec.describe Aoc2024::Day07 do

  it "solves part 1 example" do
    day = Aoc2024::Day07.new ::File.expand_path("../../input/2024/day07/input1-example", __dir__), :is_example => true
    expect(day.part1!).to eq(3749)
  end

  it "solves part 1" do
    day = Aoc2024::Day07.new ::File.expand_path("../../input/2024/day07/input1", __dir__)
    expect(day.part1!).to eq(5540634308362)
  end

  it "solves part 2 example" do
    day = Aoc2024::Day07.new ::File.expand_path("../../input/2024/day07/input1-example", __dir__), :is_example => true
    expect(day.part2!).to eq(11387)
  end

  it "solves part 2" do
    day = Aoc2024::Day07.new ::File.expand_path("../../input/2024/day07/input1", __dir__)
    expect(day.part2!).to eq(472290821152397)
  end

end

