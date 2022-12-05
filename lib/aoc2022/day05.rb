
module Aoc2022
  class Day05 < Solution

    def parse_input
      stack_count_index = input.index { |line| line =~ /^(\s+\d+\s+)+$/ }
      stack_count = input[stack_count_index].strip.split(/\s+/).size

      @stacks = Array.new(stack_count) { Array.new }
      @moves = []

      0.upto(stack_count_index - 1) do |input_index|
        0.upto(stack_count - 1) do |i|
          crate = input[input_index].chars[i*4 + 1]
          @stacks[i].unshift(crate) unless crate == ' '
        end
      end

      (stack_count_index + 2).upto(input.size - 1) do |input_index|
        n, source, dest = input[input_index].gsub(/[a-z]/, '').split.map(&:to_i)
        @moves << [ n, source - 1, dest - 1 ]
      end
    end

    def stack_tops
      @stacks.map { |stack| stack.last }.join
    end

    def part1!
      @moves.each do |n, source, dest|
        @stacks[dest] += @stacks[source].pop(n).reverse
      end
      stack_tops
    end

    def part2!
      @moves.each do |n, source, dest|
        @stacks[dest] += @stacks[source].pop(n)
      end
      stack_tops
    end

  end
end

