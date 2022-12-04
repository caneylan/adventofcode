
module Aoc2022
  class Day04 < Solution

    def parse_input
      @ranges = input.map do |line|
                  line.split(',').map do |r|
                    s, e = r.split('-').map(&:to_i)
                    Range.new(s, e)
                  end
                end
    end

    def part1!
      @ranges.count { |a, b| a.cover?(b) || b.cover?(a) }
    end

    def part2!
      @ranges.count { |a, b| a.cover?(b.first) || b.cover?(a.first) }
    end

  end
end

