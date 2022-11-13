require 'aoc2020'

RSpec.describe Aoc2020::Day20 do

  it "solves part 1 example" do
    day = Aoc2020::Day20.new ::File.expand_path("../../input/2020/day20/input1-example", __dir__)
    expect(day.part1!).to eq(20899048083289)
  end

  it "solves part 1" do
    day = Aoc2020::Day20.new ::File.expand_path("../../input/2020/day20/input1", __dir__)
    expect(day.part1!).to eq(51214443014783)
  end

  it "solves part 2 example" do
    day = Aoc2020::Day20.new ::File.expand_path("../../input/2020/day20/input1-example", __dir__)
    expect(day.part2!).to eq(273)
  end

  it "solves part 2" do
    day = Aoc2020::Day20.new ::File.expand_path("../../input/2020/day20/input1", __dir__)
    expect(day.part2!).to eq(2065)
  end

end
