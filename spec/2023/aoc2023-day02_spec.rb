
require 'aoc2023'

RSpec.describe Aoc2023::Day02 do

  it "solves part 1 example" do
    day = Aoc2023::Day02.new ::File.expand_path("../../input/2023/day02/input1-example", __dir__), :is_example => true
    expect(day.part1!).to eq(8)
  end

  it "solves part 1" do
    day = Aoc2023::Day02.new ::File.expand_path("../../input/2023/day02/input1", __dir__)
    expect(day.part1!).to eq(2541)
  end

  it "solves part 2 example" do
    day = Aoc2023::Day02.new ::File.expand_path("../../input/2023/day02/input1-example", __dir__), :is_example => true
    expect(day.part2!).to eq(2286)
  end

  it "solves part 2" do
    day = Aoc2023::Day02.new ::File.expand_path("../../input/2023/day02/input1", __dir__)
    expect(day.part2!).to eq(66016)
  end

end

