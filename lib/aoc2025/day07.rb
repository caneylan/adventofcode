
module Aoc2025
  class Day07 < Solution

    def parse_input
      @splitters = {}
      @start = nil
      @map_max = input.length
      input.each_with_index do |line, y|
        line.chars.each_with_index do |c, x|
          case c
          when 'S'
            @start = [y, x]
          when '^'
            @splitters[[y,x]] = true
          end
        end
      end
    end

    def part1!
      count = 0
      beams = { @start => true }
      while beams.any?
        new_beams = {}
        beams.each do |beam, _|
          new_pos = [beam[0] + 1, beam[1]]
          next if new_pos[0] >= @map_max
          if @splitters[new_pos]
            new_beams[[new_pos[0], new_pos[1] - 1]] = true
            new_beams[[new_pos[0], new_pos[1] + 1]] = true
            count += 1
          else
            new_beams[new_pos] = true
          end
        end
        beams = new_beams
      end
      count
    end

    def part2!
      count = 0
      seen = {}
      beams = [ @start ]
      while beams.any?
        beam = beams.pop
        if seen[beam]
          count += seen[beam]
          next
        end
        new_pos = [beam[0] + 1, beam[1]]
        until new_pos[0] >= @map_max || @splitters[new_pos]
          new_pos = [new_pos[0] + 1, new_pos[1]]
        end
        if new_pos[0] >= @map_max
          seen[beam] = 1
          count += 1
        else
          beam_left = [new_pos[0], new_pos[1] - 1]
          beam_right = [new_pos[0], new_pos[1] + 1]
          if seen[beam_left] && seen[beam_right]
            seen[beam] = seen[beam_left] + seen[beam_right]
            count += seen[beam]
          else
            if seen[beam_left]
              count += seen[beam_left]
            else
              beams << beam_left
            end
            if seen[beam_right]
              count += seen[beam_right]
            else
              beams << beam_right
            end
          end
        end
      end
      count
    end

  end
end

