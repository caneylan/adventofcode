
require 'aoc2022'

RSpec.describe Aoc2022::Day17 do

  it "solves part 1 example" do
    day = Aoc2022::Day17.new ::File.expand_path("../../input/2022/day17/input1-example", __dir__), :is_example => true
    expect(day.part1!).to eq(3068)
  end

  it "solves part 1" do
    day = Aoc2022::Day17.new ::File.expand_path("../../input/2022/day17/input1", __dir__)
    expect(day.part1!).to eq(3239)
  end

  it "solves part 2 example" do
    day = Aoc2022::Day17.new ::File.expand_path("../../input/2022/day17/input1-example", __dir__), :is_example => true
    expect(day.part2!).to eq(1514285714288)
  end

  it "solves part 2" do
    day = Aoc2022::Day17.new ::File.expand_path("../../input/2022/day17/input1", __dir__)
    expect(day.part2!).to eq(false)
  end

end

