
require 'aoc2022'

RSpec.describe Aoc2022::Day20 do

  it "solves part 1 example" do
    day = Aoc2022::Day20.new ::File.expand_path("../../input/2022/day20/input1-example", __dir__), :is_example => true
    expect(day.part1!).to eq(3)
  end

  it "solves part 1" do
    day = Aoc2022::Day20.new ::File.expand_path("../../input/2022/day20/input1", __dir__)
    expect(day.part1!).to eq(6712)
  end
  
  it "solves part 2 example" do
    day = Aoc2022::Day20.new ::File.expand_path("../../input/2022/day20/input1-example", __dir__), :is_example => true
    expect(day.part2!).to eq(1623178306)
  end

  it "solves part 2" do
    day = Aoc2022::Day20.new ::File.expand_path("../../input/2022/day20/input1", __dir__)
    expect(day.part2!).to eq(1595584274798)
  end

end

