
module Aoc2022
  class Day15 < Solution

    def parse_input
      @beacons = []
      @dists = {}
      input.each do |line|
        line =~ /Sensor at x=(-?\d+), y=(-?\d+): closest beacon is at x=(-?\d+), y=(-?\d+)/
        sensor = [$1.to_i, $2.to_i]
        beacon = [$3.to_i, $4.to_i]
        dx = (sensor[0] - beacon[0]).abs
        dy = (sensor[1] - beacon[1]).abs
        @dists[sensor] = dx + dy
        @beacons << beacon unless @beacons.include?(beacon)
      end
    end

    def merge_ranges(ranges)
      ranges = ranges.sort { |a, b| a.begin != b.begin ? a.begin <=> b.begin : a.end <=> b.end }
      i = 0
      while i < ranges.length - 1
        if ranges[i].end >= ranges[i+1].begin - 1
          ranges[i] = (ranges[i].begin..[ranges[i].end, ranges[i+1].end].max)
          ranges.delete_at(i+1)
        else
          i += 1
        end
      end
      ranges
    end

    def empty_ranges(y)
      ranges = []
      @dists.each do |sensor, dist|
        next unless  y <= sensor[1] + dist && y >= sensor[1] - dist
        dx = dist - (y - sensor[1]).abs
        ranges << ((sensor[0] - dx)..(sensor[0] + dx))
      end
      merge_ranges(ranges)
    end

    def part1!(y)
      empty_ranges(y).map(&:size).sum - @beacons.select { |beacon| beacon[1] == y }.count
    end

    def part2!(limit)
      limit.downto(0) do |y|
        empty = empty_ranges(y)
        range = empty.find { |r| r.include?(0) }
        return (range.end + 1) * 4000000 + y  unless range.include?(limit)
      end
    end

  end
end

