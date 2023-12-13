
require 'aoc2023'

RSpec.describe Aoc2023::Day13 do

  it "solves part 1 example" do
    day = Aoc2023::Day13.new ::File.expand_path("../../input/2023/day13/input1-example", __dir__), :is_example => true
    expect(day.part1!).to eq(405)
  end

  it "solves part 1" do
    day = Aoc2023::Day13.new ::File.expand_path("../../input/2023/day13/input1", __dir__)
    expect(day.part1!).to eq(28651)
  end

  it "solves part 2 example" do
    day = Aoc2023::Day13.new ::File.expand_path("../../input/2023/day13/input1-example", __dir__), :is_example => true
    expect(day.part2!).to eq(400)
  end

  it "solves part 2" do
    day = Aoc2023::Day13.new ::File.expand_path("../../input/2023/day13/input1", __dir__)
    expect(day.part2!).to eq(25450)
  end

end

