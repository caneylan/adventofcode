require 'aoc2021'

RSpec.describe Aoc2021::Day17 do

  it "solves part 1 example" do
    day = Aoc2021::Day17.new ::File.expand_path("../input/2021/day17/input1-example", __dir__)
    expect(day.part1!).to eq(45)
  end

  it "solves part 1" do
    day = Aoc2021::Day17.new ::File.expand_path("../input/2021/day17/input1", __dir__)
    expect(day.part1!).to eq(8911)
  end

  it "solves part 2 example" do
    day = Aoc2021::Day17.new ::File.expand_path("../input/2021/day17/input1-example", __dir__)
    expect(day.part2!).to eq(112)
  end

  it "solves part 2" do
    day = Aoc2021::Day17.new ::File.expand_path("../input/2021/day17/input1", __dir__)
    expect(day.part2!).to eq(4748)
  end

end
