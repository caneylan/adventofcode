
require 'aoc2023'

RSpec.describe Aoc2023::Day16 do

  it "solves part 1 example" do
    day = Aoc2023::Day16.new ::File.expand_path("../../input/2023/day16/input1-example", __dir__), :is_example => true
    expect(day.part1!).to eq(46)
  end

  it "solves part 1" do
    day = Aoc2023::Day16.new ::File.expand_path("../../input/2023/day16/input1", __dir__)
    expect(day.part1!).to eq(6740)
  end

  it "solves part 2 example" do
    day = Aoc2023::Day16.new ::File.expand_path("../../input/2023/day16/input1-example", __dir__), :is_example => true
    expect(day.part2!).to eq(51)
  end

  it "solves part 2" do
    day = Aoc2023::Day16.new ::File.expand_path("../../input/2023/day16/input1", __dir__)
    expect(day.part2!).to eq(7041)
  end

end

