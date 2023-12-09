
require 'aoc2023'

RSpec.describe Aoc2023::Day09 do

  it "solves part 1 example" do
    day = Aoc2023::Day09.new ::File.expand_path("../../input/2023/day09/input1-example", __dir__), :is_example => true
    expect(day.part1!).to eq(114)
  end

  it "solves part 1" do
    day = Aoc2023::Day09.new ::File.expand_path("../../input/2023/day09/input1", __dir__)
    expect(day.part1!).to eq(1987402313)
  end

  it "solves part 2 example" do
    day = Aoc2023::Day09.new ::File.expand_path("../../input/2023/day09/input1-example", __dir__), :is_example => true
    expect(day.part2!).to eq(2)
  end

  it "solves part 2" do
    day = Aoc2023::Day09.new ::File.expand_path("../../input/2023/day09/input1", __dir__)
    expect(day.part2!).to eq(900)
  end

end

