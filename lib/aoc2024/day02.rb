
module Aoc2024
  class Day02 < Solution

    def parse_input
      @reports = input.map { |line| line.split.map(&:to_i) }
    end

    def check(report)
      ok = report[0] > report[1] ? (1..3) : (-3..-1)
      1.upto(report.size - 1) do |i|
        return false unless ok.include?(report[i - 1] - report[i])
      end
      true
    end

    def part1!
      @reports.count { |r| check(r) }
    end

    def part2!
      @reports.count do |report|
        0.upto(report.size).find do |i|
          r = report.clone
          r.delete_at(i)
          check(r)
        end
      end
    end

  end
end

