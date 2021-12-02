
module Aoc2021
  class Day2 < Solution

    def solve
      {
        :part1_example => part1('input1-example'),
        :part1 => part1('input1'),
        :part2_example => part2('input1-example'),
        :part2 => part2('input1'),
      }
    end
    
    def part1(filename)
      x = y = 0
      File.foreach(input_path filename) do |line|
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

    def part2(filename)
      x = y = aim = 0
      File.foreach(input_path filename) do |line|
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

