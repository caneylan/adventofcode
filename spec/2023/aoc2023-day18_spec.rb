
require 'aoc2023'

RSpec.describe Aoc2023::Day18 do

  it "solves part 1 example" do
    day = Aoc2023::Day18.new ::File.expand_path("../../input/2023/day18/input1-example", __dir__), :is_example => true
    expect(day.part1!).to eq(62)
  end

  it "solves part 1" do
    day = Aoc2023::Day18.new ::File.expand_path("../../input/2023/day18/input1", __dir__)
    expect(day.part1!).to eq(53300)
  end

  it "solves part 2 example" do
    day = Aoc2023::Day18.new ::File.expand_path("../../input/2023/day18/input1-example", __dir__), :is_example => true
    expect(day.part2!).to eq(952408144115)
  end

  it "solves part 2" do
    day = Aoc2023::Day18.new ::File.expand_path("../../input/2023/day18/input1", __dir__)
    expect(day.part2!).to eq(64294334780659)
  end

end

