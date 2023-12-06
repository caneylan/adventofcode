
require 'aoc2023'

RSpec.describe Aoc2023::Day05 do

  it "solves part 1 example" do
    day = Aoc2023::Day05.new ::File.expand_path("../../input/2023/day05/input1-example", __dir__), :is_example => true
    expect(day.part1!).to eq(35)
  end

  it "solves part 1" do
    day = Aoc2023::Day05.new ::File.expand_path("../../input/2023/day05/input1", __dir__)
    expect(day.part1!).to eq(462648396)
  end

  it "solves part 2 example" do
    day = Aoc2023::Day05.new ::File.expand_path("../../input/2023/day05/input1-example", __dir__), :is_example => true
    expect(day.part2!).to eq(46)
  end

  return
  # this takes about 9 hours to run.

  it "solves part 2" do
    day = Aoc2023::Day05.new ::File.expand_path("../../input/2023/day05/input1", __dir__)
    expect(day.part2!).to eq(2520479)
  end

end

