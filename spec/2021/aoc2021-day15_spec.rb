require 'aoc2021'

RSpec.describe Aoc2021::Day15 do

  print_solution = false

  it "solves part 1 example" do
    day = Aoc2021::Day15.new(::File.expand_path("../../input/2021/day15/input1-example", __dir__))
    expect(day.part1!(print_solution)).to eq(40)
  end

  it "solves part 1" do
    day = Aoc2021::Day15.new(::File.expand_path("../../input/2021/day15/input1", __dir__))
    expect(day.part1!(print_solution)).to eq(656)
  end

  it "solves part 2 example" do
    day = Aoc2021::Day15.new(::File.expand_path("../../input/2021/day15/input1-example", __dir__), true)
    expect(day.part1!(print_solution)).to eq(315)
  end

  it "solves part 2" do
    day = Aoc2021::Day15.new(::File.expand_path("../../input/2021/day15/input1", __dir__), true)
    expect(day.part1!(print_solution)).to eq(2979)
  end

end
