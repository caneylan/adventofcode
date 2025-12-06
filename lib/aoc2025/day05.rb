
module Aoc2025
  class Day05 < Solution

    def parse_input
      @ranges = []
      @ids = []
      input.each do |line|
        if line =~ /(\d+)\-(\d+)/
          @ranges << ($1.to_i..$2.to_i)
        elsif line =~ /(\d+)/
          @ids << $1.to_i
        end
      end
    end

    def part1!
      @ids.count do |i|
        @ranges.find { |r| r.include?(i) }
      end
    end

    def part2!
      @ranges.sort! { |a, b| a.min <=> b.min }
      curr = @ranges.shift
      sum = 0
      @ranges.each do |r|
        if r.min <= curr.max
          curr = curr.min .. [curr.max, r.max].max
        else
          sum += curr.size
          curr = r
        end
      end
      sum + curr.size
    end

  end
end

