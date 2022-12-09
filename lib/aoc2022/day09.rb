
module Aoc2022
  class Day09 < Solution

    def parse_input
      @moves = input.map(&:split).map { |d, n| [d, n.to_i] }
    end

    def move(h, t, d)
      h_new = [ h[0] + d[0], h[1] + d[1] ]
      return h_new, nil unless t

      dx = h_new[0] - t[0]
      dy = h_new[1] - t[1]
      dt = [ dx <=> 0, dy <=> 0 ] if dx.abs > 1 || dy.abs > 1
      return h_new, dt
    end

    def part1!
      h = [0,0]
      t = [0,0]
      t_paths = []
      @moves.each do |(direction, n)|
        n.times do
          case direction
          when 'R'
            h, dt = move(h, t, [1, 0])
          when 'L'
            h, dt = move(h, t, [-1, 0])
          when 'U'
            h, dt = move(h, t, [0, 1])
          when 'D'
            h, dt = move(h, t, [0, -1])
          end
          t[0] += dt[0] if dt
          t[1] += dt[1] if dt
          t_paths << t.inspect
        end
      end
      return t_paths.uniq.size
    end

    def part2!
      snake = 10.times.map { |i| [0, 0] }
      t_paths = []
      move_stack = []
      @moves.each do |(direction, n)|
        case direction
        when 'R'
          n.times { move_stack.unshift([0, [1, 0]]) }
        when 'L'
          n.times { move_stack.unshift([0, [-1, 0]]) }
        when 'U'
          n.times { move_stack.unshift([0, [0, 1]]) }
        when 'D'
          n.times { move_stack.unshift([0, [0, -1]]) }
        end
      end
      until move_stack.empty?
        h_i, dh = move_stack.pop
        snake[h_i], dt = move(snake[h_i], snake[h_i + 1], dh)
        move_stack.push([h_i + 1, dt]) if dt
        t_paths << snake[h_i].inspect if h_i == snake.length - 1
      end
      return t_paths.uniq.size + 1
    end

  end
end

