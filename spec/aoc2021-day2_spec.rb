
require 'aoc2021'

RSpec.describe Aoc2021::Day2 do

  it "solves the example" do
    examples = Aoc2021::Day2.new ::File.expand_path('../input/2021/day2/input1-example', __dir__)
    solutions = examples.solve

    expect(solutions).to be_a(Hash)
    expect(solutions).to include(
      :part1 => 150,
      :part2 => 900,
    )
  end

  it "solves the real input" do
    for_reals = Aoc2021::Day2.new ::File.expand_path('../input/2021/day2/input1', __dir__)
    solutions = for_reals.solve

    expect(solutions).to be_a(Hash)
    expect(solutions).to include(
      :part1 => 1924923,
      :part2 => 1982495697,
    )
    puts :day2_solution => solutions.inspect
  end

end

