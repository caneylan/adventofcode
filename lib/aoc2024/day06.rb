
module Aoc2024
  class Day06 < Solution

    def parse_input
      @map = []
      @height = input.size
      @width = input[0].size
      @orig_y =  nil
      @orig_x = nil
      @next_dy_dx = { -1 => { 0 => [0, 1] }, 0 => { 1 => [1, 0], -1 => [-1, 0] }, 1 => { 0 => [0, -1] } }
      input.each_with_index do |line, y|
        @map << line.chars.map { |c| c == '#' }
        x = line.index('^')
        if x
          @orig_y = y
          @orig_x = x
        end
      end
    end

    def part1!
      y = @orig_y
      x = @orig_x
      seen = { [y, x] => true }
      dy = -1
      dx = 0
      new_y = y + dy
      new_x = x + dx
      while new_x >= 0 && new_x < @width && new_y >= 0 && new_y < @height
        if @map[new_y][new_x]
          dy, dx = @next_dy_dx[dy][dx]
        else
          seen[[y, x]] = true
          y = new_y
          x = new_x
        end
        new_y = y + dy
        new_x = x + dx
      end
      seen.size + 1
    end

    def part2!
      count = 0
      0.upto(@height - 1) do |oy|
        0.upto(@width - 1) do |ox|
          next if oy == @orig_y && ox == @orig_x
          next if @map[oy][ox]
          @map[oy][ox] = true
          x = @orig_x
          y = @orig_y
          seen = { [y, x] => true }
          dy = -1
          dx = 0
          new_y = y + dy
          new_x = x + dx
          while new_x >= 0 && new_x < @width && new_y >= 0 && new_y < @height
            if @map[new_y][new_x]
              if seen[[y, x, dy, dx]]
                count += 1
                break
              end
              seen[[y, x, dy, dx]] = true
              dy, dx = @next_dy_dx[dy][dx]
            else
              y = new_y
              x = new_x
            end
            new_y = y + dy
            new_x = x + dx
          end
          @map[oy][ox] = false
        end
      end
      count
    end

  end
end

