module Aoc2021
  class Day12 < Solution

    def initialize(filename)
      super(filename)
      @caves = Hash.new { |h, k| h[k] = Array.new }
      @upcase_lookup = {}
      input.each do |line|
        a, b = line.split('-')
        @caves[a.to_sym] << b.to_sym unless b == 'start'
        @caves[b.to_sym] << a.to_sym unless a == 'start'
        @upcase_lookup[a.to_sym] = true if a == a.upcase
        @upcase_lookup[b.to_sym] = true if b == b.upcase
      end
    end

    # ~0.32s for all tests
    # depth-first recursive; one re-used data-structure
    def cave_search_recur(from, allow_dupe = false, seen = {})
      complete_paths = 0
      @caves[from].each do |to|
        if to == :end
          complete_paths += 1
        elsif @upcase_lookup[to] || seen[to].nil?
          seen[to] = true
          complete_paths += cave_search_recur(to, allow_dupe, seen)
          seen[to] = nil
        elsif allow_dupe && seen[:dupe].nil?
          seen[:dupe] = to
          complete_paths += cave_search_recur(to, allow_dupe, seen)
          seen[:dupe] = nil
        end
      end
      return complete_paths
    end

    def part1!
      cave_search_recur(:start)
    end

    def part2!
      cave_search_recur(:start, true)
    end
  end

end
