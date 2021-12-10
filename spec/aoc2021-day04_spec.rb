
require 'aoc2021'

RSpec.describe Aoc2021::Day4 do

  it "solves part 1 example" do
    day = Aoc2021::Day4.new ::File.expand_path("../input/2021/day4/input1-example", __dir__)
    expect(day.part1!).to eq(4512)
  end

  it "solves part 1" do
    day = Aoc2021::Day4.new ::File.expand_path("../input/2021/day4/input1", __dir__)
    expect(day.part1!).to eq(45031)
  end

  it "solves part 2 example" do
    day = Aoc2021::Day4.new ::File.expand_path("../input/2021/day4/input1-example", __dir__)
    expect(day.part2!).to eq(1924)
  end

  it "solves part 2" do
    day = Aoc2021::Day4.new ::File.expand_path("../input/2021/day4/input1", __dir__)
    expect(day.part2!).to eq(2568)
  end

end

