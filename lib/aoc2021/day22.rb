module Aoc2021
  class Day22 < Solution

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
                       Cuboid.new(
                         limit ? [limit.min, step[1]].max..[limit.max, step[2]].min : step[1]..step[2],
                         limit ? [limit.min, step[3]].max..[limit.max, step[4]].min : step[3]..step[4],
                         limit ? [limit.min, step[5]].max..[limit.max, step[6]].min : step[5]..step[6],
                       )
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

    class Cuboid

      attr_reader :x, :y, :z
      
      def initialize(x, y, z)
        @x = x
        @y = y
        @z = z
      end

      def size
        @x.size * @y.size * @z.size
      end

      # if self and other intersect, then return the cubes of self
      # that remain with other taken away
      def -(other)
        return nil unless x.min <= other.x.max && x.max >= other.x.min &&
                          y.min <= other.y.max && y.max >= other.y.min &&
                          z.min <= other.z.max && z.max >= other.z.min
        new_cubes = []

        # starting dimension doesn't matter
        # we only need the intersection ranges for the first two dimensions we cut along
        z_intersect = [z.min, other.z.min].max..[z.max, other.z.max].min
        y_intersect = [y.min, other.y.min].max..[y.max, other.y.max].min
       
        # chop off the bit of self that's above and/or below other in the z-axis
        if z.max > other.z.max
          new_cubes << Cuboid.new(x, y, (other.z.max + 1)..z.max)
        end
        if z.min < other.z.min
          new_cubes << Cuboid.new(x, y, z.min..(other.z.min - 1))
        end

        # chop off the remaining bit of self that's above and/or below other in the y-axis
        if y.max > other.y.max
          new_cubes << Cuboid.new(x, (other.y.max + 1)..y.max, z_intersect)
        end
        if y.min < other.y.min
          new_cubes << Cuboid.new(x, y.min..(other.y.min - 1), z_intersect)
        end

        # chop off what's left of self that's above and/or below other in the x-axis
        if x.max > other.x.max
          new_cubes << Cuboid.new((other.x.max + 1)..x.max, y_intersect, z_intersect)
        end
        if x.min < other.x.min
          new_cubes << Cuboid.new(x.min..(other.x.min - 1), y_intersect, z_intersect)
        end

        return new_cubes
      end

      def to_s
        "cubeoid(#{size})[x=#{@x}, y=#{@y}, z=#{@z}]"
      end

    end

  end
end
