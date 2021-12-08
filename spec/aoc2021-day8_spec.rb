require 'aoc2021'

RSpec.describe Aoc2021::Day8 do

  it "solves part 1 example" do
    day = Aoc2021::Day8.new ::File.expand_path("../input/2021/day8/input1-example", __dir__)
    expect(day.part1!).to eq(26)
  end

  it "solves part 1" do
    day = Aoc2021::Day8.new ::File.expand_path("../input/2021/day8/input1", __dir__)
    expect(day.part1!).to eq(369)
  end

  it "solves part 2 example short" do
    day = Aoc2021::Day8.new ::File.expand_path("../input/2021/day8/input1-example_short", __dir__)
    expect(day.part2!).to eq(5353)
  end

  it "solves part 2 example" do
    day = Aoc2021::Day8.new ::File.expand_path("../input/2021/day8/input1-example", __dir__)
    expect(day.part2!).to eq(61229)
  end

  it "solves part 2" do
    day = Aoc2021::Day8.new ::File.expand_path("../input/2021/day8/input1", __dir__)
    expect(day.part2!).to eq(1031553)
  end

end
