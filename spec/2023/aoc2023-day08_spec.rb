
require 'aoc2023'

RSpec.describe Aoc2023::Day08 do

  it "solves part 1 example" do
    day = Aoc2023::Day08.new ::File.expand_path("../../input/2023/day08/input1-example", __dir__), :is_example => true
    expect(day.part1!).to eq(2)
  end

  it "solves part 1 example 2" do
    day = Aoc2023::Day08.new ::File.expand_path("../../input/2023/day08/input2-example", __dir__), :is_example => true
    expect(day.part1!).to eq(6)
  end

  it "solves part 1" do
    day = Aoc2023::Day08.new ::File.expand_path("../../input/2023/day08/input1", __dir__)
    expect(day.part1!).to eq(19951)
  end

  it "solves part 2 example" do
    day = Aoc2023::Day08.new ::File.expand_path("../../input/2023/day08/input3-example", __dir__), :is_example => true
    expect(day.part2!).to eq(6)
  end

  it "solves part 2" do
    day = Aoc2023::Day08.new ::File.expand_path("../../input/2023/day08/input1", __dir__)
    expect(day.part2!).to eq(16342438708751)
  end

end

