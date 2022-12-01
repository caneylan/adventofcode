
require 'aoc2022'

RSpec.describe Aoc2022::Day01 do

  it "solves part 1 example" do
    day = Aoc2022::Day01.new ::File.expand_path("../../input/2022/day01/input1-example", __dir__)
    expect(day.part1!).to eq(24000)
  end

  it "solves part 1" do
    day = Aoc2022::Day01.new ::File.expand_path("../../input/2022/day01/input1", __dir__)
    expect(day.part1!).to eq(65912)
  end

  it "solves part 2 example" do
    day = Aoc2022::Day01.new ::File.expand_path("../../input/2022/day01/input1-example", __dir__)
    expect(day.part2!).to eq(45000)
  end

  it "solves part 2" do
    day = Aoc2022::Day01.new ::File.expand_path("../../input/2022/day01/input1", __dir__)
    expect(day.part2!).to eq(195625)
  end

end

