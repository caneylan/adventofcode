
require 'aoc2022'

RSpec.describe Aoc2022::Day07 do

  it "solves part 1 example" do
    day = Aoc2022::Day07.new ::File.expand_path("../../input/2022/day07/input1-example", __dir__)
    expect(day.part1!).to eq(95437)
  end

  it "solves part 1" do
    day = Aoc2022::Day07.new ::File.expand_path("../../input/2022/day07/input1", __dir__)
    expect(day.part1!).to eq(1915606)
  end

  it "solves part 2 example" do
    day = Aoc2022::Day07.new ::File.expand_path("../../input/2022/day07/input1-example", __dir__)
    expect(day.part2!).to eq(24933642)
  end

  it "solves part 2" do
    day = Aoc2022::Day07.new ::File.expand_path("../../input/2022/day07/input1", __dir__)
    expect(day.part2!).to eq(5025657)
  end

end

