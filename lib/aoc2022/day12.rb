
module Aoc2022
  class Day12 < Solution

    def parse_input
      @map = []
      @lowest_points = []
      input.each_with_index do |line, y|
        @map << line.chars.map.with_index do |c, x|
                 if c == 'S'
                   @start = [y, x]
                   0
                 elsif c == 'E'
                   @goal = [y, x]
                   26
                 else
                   @lowest_points << [y, x] if c == 'a'
                   c.ord - 97
                 end
               end
      end
      @lowest_points << @start
    end

    def up_neighbors((y, x)) # as in what's up neighbors
      [ [-1, 0], [0, -1], [0, 1], [1, 0] ].select do |(dy, dx)|
        x + dx >= 0 && x + dx < @map[0].length &&
        y + dy >= 0 && y + dy < @map.length &&
        @map[y+dy][x+dx] <= @map[y][x] + 1
      end.map { |(dy, dx)| [y+dy, x+dx] }
    end

    def shortest_path(goal, *sources)
      distances = Hash.new { |h, k| h[k] = Hash.new }
      queue = sources.clone
      queue.each { |n| distances[n[0]][n[1]] = 0 }
      until queue.empty?
        u = queue.pop
        u_distance = distances[u[0]][u[1]]
        return u_distance if u[0] == goal[0] && u[1] == goal[1]
        up_neighbors(u).each do |v|
          v_distance_new = u_distance + 1
          if distances[v[0]][v[1]].nil?
            i = queue.bsearch_index { |n| distances[n[0]][n[1]] <= v_distance_new } || queue.length
            queue.insert(i, v)
            distances[v[0]][v[1]] = v_distance_new
          elsif v_distance_new < distances[v[0]][v[1]]
            distances[v[0]][v[1]] = v_distance_new
          end
        end
      end
      return nil
    end

    def part1!
      shortest_path(@goal, @start)
    end

    def part2!
      shortest_path(@goal, *@lowest_points)
    end

  end
end

