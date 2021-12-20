require 'aoc2021'

RSpec.describe Aoc2021::Day19 do

  it "parses 2d example" do
    day = Aoc2021::Day19.new ::File.expand_path("../input/2021/day19/input1-example2d", __dir__)
    expect(day.scanners.length).to eq(2)
    expect(day.scanners.map { |s| s.points.length }.uniq).to eq([4])

    expect(day.scanners[0].intersect(day.scanners[1], 3).first.points.length).to eq(3)
    expect(day.scanners[0].intersect(day.scanners[1], 4)).to eq(nil)
  end

  it "parses 2d example with rotated scanner 1" do
    day = Aoc2021::Day19.new ::File.expand_path("../input/2021/day19/input1-example2d_rotated", __dir__)
    expect(day.scanners.length).to eq(2)
    expect(day.scanners.map { |s| s.points.length }.uniq).to eq([4])

    expect(day.scanners[0].intersect(day.scanners[1], 3).first.points.length).to eq(3)
    expect(day.scanners[0].intersect(day.scanners[1], 4)).to eq(nil)
  end

  it "parses example 1" do
    day = Aoc2021::Day19.new ::File.expand_path("../input/2021/day19/input1-example", __dir__)
    expect(day.scanners.length).to eq(5)
    expect(day.scanners.map { |s| s.points.length }.uniq.sort).to eq([25, 26])
    expect(day.scanners[0].intersect(day.scanners[1], 12).first.points.length).to eq(12)
    expect(day.scanners[1].intersect(day.scanners[4], 12).first.points.length).to eq(12)
    expect(day.scanners[1].intersect(day.scanners[3], 12).first.points.length).to eq(12)
  end

  it "solves part 1 example" do
    day = Aoc2021::Day19.new ::File.expand_path("../input/2021/day19/input1-example", __dir__)
    expect(day.part1!).to eq(79)
  end

  it "solves part 1" do
    day = Aoc2021::Day19.new ::File.expand_path("../input/2021/day19/input1", __dir__)
    expect(day.part1!).to eq(378)
  end

  it "solves part 2 example" do
    day = Aoc2021::Day19.new ::File.expand_path("../input/2021/day19/input1-example", __dir__)
    expect(day.part2!).to eq(3621)
  end

  it "solves part 2" do
    day = Aoc2021::Day19.new ::File.expand_path("../input/2021/day19/input1", __dir__)
    expect(day.part2!).to eq(13148)
  end

end
