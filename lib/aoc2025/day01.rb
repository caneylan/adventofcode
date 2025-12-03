
module Aoc2025
  class Day01 < Solution

    def parse_input
      @ops = input.map { |line| line.split('', 2) }.map { |d, c| d == 'L' ? -1 * c.to_i : c.to_i }
    end

    def part1!
      zeros = 0
      pos = 50
      @ops.each do |d|
        pos = (pos + d) % 100
        zeros += 1 if pos == 0
      end
      zeros
    end

    def part2!
      zeros = 0
      pos = 50
      @ops.each do |d|
        n = pos + d
        if n > 99 || n < -99
          zeros += n.abs / 100
        end
        if n == 0 || n < 0 && pos != 0
          zeros += 1
        end
        pos = (pos + d) % 100
      end
      zeros
    end

  end
end

