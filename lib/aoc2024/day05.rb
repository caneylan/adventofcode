
module Aoc2024
  class Day05 < Solution

    def parse_input
      @rules = Hash.new { |h, k| h[k] = {} }
      @updates = []
      input.each do |line|
        case line
        when /(\d+)\|(\d+)/
          @rules[$1][$2] = true
        when /\d+,/
          @updates << line.split(',')
        end
      end
    end

    def part1!
      sum = 0
      @updates.each do |update|
        u = update.sort { |a, b| @rules[a][b] ? -1 : 1 }
        if update == u
          sum += u[u.size / 2].to_i
        end
      end
      sum
    end

    def part2!
      sum = 0
      @updates.each do |update|
        u = update.sort { |a, b| @rules[a][b] ? -1 : 1 }
        if update != u
          sum += u[u.size / 2].to_i
        end
      end
      sum
    end

  end
end

