
module Aoc2021
  class Day02 < Solution

    def part1!
      x = y = 0
      input.each do |line|
        direction, n = line.split
        case direction
        when 'forward'
          x += n.to_i
        when 'up'
          y -= n.to_i
        when 'down'
          y += n.to_i
        end
      end
      return x * y
    end

    def part2!
      x = y = aim = 0
      input.each do |line|
        direction, n = line.split
        case direction
        when 'forward'
          x += n.to_i
          y += aim * n.to_i
        when 'up'
          aim -= n.to_i
        when 'down'
          aim += n.to_i
        end
      end
      return x * y
    end

  end
end

