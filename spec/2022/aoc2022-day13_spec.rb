
require 'aoc2022'

RSpec.describe Aoc2022::Day13 do

  it "solves part 1 example" do
    day = Aoc2022::Day13.new ::File.expand_path("../../input/2022/day13/input1-example", __dir__)
    expect(day.part1!).to eq(13)
  end

  it "solves part 1" do
    day = Aoc2022::Day13.new ::File.expand_path("../../input/2022/day13/input1", __dir__)
    expect(day.part1!).to eq(5623)
  end

  it "solves part 2 example" do
    day = Aoc2022::Day13.new ::File.expand_path("../../input/2022/day13/input1-example", __dir__)
    expect(day.part2!).to eq(140)
  end

  it "solves part 2" do
    day = Aoc2022::Day13.new ::File.expand_path("../../input/2022/day13/input1", __dir__)
    expect(day.part2!).to eq(20570)
  end

end

