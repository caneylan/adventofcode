
require 'aoc2025'

RSpec.describe Aoc2025::Day06 do

  it "solves part 1 example" do
    day = Aoc2025::Day06.new ::File.expand_path("../../input/2025/day06/input1-example", __dir__), :is_example => true
    expect(day.part1!).to eq(4277556)
  end

  it "solves part 1" do
    day = Aoc2025::Day06.new ::File.expand_path("../../input/2025/day06/input1", __dir__)
    expect(day.part1!).to eq(5316572080628)
  end

  it "solves part 2 example" do
    day = Aoc2025::Day06.new ::File.expand_path("../../input/2025/day06/input1-example", __dir__), :is_example => true, :no_strip_input => true
    expect(day.part2!).to eq(3263827)
  end

  it "solves part 2" do
    day = Aoc2025::Day06.new ::File.expand_path("../../input/2025/day06/input1", __dir__), :no_strip_input => true
    expect(day.part2!).to eq(11299263623062)
  end

end

