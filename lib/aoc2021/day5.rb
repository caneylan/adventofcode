
module Aoc2021
  class Day5 < Solution

    def map_vents(skip_diagonals = false)
      vent_lines = Hash.new { |h, k| h[k] = Hash.new(0) }
      input.each do |line|
        a, _, b = line.split
        a_x, a_y = a.split(',').map(&:to_i)
        b_x, b_y = b.split(',').map(&:to_i)

        x_step = a_x < b_x ? 1 : a_x == b_x ? 0 : -1
        y_step = a_y < b_y ? 1 : a_y == b_y ? 0 : -1

        next unless a_x == b_x || a_y == b_y if skip_diagonals

        loop do
          vent_lines[a_x][a_y] += 1
          break if a_x == b_x && a_y == b_y
          a_x += x_step
          a_y += y_step
        end
      end

      return vent_lines.map { |x, col| col.count { |y, v| v > 1 } }.sum
    end

    def part1!
      return map_vents(true)
    end

    def part2!
      return map_vents
    end

  end
end


