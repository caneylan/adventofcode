
require 'aoc2023'

RSpec.describe Aoc2023::Day03 do

  it "solves part 1 example" do
    day = Aoc2023::Day03.new ::File.expand_path("../../input/2023/day03/input1-example", __dir__), :is_example => true
    expect(day.part1!).to eq(4361)
  end

  it "solves part 1" do
    day = Aoc2023::Day03.new ::File.expand_path("../../input/2023/day03/input1", __dir__)
    expect(day.part1!).to eq(532428)
  end

  it "solves part 2 example" do
    day = Aoc2023::Day03.new ::File.expand_path("../../input/2023/day03/input1-example", __dir__), :is_example => true
    expect(day.part2!).to eq(467835)
  end

  it "solves part 2" do
    day = Aoc2023::Day03.new ::File.expand_path("../../input/2023/day03/input1", __dir__)
    expect(day.part2!).to eq(84051670)
  end

end

