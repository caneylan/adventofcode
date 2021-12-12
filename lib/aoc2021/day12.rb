module Aoc2021
  class Day12 < Solution

    def initialize(filename)
      super(filename)
      @caves = Hash.new { |h, k| h[k] = Array.new }
      input.each do |line|
        a, b = line.split('-')
        @caves[a] << b unless b == 'start'
        @caves[b] << a unless a == 'start'
      end
    end

    # terrible breadth-first accumulator
    def part1!
      complete_paths = 0
      incomplete_paths = [ { :last => 'start' } ]
      loop do
        break if incomplete_paths.empty?
        path = incomplete_paths.pop
        @caves[path[:last]].each do |to|
          if to == 'end'
            complete_paths += 1
          elsif to == to.upcase || ! path[to]
            new_path = path.clone
            new_path[:last] = to
            new_path[to] = true
            incomplete_paths << new_path
          end
        end
      end
      return complete_paths
    end

    # terrible breadth-first accumulator
    def part2!
      complete_paths = 0
      incomplete_paths = [ { :last => 'start' } ]
      loop do
        break if incomplete_paths.empty?
        path = incomplete_paths.pop
        @caves[path[:last]].each do |to|
          if to == 'end'
            complete_paths += 1
          elsif to == to.upcase || ! path[to]
            new_path = path.clone
            new_path[:last] = to
            new_path[to] = true
            incomplete_paths << new_path
          elsif path[:dupe].nil?
            new_path = path.clone
            new_path[:last] = to
            new_path[to] = true
            new_path[:dupe] = to
            incomplete_paths << new_path
          end
        end
      end
      return complete_paths
    end

  end
end
