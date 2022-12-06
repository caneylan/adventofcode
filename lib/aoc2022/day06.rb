
module Aoc2022
  class Day06 < Solution

    def part1!
      0.step.find { |i| @input.first[i,4] =~ /^((.)(?!.*\2))*$/ } + 4
    end

    def part2!
      0.step.find { |i| @input.first[i,14] =~ /^((.)(?!.*\2))*$/ } + 14
    end

  end
end

