
module Aoc2022
  class Day08 < Solution

    def parse_input
      @grid = @input.map(&:chars)
      @part1 = Array.new(@grid.length) { |i| Array.new(@grid.first.length, false) }
      @part2 = Array.new(@grid.length) { |i| Array.new(@grid.first.length, 1) }

      4.times do |iter|
        @grid.each_index.to_a.product(@grid.first.each_index.to_a) do |(x, y)|
          higher_i = (y+1).upto(@grid[x].length - 1).find_index { |_y| @grid[x][_y] >= @grid[x][y] }
          @part1[x][y] ||= ! higher_i
          @part2[x][y] *= (higher_i || @grid[x].length - y - 2) + 1
        end
        @grid, @part1, @part2 = [@grid, @part1, @part2].map { |a| a.transpose.map(&:reverse) }
      end
    end

    def part1!
      @part1.map { |row| row.count(true) }.sum
    end

    def part2!
      @part2.map { |row| row.max }.max
    end

  end
end

