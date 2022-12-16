
module Aoc2022
  class Day16 < Solution

    def parse_input
      @valves = {}
      input.each do |line|
        line =~ /Valve ([A-Z]+) has flow rate=(-?\d+); tunnels? leads? to valves? (.*)$/ or raise ArgumentError.new line
        @valves[$1] = { :rate => $2.to_i, :neighbors => $3.split(', ') }
      end
      @flow_valves = @valves.keys.select { |v| @valves[v][:rate] != 0 }
      @paths = Hash.new { |h, k| h[k] = Hash.new }
      @valves.keys.permutation(2) { |(a, b)| @paths[a][b] = shortest_path(a, b) }
      @valve_states = Hash[ @valves.keys.map { |v| [v, false] } ]
    end

    def shortest_path(source, goal)
      distances = { source => 0 }
      prev = {}
      queue = [ source ]
      until queue.empty?
        u = queue.pop
        u_distance = distances[u]
        if u == goal
          s = [goal]
          s.unshift(u) until (u = prev[u]) == source
          return s
        end
        @valves[u][:neighbors].each do |v|
          v_distance_new = u_distance + 1
          if distances[v].nil?
            i = queue.bsearch_index { |n| distances[n] <= v_distance_new } || queue.length
            queue.insert(i, v)
            distances[v] = v_distance_new
            prev[v] = u
          elsif v_distance_new < distances[v]
            distances[v] = v_distance_new
            prev[v] = u
          end
        end
      end
      raise RuntimeError.new "cannot get to #{goal} from #{source}"
    end

    def under_pressure(valve_id, time_left)
      pressure = @valves[valve_id][:rate] * time_left
      @valve_states[valve_id] = true
      time_left -= 1

      max_dest_pressure = 0
      reachable_shut_valves = @flow_valves.reject { |v| @valve_states[v] }.reject { |v| @paths[valve_id][v].length >= time_left }
      reachable_shut_valves.each do |dest_valve|
        time_left_after_travel = time_left - @paths[valve_id][dest_valve].length
        dest_pressure = under_pressure(dest_valve, time_left_after_travel)
        if dest_pressure > max_dest_pressure
          max_dest_pressure = dest_pressure
        end
      end

      @valve_states[valve_id] = false
      return pressure + max_dest_pressure
    end

    def part1!
      under_pressure('AA', 30)
    end

    def part2!
      return false
    end

  end
end

