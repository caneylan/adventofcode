
require 'aoc2021'

RSpec.describe Aoc2021::Day1 do
  it "solves" do
    solution = Aoc2021::Day1.new.solve

    expect(solution).to be_a(Hash)

    puts solution.inspect
    expect(solution).to include(
      :part1_example => 7,
      :part1 => 1292,
      :part2_example => 5,
      :part2 => 1262
    )
  end
end

