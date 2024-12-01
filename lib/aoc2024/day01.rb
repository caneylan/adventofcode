
module Aoc2024
  class Day01 < Solution

    def parse_input
      @a = []
      @b = []
      input.each do |row|
        a, b = row.split.map(&:to_i)
        @a << a
        @b << b
      end
    end

    def part1!
      a = @a.sort
      b = @b.sort
      0.upto(@a.size - 1).map { |i| (b[i] - a[i]).abs }.sum
    end

    def part2!
      c = Hash.new(0)
      @b.each do |b|
        c[b] += 1
      end 
      @a.map { |a| a * c[a] }.sum
    end

  end
end

