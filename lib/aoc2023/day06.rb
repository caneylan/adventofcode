
module Aoc2023
  class Day06 < Solution

    def parse_input
      @times = input[0].sub(/.*:\s+/, '').split.map(&:to_i)
      @dists = input[1].sub(/.*:\s+/, '').split.map(&:to_i)
    end

    def possible_times(distance, total_time)
      while (distance += 1)
        t_1a = (total_time + Math.sqrt(total_time**2 - 4*distance)) / 2
        t_1b = (total_time - Math.sqrt(total_time**2 - 4*distance)) / 2
        break if t_1a == t_1a.floor.to_f
      end
      (t_1b - t_1a).abs.to_i + 1
    end

    def part1!
      @times.each_with_index.map do |total_time, i|
        possible_times(@dists[i], total_time)
      end.reduce(&:*)
    end

    def part2!
      possible_times(@dists.map(&:to_s).join.to_i, @times.map(&:to_s).join.to_i)
    end

  end
end

