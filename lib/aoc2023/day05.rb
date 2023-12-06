
module Aoc2023
  class Day05 < Solution

    def parse_input
      @seeds = input.shift.sub(/seeds:\s+/, '').split.map(&:to_i)
      @map = Hash.new { |h, k| h[k] = Array.new }
      key = nil
      input.each do |line|
        next if line.empty?
        if line.end_with?(':')
          key = line.sub(/\s.*/, '')
        else
          @map[key] << line.split.map(&:to_i)
        end
      end
    end

    def part1!
      min = Float::INFINITY
      @seeds.each do |seed|
        @map.each do |key, ranges|
          ranges.each do |(dest_start, source_start, size)|
            if seed >= source_start && seed < source_start + size
              seed = dest_start + (seed - source_start)
              break
            end
          end
        end
        min = seed if min > seed
      end
      return min
    end

    def part2!
      seed_ranges = @seeds.each_slice(2).map { |(start, len)| (start..(start + len - 1)) }
      min = Float::INFINITY
      seed_ranges.each do |seed_range|
        seed_range.each do |seed|
          @map.each do |key, ranges|
            ranges.each do |(dest_start, source_start, size)|
              if seed >= source_start && seed < source_start + size
                seed = dest_start + (seed - source_start)
                break
              end
            end
          end
          min = seed if min > seed
        end
      end
      return min
    end

  end
end

