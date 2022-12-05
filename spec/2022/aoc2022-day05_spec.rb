
require 'aoc2022'

RSpec.describe Aoc2022::Day05 do

  it "solves part 1 example" do
    day = Aoc2022::Day05.new ::File.expand_path("../../input/2022/day05/input1-example", __dir__), :no_strip_input => true
    expect(day.part1!).to eq('CMZ')
  end

  it "solves part 1" do
    day = Aoc2022::Day05.new ::File.expand_path("../../input/2022/day05/input1", __dir__), :no_strip_input => true
    expect(day.part1!).to eq('FRDSQRRCD')
  end

  it "solves part 2 example" do
    day = Aoc2022::Day05.new ::File.expand_path("../../input/2022/day05/input1-example", __dir__), :no_strip_input => true
    expect(day.part2!).to eq('MCD')
  end

  it "solves part 2" do
    day = Aoc2022::Day05.new ::File.expand_path("../../input/2022/day05/input1", __dir__), :no_strip_input => true
    expect(day.part2!).to eq('HRFTQVWNN')
  end

end

