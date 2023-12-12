
module Aoc2023
  class Day12 < Solution

    def parse_input
    end

    def pipe(state, pattern)
      q = [ [state, pattern] ]
      n = 0
      until q.empty?
        state, pattern = q.shift
        state = state.sub(/^\.*/, '')
        if state =~ /^([#\?]{#{pattern.first}}([\?\.]|$))/
          match = $1
          new_state = state[(match.length)..-1]
          if pattern.length == 1
            if new_state.index('#').nil?
              n += 1
            end
          elsif new_state.length - new_state.count('.') > pattern[1..-1].sum - 1
            q << [ new_state, pattern[1..-1] ]
          end
        end
        if state.start_with?('?') && state.length - state.count('.') > pattern.sum
          q << [ state[1..-1], pattern ]
        end
      end
      return n
    end

    def part1!
      input.map do |line|
        state, pattern = line.split
        pipe(state, pattern.split(',').map(&:to_i))
      end.sum
    end

    def part2!
      t1 = Time.now
      t2 = Time.now
      input.each_with_index.map do |line, i|
        state, pattern = line.split
        state = "#{state}?#{state}?#{state}?#{state}?#{state}"
        pattern = "#{pattern},#{pattern},#{pattern},#{pattern},#{pattern}"
        n = pipe(state, pattern.split(',').map(&:to_i))
        t2 = Time.now
        puts "that took #{t2 - t1} seconds"
        t1 = t2
        n
      end.sum
    end

  end
end

