module Aoc2021
  class Day22 < Solution

    require_relative '../cuboid.rb'

    # an incredibly smart solution exists here: https://github.com/ahorner/advent-of-code/blob/main/lib/2021/22.rb
    # below is my own re-attempt a year later, having long forgotten what the above did

    def initialize(filename)
      super(filename)
      @steps = []
      input.each do |line|
        action, coords = line.split(' ')
        x_range, y_range, z_range = coords.split(',')
        x_min, x_max = x_range.sub('x=', '').split('..').map(&:to_i)
        y_min, y_max = y_range.sub('y=', '').split('..').map(&:to_i)
        z_min, z_max = z_range.sub('z=', '').split('..').map(&:to_i)
        @steps << [ action == 'on', x_min, x_max, y_min, y_max, z_min, z_max ]
      end
    end

    def active_cubes(limit = nil)
      cube_steps = @steps.map do |step|
                     [
                       step[0],
                       Cuboid.new([
                         limit ? [limit.min, step[1]].max..[limit.max, step[2]].min : step[1]..step[2],
                         limit ? [limit.min, step[3]].max..[limit.max, step[4]].min : step[3]..step[4],
                         limit ? [limit.min, step[5]].max..[limit.max, step[6]].min : step[5]..step[6],
                       ])
                     ]
                   end.select { |c| c[1].size > 0 }

      lil_cubes = [ cube_steps.shift[1] ]  # assuming the first cuboid is an "on"
      until cube_steps.empty?
        cube_step = cube_steps.shift
        action = cube_step[0]
        cube = cube_step[1]
        if action                             # action:true means we're turning coords on
          overlaps = false                    # we only add this cube to lil_cubes if it doesn't intersect
          lil_cubes.each do |lil_cube|        #   with any existing lil_cube
            diff = cube - lil_cube            # if a lil_cube overlaps this cube, then we enqueue the
            if diff                           #   parts of cube that don't overlap for future processing
              diff.each { |c| cube_steps.unshift([action, c]) }
              overlaps = true
              break
            end
          end
          lil_cubes << cube unless overlaps   # if we get here without an overlap, then it's a lil_cube
        else
          lil_cubes_new = []                  # action:false means we're turning existing coords off
          lil_cubes.each do |lil_cube|        # so walk through the lil_cubes and discard any parts
            diff = lil_cube - cube            #   of a lil_cube that overlap with this "off" cube
            if diff                           # if there's no overlap between a lil_cube and this
              lil_cubes_new += diff           #   "off" cube, then we just keep it
            else
              lil_cubes_new << lil_cube
            end
          end
          lil_cubes = lil_cubes_new
        end
      end

      return lil_cubes.map { |c| c.size }.reduce(&:+)
    end

    def part1!
      return active_cubes(-50..50)
    end

    def part2!
      return active_cubes
    end

  end
end
