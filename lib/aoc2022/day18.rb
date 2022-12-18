
module Aoc2022
  class Day18 < Solution

    def parse_input
      @cubes = input.map { |line| line.split(',').map(&:to_i) }
      @x_min, @x_max = @cubes.map { |c| c[0] }.minmax
      @y_min, @y_max = @cubes.map { |c| c[1] }.minmax
      @z_min, @z_max = @cubes.map { |c| c[2] }.minmax
    end

    def part1!
      @cubes.map do |cube|
        sides = 6
        @cubes.each do |other|
          next if cube == other
          sides -= 1 if cube[0] == other[0] && cube[1] == other[1] && (cube[2] - other[2]).abs == 1
          sides -= 1 if cube[1] == other[1] && cube[2] == other[2] && (cube[0] - other[0]).abs == 1
          sides -= 1 if cube[2] == other[2] && cube[0] == other[0] && (cube[1] - other[1]).abs == 1
        end
        sides
      end.sum
    end

    def part2!
      ch = Hash[@cubes.map { |c| [c, true] }]
      seen = Hash[@cubes.map { |c| [c, true] }]
      queue = [ [@x_min - 1, @y_min - 1, @z_min - 1] ]
      total = 0
      until queue.empty?
        cube = queue.pop
        next if seen[cube]
        seen[cube] = true
        total += 1 if ch[[cube[0] - 1, cube[1], cube[2]]]
        total += 1 if ch[[cube[0] + 1, cube[1], cube[2]]]
        total += 1 if ch[[cube[0], cube[1] - 1, cube[2]]]
        total += 1 if ch[[cube[0], cube[1] + 1, cube[2]]]
        total += 1 if ch[[cube[0], cube[1], cube[2] - 1]]
        total += 1 if ch[[cube[0], cube[1], cube[2] + 1]]
        queue << [cube[0] - 1, cube[1], cube[2]] unless cube[0] - 1 < @x_min - 1 || seen[[cube[0] - 1, cube[1], cube[2]]]
        queue << [cube[0] + 1, cube[1], cube[2]] unless cube[0] + 1 > @x_max + 1 || seen[[cube[0] + 1, cube[1], cube[2]]]
        queue << [cube[0], cube[1] - 1, cube[2]] unless cube[1] - 1 < @y_min - 1 || seen[[cube[0], cube[1] - 1, cube[2]]]
        queue << [cube[0], cube[1] + 1, cube[2]] unless cube[1] + 1 > @y_max + 1 || seen[[cube[0], cube[1] + 1, cube[2]]]
        queue << [cube[0], cube[1], cube[2] - 1] unless cube[2] - 1 < @z_min - 1 || seen[[cube[0], cube[1], cube[2] - 1]]
        queue << [cube[0], cube[1], cube[2] + 1] unless cube[2] + 1 > @z_max + 1 || seen[[cube[0], cube[1], cube[2] + 1]]
      end
      total
    end

  end
end

