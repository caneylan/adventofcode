
module Aoc2024
  class Day06 < Solution

    def parse_input
      @map = []
      @height = input.size
      @width = input[0].size
      @orig_y =  nil
      @orig_x = nil
      @orig_traversal = {}
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
      @orig_traversal[[y, x]] = true
      dy = -1
      dx = 0
      new_y = y + dy
      new_x = x + dx
      while new_x >= 0 && new_x < @width && new_y >= 0 && new_y < @height
        if @map[new_y][new_x]
          dy, dx = @next_dy_dx[dy][dx]
        else
          y = new_y
          x = new_x
          @orig_traversal[[y, x]] = true
        end
        new_y = y + dy
        new_x = x + dx
      end
      @orig_traversal.size
    end

    def part2!
      part1!  # computes the original traversal
      count = 0
      @orig_traversal.keys.each do |(oy, ox)|
        next if oy == @orig_y && ox == @orig_x
        @map[oy][ox] = true
        x = @orig_x
        y = @orig_y
        dy = -1
        dx = 0
        seen = {}
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
      count
    end

  end
end

