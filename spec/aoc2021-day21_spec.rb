require 'aoc2021'

RSpec.describe Aoc2021::Day21 do

  it "solves part 1 example" do
    day = Aoc2021::Day21.new ::File.expand_path("../input/2021/day21/input1-example", __dir__)
    expect(day.part1!).to eq(739785)
  end

  it "solves part 1" do
    day = Aoc2021::Day21.new ::File.expand_path("../input/2021/day21/input1", __dir__)
    expect(day.part1!).to eq(556206)
  end

  it "solves part 2 example" do
    day = Aoc2021::Day21.new ::File.expand_path("../input/2021/day21/input1-example", __dir__)
    expect(day.part2!).to eq(444356092776315)
  end

  it "solves part 2" do
    day = Aoc2021::Day21.new ::File.expand_path("../input/2021/day21/input1", __dir__)
    expect(day.part2!).to eq(630797200227453)
  end

end
