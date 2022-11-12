require 'aoc2021'

RSpec.describe Aoc2021::Day10 do

  it "solves part 1 example" do
    day = Aoc2021::Day10.new ::File.expand_path("../../input/2021/day10/input1-example", __dir__)
    expect(day.part1!).to eq(26397)
  end

  it "solves part 1" do
    day = Aoc2021::Day10.new ::File.expand_path("../../input/2021/day10/input1", __dir__)
    expect(day.part1!).to eq(387363)
  end

  it "solves part 2 example" do
    day = Aoc2021::Day10.new ::File.expand_path("../../input/2021/day10/input1-example", __dir__)
    expect(day.part2!).to eq(288957)
  end

  it "solves part 2" do
    day = Aoc2021::Day10.new ::File.expand_path("../../input/2021/day10/input1", __dir__)
    expect(day.part2!).to eq(4330777059)
  end

end
