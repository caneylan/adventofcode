
require 'aoc2021'

RSpec.describe Aoc2021::Day2 do

  it "solves part 1 example" do
    day = Aoc2021::Day2.new ::File.expand_path("../input/2021/day2/input1-example", __dir__)
    expect(day.part1!).to eq(150)
  end

  it "solves part 1" do
    day = Aoc2021::Day2.new ::File.expand_path("../input/2021/day2/input1", __dir__)
    expect(day.part1!).to eq(1924923)
  end

  it "solves part 2 example" do
    day = Aoc2021::Day2.new ::File.expand_path("../input/2021/day2/input1-example", __dir__)
    expect(day.part2!).to eq(900)
  end

  it "solves part 2" do
    day = Aoc2021::Day2.new ::File.expand_path("../input/2021/day2/input1", __dir__)
    expect(day.part2!).to eq(1982495697)
  end

end

