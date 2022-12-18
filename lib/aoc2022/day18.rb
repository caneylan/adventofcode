
module Aoc2022
  class Day18 < Solution

    def parse_input
      @cubes = input.map { |line| line.split(',').map(&:to_i) }
      @x_min, @x_max = @cubes.map { |c| c[0] }.minmax
      @y_min, @y_max = @cubes.map { |c| c[1] }.minmax
      @z_min, @z_max = @cubes.map { |c| c[2] }.minmax
    end

    def surface_area(cubes)
      cubes.map do |cube|
        sides = 6
        cubes.each do |other|
          next if cube == other
          sides -= 1 if cube[0] == other[0] && cube[1] == other[1] && (cube[2] - other[2]).abs == 1
          sides -= 1 if cube[1] == other[1] && cube[2] == other[2] && (cube[0] - other[0]).abs == 1
          sides -= 1 if cube[2] == other[2] && cube[0] == other[0] && (cube[1] - other[1]).abs == 1
        end
        sides
      end.sum
    end

    def part1!
      surface_area(@cubes)
    end

    def part2!
      seen = Hash[@cubes.map { |c| [c, true] }]
      outers = []
      queue = [ [@x_min - 1, @y_min - 1, @z_min - 1] ]
      until queue.empty?
        cube = queue.pop
        outers << cube
        seen[cube] = true
        queue << [cube[0] - 1, cube[1], cube[2]] unless cube[0] - 1 < @x_min - 1 || seen[[cube[0] - 1, cube[1], cube[2]]] 
        queue << [cube[0] + 1, cube[1], cube[2]] unless cube[0] + 1 > @x_max + 1 || seen[[cube[0] + 1, cube[1], cube[2]]]
        queue << [cube[0], cube[1] - 1, cube[2]] unless cube[1] - 1 < @y_min - 1 || seen[[cube[0], cube[1] - 1, cube[2]]]
        queue << [cube[0], cube[1] + 1, cube[2]] unless cube[1] + 1 > @y_max + 1 || seen[[cube[0], cube[1] + 1, cube[2]]]
        queue << [cube[0], cube[1], cube[2] - 1] unless cube[2] - 1 < @z_min - 1 || seen[[cube[0], cube[1], cube[2] - 1]]
        queue << [cube[0], cube[1], cube[2] + 1] unless cube[2] + 1 > @z_max + 1 || seen[[cube[0], cube[1], cube[2] + 1]]
      end
      outer_area = surface_area(outers.uniq)
      x_width = (@x_max + 2) - (@x_min - 1)
      y_width = (@y_max + 2) - (@y_min - 1)
      z_width = (@z_max + 2) - (@z_min - 1)
      outer_area - (2*x_width*y_width + 2*x_width*z_width + 2*y_width*z_width)
    end

  end
end

