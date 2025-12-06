
module Aoc2025
  class Solution

    attr_reader :input

    def initialize(filename, opts = {})
      @input = File.readlines(filename)
      @input = if opts[:no_strip_input]
                 @input.map(&:chomp)
               else
                 @input.map(&:strip)
               end
      @is_example = opts[:is_example]
      parse_input
    end

    def parse_input
    end

    def is_example?
      @is_example
    end

    def part1!
      raise "not implemented"
    end

    def part2!
      raise "not implemented"
    end

  end
end

