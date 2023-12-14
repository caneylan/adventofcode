
module Aoc2023
  class Day14 < Solution

    def parse_input
      @map = input.map { |line| line.chars }
      @y_max = @map.length - 1
      @x_max = @map[0].length - 1
    end

    def tilt_up_down!(dir)
      (dir > 0 ? (@y_max).downto(0) : 0.upto(@y_max)).each do |y|
        0.upto(@x_max) do |x|
          next unless @map[y][x] == 'O'
          @map[y][x] = '.'
          new_y = y
          loop do
            break if new_y < 0 || new_y > @y_max || @map[new_y][x] != '.'
            new_y += dir
          end
          @map[new_y - dir][x] = 'O'
        end
      end
    end

    def tilt_left_right!(dir)
      0.upto(@y_max) do |y|
        (dir > 0 ? (@x_max).downto(0) : 0.upto(@x_max)).each do |x|
          next unless @map[y][x] == 'O'
          @map[y][x] = '.'
          new_x = x
          loop do
            break if new_x < 0 || new_x > @x_max || @map[y][new_x] != '.'
            new_x += dir
          end
          @map[y][new_x - dir] = 'O'
        end
      end
    end

    def tilt_north!
      tilt_up_down!(-1)
    end
    def tilt_south!
      tilt_up_down!(1)
    end
    def tilt_east!
      tilt_left_right!(1)
    end
    def tilt_west!
      tilt_left_right!(-1)
    end
    def tilt_cycle!
      tilt_north!
      tilt_west!
      tilt_south!
      tilt_east!
      @map.inspect
    end

    def north_load
      @map.each_with_index.map do |row, y|
        row.map do |c|
          if c == 'O'
            @map.length - y
          else
            0
          end
        end.sum
      end.sum
    end

    def part1!
      tilt_north!
      north_load
    end

    def part2!
      cache = { @map_s => 0 }
      n = nil
      s = nil
      1000000000.times do |i|
        s = tilt_cycle!
        if cache[s]
          n = i
          break
        else
          cache[s] = i
        end
      end
      repeat_start = cache[s]
      n_repeat = n - repeat_start
      n_left = (1000000000 - repeat_start) % n_repeat - 1

      n_left.times do
        tilt_cycle!
      end
      north_load
    end

  end
end

