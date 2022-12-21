
module Aoc2022
  class Day21 < Solution

    def parse_input
      @monkey_values = {}
      @monkey_ops = {}
      @depends_on_left = Hash.new { |h, k| h[k] = Array.new }
      @depends_on_right = Hash.new { |h, k| h[k] = Array.new }
      @reverse_ops = { :+ => :-, :- => :+, :* => :/, :/ => :* }
      input.map do |line|
        case line
        when /^([a-z]+): (-?\d+)$/
          @monkey_values[$1] = $2.to_i
        when /^([a-z]+): ([a-z]+) (.) ([a-z]+)$/
          @monkey_ops[$1] = [$2, $3.to_sym, $4]
          @depends_on_left[$2] << $1
          @depends_on_right[$4] << $1
        else
          raise RuntimeError.new "unrecognized line: #{line}"
        end
      end
    end

    def reduce_ops!
      queue = @monkey_values.keys
      until queue.empty?
        while id = queue.pop
          @depends_on_left[id].each { |op_id| @monkey_ops[op_id][0] = @monkey_values[id] }
          @depends_on_right[id].each { |op_id| @monkey_ops[op_id][2] = @monkey_values[id] }
        end
        @monkey_ops.each do |id, op|
          if op[0].is_a?(Integer) && op[2].is_a?(Integer)
            @monkey_values[id] = op[0].send(op[1], op[2])
            @monkey_ops.delete(id)
            queue << id
          end
        end
      end
    end

    def part1!
      reduce_ops!
      @monkey_values['root']
    end

    def part2!
      @monkey_values.delete('humn')
      reduce_ops!

      goal = @monkey_ops['root'].find { |o| o.is_a?(Integer) }
      target = @monkey_ops['root'].find { |o| o.is_a?(String) }
      until target == 'humn'
        op = @monkey_ops[target]
        if op[0].is_a?(Integer)
          if op[1] == :- || op[1] == :/
            goal = op[0].send(op[1], goal)
          else
            goal = goal.send(@reverse_ops[op[1]], op[0])
          end
          target = op[2]
        else
          goal = goal.send(@reverse_ops[op[1]], op[2])
          target = op[0]
        end
      end
      goal
    end

  end
end

