
require 'aoc2021'

RSpec.describe Aoc2021::Day3 do

  it "solves the example" do
    examples = Aoc2021::Day3.new ::File.expand_path('../input/2021/day3/input1-example', __dir__)
    solutions = examples.solve

    expect(solutions).to be_a(Hash)
    expect(solutions).to include(
      :part1 => 198,
      :part2 => 230,
    )
  end

  it "solves the real input" do
    for_reals = Aoc2021::Day3.new ::File.expand_path('../input/2021/day3/input1', __dir__)
    solutions = for_reals.solve

    expect(solutions).to be_a(Hash)
    expect(solutions).to include(
      :part1 => 2724524,
      :part2 => 2775870,
    )
    #puts :solution => solutions.inspect
  end

end

