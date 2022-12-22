
require 'aoc2022'

RSpec.describe Aoc2022::Day22 do

  it "solves part 1 example" do
    day = Aoc2022::Day22.new ::File.expand_path("../../input/2022/day22/input1-example", __dir__), :is_example => true, :no_strip_input => true
    expect(day.part1!).to eq(6032)
  end

  it "solves part 1" do
    day = Aoc2022::Day22.new ::File.expand_path("../../input/2022/day22/input1", __dir__), :no_strip_input => true
    expect(day.part1!).to eq(122082)
  end

  it "solves part 2 example" do
    day = Aoc2022::Day22.new ::File.expand_path("../../input/2022/day22/input1-example", __dir__), :is_example => true, :no_strip_input => true
    expect { day.part2! }.to raise_error(NotImplementedError)
  end

  it "solves part 2" do
    day = Aoc2022::Day22.new ::File.expand_path("../../input/2022/day22/input1", __dir__), :no_strip_input => true
    expect(day.part2!).to eq(134076)
  end

end

