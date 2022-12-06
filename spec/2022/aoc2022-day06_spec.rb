
require 'aoc2022'

RSpec.describe Aoc2022::Day06 do

  { 1 => 7, 2 => 5, 3 => 6, 4 => 10, 5 => 11 }.each do |i, ev|
    it "solves part 1 example #{i}" do
      day = Aoc2022::Day06.new ::File.expand_path("../../input/2022/day06/input1-example#{i}", __dir__)
      expect(day.part1!).to eq(ev)
    end
  end

  it "solves part 1" do
    day = Aoc2022::Day06.new ::File.expand_path("../../input/2022/day06/input1", __dir__)
    expect(day.part1!).to eq(1760)
  end

  { 1 => 19, 2 => 23, 3 => 23, 4 => 29, 5 => 26 }.each do |i, ev|
    it "solves part 2 example #{i}" do
      day = Aoc2022::Day06.new ::File.expand_path("../../input/2022/day06/input1-example#{i}", __dir__)
      expect(day.part2!).to eq(ev)
    end
  end

  it "solves part 2" do
    day = Aoc2022::Day06.new ::File.expand_path("../../input/2022/day06/input1", __dir__)
    expect(day.part2!).to eq(2974)
  end

end

