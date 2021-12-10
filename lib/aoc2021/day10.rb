module Aoc2021
  class Day10 < Solution

    @@chunk_map = {
      '(' => ')',
      '[' => ']',
      '{' => '}',
      '<' => '>',
    }

    def part1!
      point_map = {
        ')' => 3,
        ']' => 57,
        '}' => 1197,
        '>' => 25137,
      }
      sum = 0
      input.each do |line|
        stack = []
        line.chars.each do |c|
          if @@chunk_map[c]
            stack.push(c)
          elsif @@chunk_map[stack.pop] != c
            sum += point_map[c]
            break
          end
        end
      end
      return sum
    end

    def part2!
      point_map = {
        '(' => 1,
        '[' => 2,
        '{' => 3,
        '<' => 4,
      }
      scores = []
      input.each do |line|
        stack = []
        next unless line.chars.each do |c|
          if @@chunk_map[c]
            stack.push(c)
          else
            break if @@chunk_map[stack.pop] != c
          end
        end
        scores << stack.reverse.inject(0) { |score, c| score * 5 + point_map[c] }
      end
      return scores.sort[scores.length / 2]
    end

  end
end
