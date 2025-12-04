
require_relative '../oobarray.rb'

module Aoc2025
  class Day04 < Solution
    def parse_input
      @map = input.map { |line| line.chars.map { |c| c == '@' ? true : nil } }.extend(OutOfBoundsArray)
      @y_length = @map.length
      @x_length = @map[0].length
      @dydx = [ [-1,-1], [-1,0], [-1,1], [0,-1], [0,1], [1,-1], [1,0], [1,1] ]
    end

    def find_tp
      found = []
      @map.each_with_index do |row, y|
        row.each_with_index do |obj, x|
          next unless obj
          found << [y, x] if @dydx.count { |dy, dx| ! @map[y+dy][x+dx].nil? } < 4
        end
      end
      found
    end

    def part1!
      find_tp.length
    end

    def part2!
      count = 0
      while (tp = find_tp).length > 0
        tp.each do |y, x|
          @map[y][x] = nil
        end
        count += tp.length
      end
      count
    end

  end
end

