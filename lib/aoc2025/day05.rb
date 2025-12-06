
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

    def smash(input_ranges)
      new_ranges = []
      while input_ranges.any?
        left = []
        merge_me = input_ranges.shift
        input_ranges.each do |r|
          if r.min <= merge_me.max && r.max >= merge_me.min
            merge_me = [r.begin, merge_me.begin].min .. [r.end, merge_me.end].max
          else
            left << r
          end
        end
        new_ranges << merge_me
        input_ranges = left
      end
      new_ranges
    end

    def part2!
      final_ranges = @ranges
      loop do
        new_ranges = smash(final_ranges.clone)
        break if new_ranges.size == final_ranges.size
        final_ranges = new_ranges
      end
      final_ranges.sum { |r| r.size }
    end

  end
end

