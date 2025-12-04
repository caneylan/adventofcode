
module Aoc2025
  class Day03 < Solution

    def parse_input
      @banks = input.map { |line| line.chars.map(&:to_i) }
    end

    def max_joltage(bank, n)
      num_s = ""
      start_i = 0
      (n - 1).downto(0) do |reserved|
        end_i = bank.length - reserved - 1
        max = bank[start_i]
        max_i = start_i
        start_i.upto(end_i) do |i|
          if bank[i] > max
            max = bank[i]
            max_i = i
          end
        end
        num_s += max.to_s
        start_i = max_i + 1
      end
      num_s.to_i
    end

    def part1!
      @banks.sum { |bank| max_joltage(bank, 2) }
    end

    def part2!
      @banks.sum { |bank| max_joltage(bank, 12) }
    end

  end
end

