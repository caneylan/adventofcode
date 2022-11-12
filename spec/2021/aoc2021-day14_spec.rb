require 'aoc2021'

RSpec.describe Aoc2021::Day14 do

  it "solves example with 2 steps" do
    day = Aoc2021::Day14.new ::File.expand_path("../../input/2021/day14/input1-example", __dir__)
    expect(day.solve!(2)).to eq(5)
  end

  it "solves example with 10 steps" do
    day = Aoc2021::Day14.new ::File.expand_path("../../input/2021/day14/input1-example", __dir__)
    expect(day.solve!(10)).to eq(1588)
  end

  it "solves input with 10 steps" do
    day = Aoc2021::Day14.new ::File.expand_path("../../input/2021/day14/input1", __dir__)
    expect(day.solve!(10)).to eq(2447)
  end

  it "solves example with 40 steps" do
    day = Aoc2021::Day14.new ::File.expand_path("../../input/2021/day14/input1-example", __dir__)
    expect(day.solve!(40)).to eq(2188189693529)
  end

  it "solves input with 40 steps" do
    day = Aoc2021::Day14.new ::File.expand_path("../../input/2021/day14/input1", __dir__)
    expect(day.solve!(40)).to eq(3018019237563)
  end

end
