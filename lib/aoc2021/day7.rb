module Aoc2021
  class Day7 < Solution

    def part1!
      positions = input.first.split(',').map(&:to_i).sort
      min_fuel_cost = nil

      positions.first.upto(positions.last) do |position|
        fuel_cost = positions.inject(0) { |sum, p| sum += (position - p).abs }
        min_fuel_cost = fuel_cost if min_fuel_cost.nil? or fuel_cost < min_fuel_cost
        break if fuel_cost > min_fuel_cost
      end

      return min_fuel_cost
    end

    def part2!
      positions = input.first.split(',').map(&:to_i).sort
      min_fuel_cost = nil

      positions.first.upto(positions.last) do |position|
        fuel_cost = positions.inject(0) { |sum, p| d = (position - p).abs ;  sum += d * (d + 1) / 2 }
        min_fuel_cost = fuel_cost if min_fuel_cost.nil? or fuel_cost < min_fuel_cost
        break if fuel_cost > min_fuel_cost
      end

      return min_fuel_cost
    end

  end
end
