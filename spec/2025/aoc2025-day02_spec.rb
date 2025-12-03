
require 'aoc2025'

RSpec.describe Aoc2025::Day02 do

  it "solves part 1 example" do
    day = Aoc2025::Day02.new ::File.expand_path("../../input/2025/day02/input1-example", __dir__), :is_example => true
    expect(day.part1!).to eq(1227775554)
  end

  it "solves part 1" do
    day = Aoc2025::Day02.new ::File.expand_path("../../input/2025/day02/input1", __dir__)
    expect(day.part1!).to eq(19605500130)
  end

  it "solves part 2 example" do
    day = Aoc2025::Day02.new ::File.expand_path("../../input/2025/day02/input1-example", __dir__), :is_example => true
    expect(day.part2!).to eq(4174379265)
  end

  it "solves part 2" do
    day = Aoc2025::Day02.new ::File.expand_path("../../input/2025/day02/input1", __dir__)
    expect(day.part2!).to eq(36862281418)
  end

end

