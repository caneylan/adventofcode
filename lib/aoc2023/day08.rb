
module Aoc2023
  class Day08 < Solution

    def parse_input
      @dirs = input.shift.chars
      @graph = {}
      input.shift
      input.each do |line|
        src, dests = line.split(/\s+=\s+/)
        left, right = dests.gsub(/[\(\)]/, '').split(/,\s+/)
        @graph[src] = { 'L' => left, 'R' => right }
      end
    end

    def dist_to_z(node)
      n = 0
      i = 0
      loop do
        node = @graph[node][@dirs[i]]
        n += 1
        return n if node.end_with?('Z')
        i = (i + 1) % @dirs.length
      end
    end

    def part1!
      dist_to_z('AAA')
    end

    def part2!
      @graph.keys.grep(/A$/).map { |a| dist_to_z(a) }.reduce(1) { |acc, n| acc.lcm(n) }
    end

  end
end
