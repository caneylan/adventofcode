
require 'aoc2024'

RSpec.describe Aoc2024::Day04 do

  it "solves part 1 example" do
    day = Aoc2024::Day04.new ::File.expand_path("../../input/2024/day04/input1-example", __dir__), :is_example => true, :char_array => true
    expect(day.part1!).to eq(18)
  end

  it "solves part 1" do
    day = Aoc2024::Day04.new ::File.expand_path("../../input/2024/day04/input1", __dir__), :char_array => true
    expect(day.part1!).to eq(2593)
  end

  it "solves part 2 example" do
    day = Aoc2024::Day04.new ::File.expand_path("../../input/2024/day04/input1-example", __dir__), :is_example => true, :char_array => true
    expect(day.part2!).to eq(9)
  end

  it "solves part 2" do
    day = Aoc2024::Day04.new ::File.expand_path("../../input/2024/day04/input1", __dir__), :char_array => true
    expect(day.part2!).to eq(1950)
  end

end

