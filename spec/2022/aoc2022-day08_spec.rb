
require 'aoc2022'

RSpec.describe Aoc2022::Day08 do

  it "solves part 1 example" do
    day = Aoc2022::Day08.new ::File.expand_path("../../input/2022/day08/input1-example", __dir__)
    expect(day.part1!).to eq(21)
  end

  it "solves part 1" do
    day = Aoc2022::Day08.new ::File.expand_path("../../input/2022/day08/input1", __dir__)
    expect(day.part1!).to eq(1705)
  end

  it "solves part 2 example" do
    day = Aoc2022::Day08.new ::File.expand_path("../../input/2022/day08/input1-example", __dir__)
    expect(day.part2!).to eq(8)
  end

  it "solves part 2" do
    day = Aoc2022::Day08.new ::File.expand_path("../../input/2022/day08/input1", __dir__)
    expect(day.part2!).to eq(371200)
  end

end

