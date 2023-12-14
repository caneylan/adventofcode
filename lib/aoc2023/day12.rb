
module Aoc2023
  class Day12 < Solution

    def pipe(state, pattern, cache = {})
      n = 0
      state = state.sub(/^\.*/, '')
      if state =~ /^([#\?]{#{pattern.first}}([\?\.]|$))/
        match = $1
        new_state = state[(match.length)..-1]
        if pattern.length == 1 && new_state.index('#').nil?
          n += 1
        elsif new_state.length - new_state.count('.') > pattern[1..-1].sum - 1
          cache["#{new_state}:#{pattern[1..-1].inspect}"] ||= pipe(new_state, pattern[1..-1], cache)
          n += cache["#{new_state}:#{pattern[1..-1].inspect}"]
        end
      end
      if state.start_with?('?') && state.length - state.count('.') > pattern.sum
        cache["#{state[1..-1]}:#{pattern.inspect}"] ||= pipe(state[1..-1], pattern, cache)
        n += cache["#{state[1..-1]}:#{pattern.inspect}"]
      end
      n
    end

    def part1!
      input.map do |line|
        state, pattern = line.split
        pipe(state, pattern.split(',').map(&:to_i))
      end.sum
    end

    def part2!
      input.each_with_index.map do |line, i|
        state, pattern = line.split
        state = "#{state}?#{state}?#{state}?#{state}?#{state}"
        pattern = "#{pattern},#{pattern},#{pattern},#{pattern},#{pattern}"
        pipe(state, pattern.split(',').map(&:to_i))
      end.sum
    end

  end
end

