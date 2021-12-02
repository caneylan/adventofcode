
module Aoc2021
  class Day1 < Solution

    def solve
      {
        :part1_example => part1('input1-example'),
        :part1 => part1('input1'),
        :part2_example => part2('input1-example'),
        :part2 => part2('input1'),
      }
    end

    def part1(filename)
      previous = nil
      n_increased = 0
      File.foreach(input_path filename) do |line|
        current = line.to_i
        if previous && current > previous
          n_increased += 1
        end
        previous = current
      end
      return n_increased
    end

    def part2(filename)
      buffer = [nil, nil, nil]
      n_increased = 0
      File.foreach(input_path filename) do |line|
        buffer << line.to_i
        if head = buffer.shift
          if head + buffer[0] + buffer[1] < buffer[0] + buffer[1] + buffer[2]
            n_increased += 1
          end
        end
      end
      return n_increased
    end

  end
end

