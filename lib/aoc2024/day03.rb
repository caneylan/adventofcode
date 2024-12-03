
module Aoc2024
  class Day03 < Solution

    def part1!
      input.join.scan(/mul\(\d{1,3},\d{1,3}\)/).map do |s|
        s.scan(/\d+/).map(&:to_i).reduce(&:*)
      end.sum
    end

    def part2!
      nums = []
      on = true
      input.join.scan(/mul\(\d{1,3},\d{1,3}\)|don't\(\)|do\(\)/).each do |s|
        if s == "don't()"
          on = false
        elsif s == "do()"
          on = true
        elsif on
          nums << s.scan(/\d+/).map(&:to_i).reduce(&:*)
        end
      end
      nums.sum
    end

  end
end

