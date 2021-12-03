
module Aoc2021
  class Solution

    attr_reader :input

    def initialize(filename)
      @input = File.readlines(filename).map(&:strip)
    end

    def solve
      raise "not implemented"
    end

  end
end

