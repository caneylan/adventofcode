
module Aoc2021
  class Day1 < Solution

    def part1!
      previous = nil
      n_increased = 0
      input.each do |line|
        current = line.to_i
        if previous && current > previous
          n_increased += 1
        end
        previous = current
      end
      return n_increased
    end

    def part2!
      buffer = [nil, nil, nil]
      n_increased = 0
      input.each do |line|
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

