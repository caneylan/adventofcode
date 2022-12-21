
require 'aoc2022'

RSpec.describe Aoc2022::Day21 do

  it "solves part 1 example" do
    day = Aoc2022::Day21.new ::File.expand_path("../../input/2022/day21/input1-example", __dir__), :is_example => true
    expect(day.part1!).to eq(152)
  end

  it "solves part 1" do
    day = Aoc2022::Day21.new ::File.expand_path("../../input/2022/day21/input1", __dir__)
    expect(day.part1!).to eq(142707821472432)
  end

  it "solves part 2 example" do
    day = Aoc2022::Day21.new ::File.expand_path("../../input/2022/day21/input1-example", __dir__), :is_example => true
    expect(day.part2!).to eq(301)
  end

  it "solves part 2" do
    day = Aoc2022::Day21.new ::File.expand_path("../../input/2022/day21/input1", __dir__)
    expect(day.part2!).to eq(3587647562851)
  end

end

