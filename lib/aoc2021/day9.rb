module Aoc2021
  class Day9 < Solution

    def initialize(filename)
      super(filename)
      @grid = input.map { |line| line.chars.map(&:to_i) }
    end

    def get_neighbors(y, x)
      neighbors = []
      neighbors << [y - 1, x] if y > 0
      neighbors << [y, x - 1] if x  > 0
      neighbors << [y, x + 1] if x < @grid[y].length - 1
      neighbors << [y + 1, x] if y < @grid.length - 1
      return neighbors
    end

    def get_low_points
      low_points = []
      0.upto(@grid.length - 1).each do |y|
        0.upto(@grid[y].length - 1).each do |x|
          neighbors = get_neighbors(y, x)
          if neighbors.count { |p| @grid[p[0]][p[1]] > @grid[y][x] } == neighbors.length
            low_points << [y, x]
          end
        end
      end
      return low_points
    end

    def part1!
      return get_low_points.map { |p| @grid[p[0]][p[1]] + 1 }.sum
    end

    def part2!
      basin_sizes = []

      get_low_points.each do |point|
        seen = {}
        size = 0        
        points_to_check = [point]
        loop do
          p = points_to_check.pop or break
          unless seen["#{p[0]},#{p[1]}"]
            seen["#{p[0]},#{p[1]}"] = true
            if @grid[p[0]][p[1]] < 9
              size += 1
              points_to_check += get_neighbors(p[0], p[1])
            end
          end
        end
        basin_sizes << size
      end

      basin_sizes.sort!
      return basin_sizes[-1] * basin_sizes[-2] * basin_sizes[-3]
    end

  end
end
