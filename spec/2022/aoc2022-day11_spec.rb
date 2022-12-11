
require 'aoc2022'

RSpec.describe Aoc2022::Day11 do

  it "solves part 1 example" do
    day = Aoc2022::Day11.new ::File.expand_path("../../input/2022/day11/input1-example", __dir__)
    expect(day.part1!).to eq(10605)
  end

  it "solves part 1" do
    day = Aoc2022::Day11.new ::File.expand_path("../../input/2022/day11/input1", __dir__)
    expect(day.part1!).to eq(62491)
  end

  it "solves part 2 example" do
    day = Aoc2022::Day11.new ::File.expand_path("../../input/2022/day11/input1-example", __dir__)
    expect(day.part2!).to eq(2713310158)
  end

  it "solves part 2" do
    day = Aoc2022::Day11.new ::File.expand_path("../../input/2022/day11/input1", __dir__)
    expect(day.part2!).to eq(17408399184)
  end

end

