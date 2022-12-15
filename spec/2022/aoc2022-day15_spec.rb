
require 'aoc2022'

RSpec.describe Aoc2022::Day15 do

  it "solves part 1 example" do
    day = Aoc2022::Day15.new ::File.expand_path("../../input/2022/day15/input1-example", __dir__), :is_example => true
    expect(day.part1!(10)).to eq(26)
  end

  it "solves part 1" do
    day = Aoc2022::Day15.new ::File.expand_path("../../input/2022/day15/input1", __dir__)
    expect(day.part1!(2000000)).to eq(5181556)
  end

  it "solves part 2 example" do
    day = Aoc2022::Day15.new ::File.expand_path("../../input/2022/day15/input1-example", __dir__), :is_example => true
    expect(day.part2!(20)).to eq(56000011)
  end

  it "solves part 2" do
    day = Aoc2022::Day15.new ::File.expand_path("../../input/2022/day15/input1", __dir__)
    expect(day.part2!(4000000)).to eq(12817603219131)
  end

end

