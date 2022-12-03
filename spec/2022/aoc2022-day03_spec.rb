
require 'aoc2022'

RSpec.describe Aoc2022::Day03 do

  it "solves part 1 example" do
    day = Aoc2022::Day03.new ::File.expand_path("../../input/2022/day03/input1-example", __dir__)
    expect(day.part1!).to eq(157)
  end

  it "solves part 1" do
    day = Aoc2022::Day03.new ::File.expand_path("../../input/2022/day03/input1", __dir__)
    expect(day.part1!).to eq(7908)
  end

  it "solves part 2 example" do
    day = Aoc2022::Day03.new ::File.expand_path("../../input/2022/day03/input1-example", __dir__)
    expect(day.part2!).to eq(70)
  end

  it "solves part 2" do
    day = Aoc2022::Day03.new ::File.expand_path("../../input/2022/day03/input1", __dir__)
    expect(day.part2!).to eq(2838)
  end

end

