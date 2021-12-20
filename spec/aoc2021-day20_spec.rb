require 'aoc2021'

RSpec.describe Aoc2021::Day20 do

  it "solves part 1 example" do
    day = Aoc2021::Day20.new ::File.expand_path("../input/2021/day20/input1-example", __dir__)
    expect(day.part1!).to eq(35)
  end

  it "solves part 1" do
    day = Aoc2021::Day20.new ::File.expand_path("../input/2021/day20/input1", __dir__)
    expect(day.part1!).to eq(4917)
  end

  it "solves part 2 example" do
    day = Aoc2021::Day20.new ::File.expand_path("../input/2021/day20/input1-example", __dir__)
    expect(day.part2!).to eq(3351)
  end

  it "solves part 2" do
    day = Aoc2021::Day20.new ::File.expand_path("../input/2021/day20/input1", __dir__)
    expect(day.part2!).to eq(16389)
  end

end
