
require 'aoc2023'

RSpec.describe Aoc2023::Day12 do

  it "solves part 1 example" do
    day = Aoc2023::Day12.new ::File.expand_path("../../input/2023/day12/input1-example", __dir__), :is_example => true
    expect(day.part1!).to eq(21)
  end

  it "isn't this bad answer 1" do
    day = Aoc2023::Day12.new ::File.expand_path("../../input/2023/day12/input1", __dir__)
    expect(day.part1!).to be < 7713
  end

  it "isn't this bad answer 2" do
    day = Aoc2023::Day12.new ::File.expand_path("../../input/2023/day12/input1", __dir__)
    expect(day.part1!).not_to eq(6915)
  end

  it "solves part 1" do
    day = Aoc2023::Day12.new ::File.expand_path("../../input/2023/day12/input1", __dir__)
    expect(day.part1!).to eq(7379)
  end

  it "solves part 2 example" do
    day = Aoc2023::Day12.new ::File.expand_path("../../input/2023/day12/input1-example", __dir__), :is_example => true
    expect(day.part2!).to eq(525152)
  end

  it "solves part 2" do
    day = Aoc2023::Day12.new ::File.expand_path("../../input/2023/day12/input1", __dir__)
    expect(day.part2!).to eq(7732028747925)
  end

end

