
module Aoc2022
  class Solution

    attr_reader :input

    def initialize(filename)
      @input = File.readlines(filename).map(&:strip)
      parse_input
    end

    def parse_input
    end

    def part1!
      raise "not implemented"
    end

    def part2!
      raise "not implemented"
    end

  end
end

