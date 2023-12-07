
require 'aoc2023'

RSpec.describe Aoc2023::Day07 do

  it "solves part 1 example" do
    day = Aoc2023::Day07.new ::File.expand_path("../../input/2023/day07/input1-example", __dir__), :is_example => true
    expect(day.part1!).to eq(6440)
  end

  it "solves part 1" do
    day = Aoc2023::Day07.new ::File.expand_path("../../input/2023/day07/input1", __dir__)
    expect(day.part1!).to eq(253910319)
  end

  it "solves part 2 example" do
    day = Aoc2023::Day07.new ::File.expand_path("../../input/2023/day07/input1-example", __dir__), :is_example => true
    expect(day.part2!).to eq(5905)
  end

  it "solves part 2" do
    day = Aoc2023::Day07.new ::File.expand_path("../../input/2023/day07/input1", __dir__)
    expect(day.part2!).to eq(254083736)
  end

end

