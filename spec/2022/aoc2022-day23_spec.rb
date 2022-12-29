
require 'aoc2022'

RSpec.describe Aoc2022::Day23 do

  it "solves part 1 example" do
    day = Aoc2022::Day23.new ::File.expand_path("../../input/2022/day23/input1-example", __dir__), :is_example => true
    expect(day.part1!).to eq(110)
  end

  it "solves part 1" do
    day = Aoc2022::Day23.new ::File.expand_path("../../input/2022/day23/input1", __dir__)
    expect(day.part1!).to eq(4181)
  end

  it "solves part 2 example" do
    day = Aoc2022::Day23.new ::File.expand_path("../../input/2022/day23/input1-example", __dir__), :is_example => true
    expect(day.part2!).to eq(20)
  end

  it "solves part 2" do
    day = Aoc2022::Day23.new ::File.expand_path("../../input/2022/day23/input1", __dir__)
    expect(day.part2!).to eq(973)
  end

end

