
module Aoc2022
  class Day08 < Solution

    def parse_input
      @trees = @input.map(&:chars)
      @row_max = @trees.length - 1
      @col_max = @trees.first.length - 1
    end

    def part1!
      total = @trees.length * 2 + @trees.first.length * 2 - 4
      1.upto(@row_max - 1) do |row_i|
        1.upto(@col_max - 1) do |col_i|
          visible   = ! (col_i - 1).downto(0).find { |i| @trees[row_i][i] >= @trees[row_i][col_i] }
          visible ||= ! (row_i - 1).downto(0).find { |i| @trees[i][col_i] >= @trees[row_i][col_i] }
          visible ||= ! (col_i + 1).upto(@col_max).find { |i| @trees[row_i][i] >= @trees[row_i][col_i] }
          visible ||= ! (row_i + 1).upto(@row_max).find { |i| @trees[i][col_i] >= @trees[row_i][col_i] }
          total += 1 if visible
        end
      end
      total
    end

    def part2!
      best = 0
      1.upto(@row_max - 1) do |row_i|
        1.upto(@col_max - 1) do |col_i|
          left = col_i - ((col_i - 1).downto(0).find { |i| @trees[row_i][i] >= @trees[row_i][col_i] } || 0)
          up   = row_i - ((row_i - 1).downto(0).find { |i| @trees[i][col_i] >= @trees[row_i][col_i] } || 0)
          right = ((col_i + 1).upto(@col_max).find { |i| @trees[row_i][i] >= @trees[row_i][col_i] } || @col_max) - col_i
          down  = ((row_i + 1).upto(@row_max).find { |i| @trees[i][col_i] >= @trees[row_i][col_i] } || @row_max) - row_i
          score = left * right * up * down
          best = score if score > best
        end
      end
      best
    end

  end
end

