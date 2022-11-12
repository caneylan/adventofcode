require 'aoc2021'

RSpec.describe Aoc2021::Day22 do

  it "solves part 1 example" do
    day = Aoc2021::Day22.new ::File.expand_path("../../input/2021/day22/input1-example", __dir__)
    expect(day.part1!).to eq(39)
  end

  it "solves part 1 example 2" do
    day = Aoc2021::Day22.new ::File.expand_path("../../input/2021/day22/input1-example2", __dir__)
    expect(day.part1!).to eq(590784)
  end

  it "solves part 1" do
    day = Aoc2021::Day22.new ::File.expand_path("../../input/2021/day22/input1", __dir__)
    expect(day.part1!).to eq(588120)
  end

  it "solves part 2 example" do
    day = Aoc2021::Day22.new ::File.expand_path("../../input/2021/day22/input1-example3", __dir__)
    expect(day.part2!).to eq(2758514936282235)
  end

  it "solves part 2" do
    day = Aoc2021::Day22.new ::File.expand_path("../../input/2021/day22/input1", __dir__)
    expect(day.part2!).to eq(false)
  end

end
