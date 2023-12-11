
module Aoc2023
  class Day11 < Solution

    def parse_input
      @jump_rows = []
      @jump_cols = []
      @galaxies = []
      input.each_with_index do |row, y|
        @jump_rows << y if row.count('#') == 0
        0.upto(input[0].length - 1) do |x|
          if y == 0
            col = input.map { |row| row[x] }
            @jump_cols << x if col.count('#') == 0
          end
          @galaxies << [x, y] if row[x] == '#'
        end
      end
    end

    def expand_galaxies!(n)
      @galaxies.map! do |g|
        [ @jump_cols.count { |x| x < g[0] } * n + g[0],
          @jump_rows.count { |y| y < g[1] } * n + g[1] ]
      end
    end

    def sum_galaxies
      @galaxies.combination(2).to_a.map do |(g1, g2)|
        (g2[1] - g1[1]).abs + (g2[0] - g1[0]).abs
      end.sum
    end

    def part1!
      expand_galaxies!(1)
      sum_galaxies
    end

    def part2!(n)
      expand_galaxies!(n)
      sum_galaxies
    end

  end
end

