
module Aoc2023
  class Day17 < Solution

    def parse_input
      @map = input.map { |line| line.chars.map(&:to_i) }
      @y_max = @map.length - 1
      @x_max = @map[0].length - 1
      @goal = [@y_max, @x_max]
    end

    def ultra_neighbors(node, prev, ttl, ttl_max)
      dy = node[0] - prev[0]
      dx = node[1] - prev[1]
      neighs = []
      if ttl > (ttl_max - 4)
        # straight
        neighs << [[node[0] + dy, node[1]], ttl - 1] if dy != 0 && node[0] + dy >= 0 && node[0] + dy <= @y_max
        neighs << [[node[0], node[1] + dx], ttl - 1] if dx != 0 && node[1] + dx >= 0 && node[1] + dx <= @x_max
      else
        # straight
        if ttl > 0
          neighs << [[node[0] + dy, node[1]], ttl - 1] if dy != 0 && node[0] + dy >= 0 && node[0] + dy <= @y_max
          neighs << [[node[0], node[1] + dx], ttl - 1] if dx != 0 && node[1] + dx >= 0 && node[1] + dx <= @x_max
        end
        # turn, but only if there's runway
        if dy != 0
          neighs << [[node[0], node[1] - 1], ttl_max - 1] if node[1] - 4 >= 0
          neighs << [[node[0], node[1] + 1], ttl_max - 1] if node[1] + 4 <= @x_max
        else
          neighs << [[node[0] - 1, node[1]], ttl_max - 1] if node[0] - 4 >= 0
          neighs << [[node[0] + 1, node[1]], ttl_max - 1] if node[0] + 4 <= @y_max
        end
      end
      neighs
    end

    def regular_neighbors(node, prev, ttl, ttl_max)
      dy = node[0] - prev[0]
      dx = node[1] - prev[1]
      neighs = []
      if ttl > 0
        # straight
        neighs << [[node[0] + dy, node[1]], ttl - 1] if dy != 0 && node[0] + dy >= 0 && node[0] + dy <= @y_max
        neighs << [[node[0], node[1] + dx], ttl - 1] if dx != 0 && node[1] + dx >= 0 && node[1] + dx <= @x_max
      end
      # turn
      if dy != 0
        neighs << [[node[0], node[1] - 1], ttl_max - 1] if node[1] - 1 >= 0
        neighs << [[node[0], node[1] + 1], ttl_max - 1] if node[1] + 1 <= @x_max
      else
        neighs << [[node[0] - 1, node[1]], ttl_max - 1] if node[0] - 1 >= 0
        neighs << [[node[0] + 1, node[1]], ttl_max - 1] if node[0] + 1 <= @y_max
      end
      neighs
    end

    def shortest_path(source, source_prev, neighbors_fn, ttl_max)
      source_key = [source, source_prev, ttl_max - 1]
      distances = { source_key => @map[source[0]][source[1]] }
      prev = {}
      queue = [ [source, source_prev, ttl_max - 1] ]
      goals = {}
      until queue.empty?
        u, u_prev, u_ttl = queue.pop
        u_key = [u, u_prev, u_ttl]
        if u == @goal
          save = [0, [@goal]]
          goals[u_key] = save
          save[1].unshift(u) until (u_key = prev[u_key] ; u = u_key[0]) == source
          save[0] = save[1].sum { |(y, x)| @map[y][x] } + @map[source[0]][source[1]]
          break if goals.length == ttl_max * 4
        else
          u_distance = distances[u_key]
          send(neighbors_fn, u, u_prev, u_ttl, ttl_max).each do |(v, v_ttl)|
            v_key = [v, u, v_ttl]
            v_distance_new = u_distance + @map[v[0]][v[1]]
            if distances[v_key].nil?
              distances[v_key] = v_distance_new
              prev[v_key] = u_key
              i = queue.bsearch_index { |(n, n_prev, n_ttl)| n_key = [n, n_prev, n_ttl] ; distances[n_key] <= v_distance_new } || queue.length
              queue.insert(i, [v, u, v_ttl])
            elsif v_distance_new < distances[v_key]
              distances[v_key] = v_distance_new
              prev[v_key] = u_key
            end
          end
        end
      end
      return goals.values.map(&:first).min
    end

    def part1!
      weight_a = shortest_path([0,1], [0,0], :regular_neighbors, 3)
      weight_b = shortest_path([1,0], [0,0], :regular_neighbors, 3)
      [weight_a, weight_b].min
    end

    def part2!
      weight_a = shortest_path([0,1], [0,0], :ultra_neighbors, 10)
      weight_b = shortest_path([1,0], [0,0], :ultra_neighbors, 10)
      [weight_a, weight_b].min
    end

  end
end

