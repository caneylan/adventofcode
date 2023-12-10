
require 'aoc2023'

RSpec.describe Aoc2023::Day10 do

  it "solves part 1 example" do
    day = Aoc2023::Day10.new ::File.expand_path("../../input/2023/day10/input1-example", __dir__), :is_example => true
    expect(day.part1!).to eq(4)
  end

  it "solves part 1 example 2" do
    day = Aoc2023::Day10.new ::File.expand_path("../../input/2023/day10/input1-example2", __dir__), :is_example => true
    expect(day.part1!).to eq(8)
  end

  it "solves part 1" do
    day = Aoc2023::Day10.new ::File.expand_path("../../input/2023/day10/input1", __dir__)
    expect(day.part1!).to eq(6815)
  end

  it "solves part 2 example" do
    day = Aoc2023::Day10.new ::File.expand_path("../../input/2023/day10/input2-example", __dir__), :is_example => true
    expect(day.part2!).to eq(4)
  end

  it "solves part 2 example 2" do
    day = Aoc2023::Day10.new ::File.expand_path("../../input/2023/day10/input2-example2", __dir__), :is_example => true
    expect(day.part2!).to eq(8)
  end

  it "solves part 2 example 3" do
    day = Aoc2023::Day10.new ::File.expand_path("../../input/2023/day10/input2-example3", __dir__), :is_example => true
    expect(day.part2!).to eq(10)
  end

  it "solves part 2" do
    day = Aoc2023::Day10.new ::File.expand_path("../../input/2023/day10/input1", __dir__)
    expect(day.part2!).to eq(269)
  end

end

