
module Aoc2023
  class Day02 < Solution

    def part1!
      maxes = { 'red' => 12, 'green' => 13, 'blue' => 14 }
      input.map do |line|
        id, games = line.split(': ')
        games.split(/;\s+/).each do |game|
          game.split(/,\s+/).each do |item|
            n, color = item.split(/\s+/)
            id = '0' if n.to_i > maxes[color]
          end
        end
        id.sub(/^Game /, '').to_i
      end.sum
    end

    def part2!
      input.map do |line|
        maxes = Hash.new(0)
        line.sub(/^.*:\s+/, '').split(/;\s+/).each do |game|
          game.split(/,\s+/).each do |item|
            n, color = item.split(/\s+/)
            maxes[color] = n.to_i if n.to_i > maxes[color]
          end
        end
        maxes.values.reduce(&:*)
      end.sum
    end

  end
end

