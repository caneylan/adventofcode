
module Aoc2022
  class Solution

    attr_reader :input

    def initialize(filename, opts = {})
      @input = File.readlines(filename)
      @input = @input.map(&:strip) unless opts[:no_strip_input]
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

