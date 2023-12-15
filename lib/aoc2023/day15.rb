
module Aoc2023
  class Day15 < Solution

    def parse_input
      @steps = input.first.split(',')
    end

    def reindeer_hash(str)
      str.chars.reduce(0) { |n, c| ((n + c.ord) * 17) % 256 }
    end

    def part1!
      @steps.sum { |s| reindeer_hash(s) }
    end

    def part2!
      boxes = Array.new(256) { Array.new }
      @steps.each do |step|
        label, val = step.split(/[=-]/)
        box = reindeer_hash(label)
        if val
          i = boxes[box].index { |l| l[0] == label }
          if i 
            boxes[box][i] = [label, val.to_i]
          else
            boxes[box] << [label, val.to_i]
          end
        else
          boxes[box].delete_if { |l| l[0] == label }
        end
      end
      boxes.each_with_index.sum { |b, i| b.each_with_index.sum { |lens, j| (i + 1) * (j + 1) * lens[1] } }
    end

  end
end

