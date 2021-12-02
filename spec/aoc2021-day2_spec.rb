
require 'aoc2021'

RSpec.describe Aoc2021::Day2 do
  it "solves" do
    solution = Aoc2021::Day2.new.solve

    expect(solution).to be_a(Hash)

    puts solution.inspect
    expect(solution).to include(
      :part1_example => 150,
      :part1 => 1924923,
      :part2_example => 900,
      :part2 => 1982495697
    )
  end
end

