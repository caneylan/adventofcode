
module Aoc2022
  class Day01 < Solution

    def parse_input
      @elf_calories = [0]
      input.each do |line|
        if line.empty?
          @elf_calories << 0
        else
          @elf_calories[-1] += line.to_i
        end
      end
    end

    def part1!
      return @elf_calories.max
    end

    def part2!
      return @elf_calories.max(3).sum
    end

  end
end

