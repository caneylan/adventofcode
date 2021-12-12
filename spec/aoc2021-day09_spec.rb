require 'aoc2021'

RSpec.describe Aoc2021::Day09 do

  it "solves part 1 example" do
    day = Aoc2021::Day09.new ::File.expand_path("../input/2021/day09/input1-example", __dir__)
    expect(day.part1!).to eq(15)
  end

  it "solves part 1" do
    day = Aoc2021::Day09.new ::File.expand_path("../input/2021/day09/input1", __dir__)
    expect(day.part1!).to eq(554)
  end

  it "solves part 2 example" do
    day = Aoc2021::Day09.new ::File.expand_path("../input/2021/day09/input1-example", __dir__)
    expect(day.part2!).to eq(1134)
  end

  it "solves part 2" do
    day = Aoc2021::Day09.new ::File.expand_path("../input/2021/day09/input1", __dir__)
    expect(day.part2!).to eq(1017792)
  end

end
