
require 'aoc2023'

RSpec.describe Aoc2023::Day04 do

  it "solves part 1 example" do
    day = Aoc2023::Day04.new ::File.expand_path("../../input/2023/day04/input1-example", __dir__), :is_example => true
    expect(day.part1!).to eq(13)
  end

  it "solves part 1" do
    day = Aoc2023::Day04.new ::File.expand_path("../../input/2023/day04/input1", __dir__)
    expect(day.part1!).to eq(20855)
  end

  it "solves part 2 example" do
    day = Aoc2023::Day04.new ::File.expand_path("../../input/2023/day04/input1-example", __dir__), :is_example => true
    expect(day.part2!).to eq(30)
  end

  it "solves part 2" do
    day = Aoc2023::Day04.new ::File.expand_path("../../input/2023/day04/input1", __dir__)
    expect(day.part2!).to eq(5489600)
  end

end

