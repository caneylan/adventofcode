
require 'aoc2022'

RSpec.describe Aoc2022::Day02 do

  it "solves part 1 example" do
    day = Aoc2022::Day02.new ::File.expand_path("../../input/2022/day02/input1-example", __dir__)
    expect(day.part1!).to eq(15)
  end

  it "solves part 1" do
    day = Aoc2022::Day02.new ::File.expand_path("../../input/2022/day02/input1", __dir__)
    expect(day.part1!).to eq(8392)
  end

  it "solves part 2 example" do
    day = Aoc2022::Day02.new ::File.expand_path("../../input/2022/day02/input1-example", __dir__)
    expect(day.part2!).to eq(12)
  end

  it "solves part 2" do
    day = Aoc2022::Day02.new ::File.expand_path("../../input/2022/day02/input1", __dir__)
    expect(day.part2!).to eq(10116)
  end

end

