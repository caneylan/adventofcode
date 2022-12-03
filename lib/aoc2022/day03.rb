
module Aoc2022
  class Day03 < Solution

    @@priority_map = Hash.new(0)
    'a'.upto('z').each_with_index { |c, i| @@priority_map[c] = i + 1 }
    'A'.upto('Z').each_with_index { |c, i| @@priority_map[c] = i + 27 }

    def part1!
      input.map { |line| @@priority_map[ line.chars.each_slice(line.size/2).reduce(&:&).join ] }.sum
    end

    def part2!
      input.each_slice(3).map { |group| @@priority_map[ group.map(&:chars).reduce(&:&).join ] }.sum
    end

  end
end

