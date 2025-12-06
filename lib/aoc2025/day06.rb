
module Aoc2025
  class Day06 < Solution

    def parse_input
      input.each { |line| line << " " }
    end

    def part1!
      ops = input.pop.split
      nums = input.map { |line| line.split.map(&:to_i) }.transpose
      nums.each_with_index.sum do |nums, i|
        if ops[i] == '+'
          nums.reduce(0, :+)
        else
          nums.reduce(1, :*)
        end
      end
    end

    def part2!
      ops = input.pop.split(/(?=[*+])/)
      ops.sum do |op_s|
        op = op_s.chars.first
        width = op_s.size - 1
        ceph_nums = Array.new(width) { String.new }
        input.each do |line|
          line.slice!(0, width).chars.reverse.each_with_index do |c, i|
            ceph_nums[i] << c unless c == ''
          end
          line.slice!(0, 1)
        end
        if op == '+'
          ceph_nums.map(&:to_i).reduce(0, :+)
        else
          ceph_nums.map(&:to_i).reduce(1, :*)
        end
      end
    end

  end
end

