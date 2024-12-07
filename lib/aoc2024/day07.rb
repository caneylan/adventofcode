
module Aoc2024
  class Day07 < Solution

    def parse_input
      @operations = []
      input.each do |line|
        r, o = line.split(/:\s+/)
        @operations << { :val => r.to_i, :operands =>  o.split.map(&:to_i) }
      end
    end

    def part1!
      sum = 0
      @operations.each do |operation|
        operands = operation[:operands]
        op_count = operands.size - 1
        op_max = (2 ** op_count) - 1
        0.upto(op_max) do |i|
          r = operands[0]
          i.to_s(2).rjust(op_count, '0').chars.each_with_index do |c, i|
            case c
            when '0'
              r = r * operands[i + 1]
            when '1'
              r = r + operands[i + 1]
            end
            break if r > operation[:val]
          end
          if r == operation[:val]
            sum += r
            break
          end
        end
      end
      sum
    end

    def part2!
      sum = 0
      @operations.each do |operation|
        operands = operation[:operands]
        op_count = operands.size - 1
        op_max = (3 ** op_count) - 1
        0.upto(op_max) do |i|
          r = operands[0]
          i.to_s(3).rjust(op_count, '0').chars.each_with_index do |c, i|
            case c
            when '0'
              r = r * operands[i + 1]
            when '1'
              r = r + operands[i + 1]
            when '2'
              r = (r.to_s + operands[i + 1].to_s).to_i
            end
            break if r > operation[:val]
          end
          if r == operation[:val]
            sum += r
            break
          end
        end
      end
      sum
    end

  end
end

