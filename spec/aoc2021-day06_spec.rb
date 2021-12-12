
require 'aoc2021'

RSpec.describe Aoc2021::Day06 do

  it "solves part 1 example 1" do
    day = Aoc2021::Day06.new ::File.expand_path("../input/2021/day06/input1-example", __dir__)
    expect(day.fish_simulation!(18)).to eq(26)
  end

  it "solves part 1 example 2" do
    day = Aoc2021::Day06.new ::File.expand_path("../input/2021/day06/input1-example", __dir__)
    expect(day.fish_simulation!(80)).to eq(5934)
  end

  it "solves part 1" do
    day = Aoc2021::Day06.new ::File.expand_path("../input/2021/day06/input1", __dir__)
    expect(day.fish_simulation!(80)).to eq(388419)
  end

  it "solves part 2 example" do
    day = Aoc2021::Day06.new ::File.expand_path("../input/2021/day06/input1-example", __dir__)
    expect(day.fish_simulation!(256)).to eq(26984457539)
  end

  it "solves part 2" do
    day = Aoc2021::Day06.new ::File.expand_path("../input/2021/day06/input1", __dir__)
    expect(day.fish_simulation!(256)).to eq(1740449478328)
  end

end

