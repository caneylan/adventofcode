
require 'aoc2023'

RSpec.describe Aoc2023::Day15 do

  it "solves part 1 example string" do
    day = Aoc2023::Day15.new ::File.expand_path("../../input/2023/day15/input1-example", __dir__), :is_example => true
    expect(day.reindeer_hash('HASH')).to eq(52)
  end

  it "solves part 1 example" do
    day = Aoc2023::Day15.new ::File.expand_path("../../input/2023/day15/input1-example", __dir__), :is_example => true
    expect(day.part1!).to eq(1320)
  end

  it "solves part 1" do
    day = Aoc2023::Day15.new ::File.expand_path("../../input/2023/day15/input1", __dir__)
    expect(day.part1!).to eq(517315)
  end

  it "solves part 2 example" do
    day = Aoc2023::Day15.new ::File.expand_path("../../input/2023/day15/input1-example", __dir__), :is_example => true
    expect(day.part2!).to eq(145)
  end

  it "solves part 2" do
    day = Aoc2023::Day15.new ::File.expand_path("../../input/2023/day15/input1", __dir__)
    expect(day.part2!).to eq(247763)
  end

end

