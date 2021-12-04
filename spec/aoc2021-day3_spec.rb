
require 'aoc2021'

RSpec.describe Aoc2021::Day3 do

  it "solves part 1 example" do
    day = Aoc2021::Day3.new ::File.expand_path("../input/2021/day3/input1-example", __dir__)
    expect(day.part1!).to eq(198)
  end

  it "solves part 1" do
    day = Aoc2021::Day3.new ::File.expand_path("../input/2021/day3/input1", __dir__)
    expect(day.part1!).to eq(2724524)
  end

  it "solves part 2 example" do
    day = Aoc2021::Day3.new ::File.expand_path("../input/2021/day3/input1-example", __dir__)
    expect(day.part2!).to eq(230)
  end

  it "solves part 2" do
    day = Aoc2021::Day3.new ::File.expand_path("../input/2021/day3/input1", __dir__)
    expect(day.part2!).to eq(2775870)
  end

end

