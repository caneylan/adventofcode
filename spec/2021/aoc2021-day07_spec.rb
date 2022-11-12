require 'aoc2021'

RSpec.describe Aoc2021::Day07 do

  it "solves part 1 example" do
    day = Aoc2021::Day07.new ::File.expand_path("../../input/2021/day07/input1-example", __dir__)
    expect(day.part1!).to eq(37)
  end

  it "solves part 1" do
    day = Aoc2021::Day07.new ::File.expand_path("../../input/2021/day07/input1", __dir__)
    expect(day.part1!).to eq(344138)
  end

  it "solves part 2 example" do
    day = Aoc2021::Day07.new ::File.expand_path("../../input/2021/day07/input1-example", __dir__)
    expect(day.part2!).to eq(168)
  end

  it "solves part 2" do
    day = Aoc2021::Day07.new ::File.expand_path("../../input/2021/day07/input1", __dir__)
    expect(day.part2!).to eq(94862124)
  end

end
