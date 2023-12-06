
require 'aoc2023'

RSpec.describe Aoc2023::Day06 do

  it "solves part 1 example" do
    day = Aoc2023::Day06.new ::File.expand_path("../../input/2023/day06/input1-example", __dir__), :is_example => true
    expect(day.part1!).to eq(288)
  end

  it "solves part 1" do
    day = Aoc2023::Day06.new ::File.expand_path("../../input/2023/day06/input1", __dir__)
    expect(day.part1!).to eq(840336)
  end

  it "solves part 2 example" do
    day = Aoc2023::Day06.new ::File.expand_path("../../input/2023/day06/input1-example", __dir__), :is_example => true
    expect(day.part2!).to eq(71503)
  end

  it "solves part 2" do
    day = Aoc2023::Day06.new ::File.expand_path("../../input/2023/day06/input1", __dir__)
    expect(day.part2!).to eq(41382569)
  end

end

