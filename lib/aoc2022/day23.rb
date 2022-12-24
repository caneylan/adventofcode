
module Aoc2022
  class Day23 < Solution

    def parse_input
      @elf_map = Hash.new { |h, y| h[y] = Hash.new }
      input.each_with_index do |line, y|
        line.chars.each_with_index { |c, x| @elf_map[y][x] = true if c == '#' }
      end
      @rota = [ 
        [ [-1,-1], [0, -1], [1, -1] ],  # north
        [ [-1, 1], [0, 1], [1, 1] ],    # south
        [ [-1, -1], [-1, 0], [-1, 1] ], # west
        [ [1, -1], [1, 0], [1, 1] ],    # east
      ]
    end

    def move_check(x, y, d)
      is_blocked = !! d.find { |(dx, dy)| @elf_map.fetch(y + dy, {}).has_key?(x + dx)}
      return nil if is_blocked
      return [x + d[1][0], y + d[1][1]]
    end

    def elf_shuffle!
      new_elf_map = Hash.new { |h, y| h[y] = Hash.new }
      moved = 0
      @elf_map.each_key do |y|
        @elf_map[y].each_key do |x|
          open_dirs = @rota.filter_map { |d| move_check(x, y, d) }
          new_elf_map[y][x] = true and next if open_dirs.size == 4 || open_dirs.empty?
          new_x, new_y = open_dirs.first
          if new_elf_map[new_y].has_key?(new_x)
            if new_elf_map[new_y][new_x].is_a?(Array)
              new_elf_map[new_elf_map[new_y][new_x][1]][new_elf_map[new_y][new_x][0]] = true # unwind the first elf here
              new_elf_map[new_y][new_x] = false                                              # mark offlimits
              new_elf_map[y][x] = true                                                       # place elf where it was
              moved -= 1
            end
          else
            new_elf_map[new_y][new_x] = [x, y]                                               # remember first elf here
            moved += 1
          end
        end
      end
      new_elf_map.each_key do |y|
        new_elf_map[y].each_key do |x|
          if new_elf_map[y][x]
            new_elf_map[y][x] = true
          else
            new_elf_map[y].delete(x)
          end
        end
      end
      @elf_map = new_elf_map
      @rota = @rota[1..-1] + [@rota[0]]
      moved > 0
    end

    def part1!
      10.times { elf_shuffle! }
      y_min, y_max = @elf_map.keys.minmax
      x_min, x_max = @elf_map.values.map { |h| h.keys }.flatten.minmax
      count = 0
      y_min.upto(y_max) do |y|
        x_min.upto(x_max) do |x|
          count += 1 unless @elf_map[y][x]
        end
      end
      count
    end

    def part2!
      i = 1
      i += 1 while elf_shuffle!
      i
    end

  end
end

