
require 'aoc2021'

RSpec.describe Aoc2021::Day05 do

  it "solves part 1 example" do
    day = Aoc2021::Day05.new ::File.expand_path("../../input/2021/day05/input1-example", __dir__)
    expect(day.part1!).to eq(5)
  end

  it "solves part 1" do
    day = Aoc2021::Day05.new ::File.expand_path("../../input/2021/day05/input1", __dir__)
    expect(day.part1!).to eq(4826)
  end

  it "solves part 2 example" do
    day = Aoc2021::Day05.new ::File.expand_path("../../input/2021/day05/input1-example", __dir__)
    expect(day.part2!).to eq(12)
  end

  it "solves part 2" do
    day = Aoc2021::Day05.new ::File.expand_path("../../input/2021/day05/input1", __dir__)
    expect(day.part2!).to eq(16793)
  end

end

