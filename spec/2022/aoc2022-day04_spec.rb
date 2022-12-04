
require 'aoc2022'

RSpec.describe Aoc2022::Day04 do

  it "solves part 1 example" do
    day = Aoc2022::Day04.new ::File.expand_path("../../input/2022/day04/input1-example", __dir__)
    expect(day.part1!).to eq(2)
  end

  it "solves part 1" do
    day = Aoc2022::Day04.new ::File.expand_path("../../input/2022/day04/input1", __dir__)
    expect(day.part1!).to eq(530)
  end

  it "solves part 2 example" do
    day = Aoc2022::Day04.new ::File.expand_path("../../input/2022/day04/input1-example", __dir__)
    expect(day.part2!).to eq(4)
  end

  it "solves part 2" do
    day = Aoc2022::Day04.new ::File.expand_path("../../input/2022/day04/input1", __dir__)
    expect(day.part2!).to eq(903)
  end

end

