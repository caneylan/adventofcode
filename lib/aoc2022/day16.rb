
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

    # first solution: works for part 1 only, very fast
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

    # second solution: multiple workers for part 2; very slow
    def really_under_pressure(valve_workers, time_left)

      pressure = 0
      updated_states = []

      valve_workers.each do |valve_worker|
        if valve_worker[:path].length == 1
          pressure += @valves[valve_worker[:dest]][:rate] * time_left
          updated_states << valve_worker[:dest]
          @valve_states[valve_worker[:dest]] = true
        end
      end

      workers_going_to_new = 0
      workers_next_steps = \
        valve_workers.map do |valve_worker|
          next_steps = []
          if valve_worker[:path].length > 1
            next_steps << valve_worker[:path][1..-1]
          elsif valve_worker[:path].length == 1
            next_steps << []
          else
            @flow_valves.each do |v|
              unless @valve_states[v] || @paths[valve_worker[:dest]][v].length >= time_left || valve_workers.any? { |w| w[:dest] == v }
                next_steps << @paths[valve_worker[:dest]][v]
              end
            end
            if next_steps.empty?
              next_steps << []
              valve_worker[:done] = true
            else
              workers_going_to_new += 1
            end
          end
          next_steps
        end
     
      max_dest_pressure = 0
      unless valve_workers.count { |w| w[:done] } == valve_workers.length
        next_step_options = if valve_workers.length == 1
                              workers_next_steps[0].map { |step| [step] }
                            else
                              workers_next_steps[0].product(workers_next_steps[1]).reject do |path_combo|
                                workers_going_to_new == 2 && path_combo[0].last == path_combo[1].last
                              end
                            end
   
        next_step_options.each do |next_step_option|
          new_workers = \
            valve_workers.map.with_index do |valve_worker, i|
              { :path => next_step_option[i], :dest => next_step_option[i].length == 0 ? valve_worker[:dest] : next_step_option[i].last, :done => valve_worker[:done] }
            end
          dest_pressure = really_under_pressure(new_workers, time_left - 1)
          if dest_pressure > max_dest_pressure
            max_dest_pressure = dest_pressure
          end
        end
      end

      updated_states.each do |valve|
        @valve_states[valve] = false
      end
      return pressure + max_dest_pressure
    end


    def part1!
      really_under_pressure([{:path => [], :dest => 'AA'}], 29)
    end

    def part2!
      really_under_pressure([{:path => [], :dest => 'AA'}, {:path => [], :dest => 'AA'}], 25)
    end

  end
end

