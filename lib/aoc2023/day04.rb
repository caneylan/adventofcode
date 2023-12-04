
module Aoc2023
  class Day04 < Solution

    def parse_input
      @match_counts = input.map do |line|
        winners, mine = line.sub(/Card.*:\s+/, '').split(/\s+\|\s+/).map(&:split)
        (winners & mine).length
      end
    end

    def part1!
      @match_counts.map do |match_count|
        (2 ** (match_count - 1)).floor
      end.sum
    end

    def part2!
      card_counts = Hash.new(0)
      @match_counts.each_with_index do |match_count, id|
        card_counts[id] += 1
        1.upto(match_count) do |di|
          card_counts[id + di] += card_counts[id]
        end
      end
      card_counts.values.sum
    end

  end
end

