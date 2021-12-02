
require 'aoc2021'

RSpec.describe Aoc2021::Day1 do

  it "solves the example" do
    examples = Aoc2021::Day1.new ::File.expand_path('../input/2021/day1/input1-example', __dir__)
    solutions = examples.solve

    expect(solutions).to be_a(Hash)
    expect(solutions).to include(
      :part1 => 7,
      :part2 => 5,
    )
  end

  it "solves the real input" do
    for_reals = Aoc2021::Day1.new ::File.expand_path('../input/2021/day1/input1', __dir__)
    solutions = for_reals.solve

    expect(solutions).to be_a(Hash)
    expect(solutions).to include(
      :part1 => 1292,
      :part2 => 1262,
    )
    puts :day1_solution => solutions.inspect
  end

end

