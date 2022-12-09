
require 'aoc2022'

RSpec.describe Aoc2022::Day09 do

  it "solves part 1 example" do
    day = Aoc2022::Day09.new ::File.expand_path("../../input/2022/day09/input1-example", __dir__)
    expect(day.part1!).to eq(13)
  end

  it "solves part 1" do
    day = Aoc2022::Day09.new ::File.expand_path("../../input/2022/day09/input1", __dir__)
    expect(day.part1!).to eq(6026)
  end

  it "solves part 2 example" do
    day = Aoc2022::Day09.new ::File.expand_path("../../input/2022/day09/input1-example", __dir__)
    expect(day.part2!).to eq(1)
  end

  it "solves part 2 example 2" do
    day = Aoc2022::Day09.new ::File.expand_path("../../input/2022/day09/input1-example2", __dir__)
    expect(day.part2!).to eq(36)
  end

  it "solves part 2" do
    day = Aoc2022::Day09.new ::File.expand_path("../../input/2022/day09/input1", __dir__)
    expect(day.part2!).to eq(2273)
  end

end

