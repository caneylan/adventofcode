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
          overlaps = false                    # we only add this cube to lil_cubes if it
          lil_cubes.each do |lil_cube|        # doesn't intersect with any existing lil_cube
            diff = cube - lil_cube            # if a lil_cube overlaps this cube, then we
            if diff                           # enqueue the parts of cube that don't overlap
              diff.each { |c| cube_steps.unshift([action, c]) } # for future processing
              overlaps = true
              break
            end
          end
          lil_cubes << cube unless overlaps   # if we get here without an overlap, then it's a lil_cube
        else
          lil_cubes_new = []                  # action:false means we're turning existing
          lil_cubes.each do |lil_cube|        # coords off.  so walk through the lil_cubes
            diff = lil_cube - cube            # and discard any parts of a lil_cube that
            if diff                           # overlap with this "off" cube
              lil_cubes_new += diff           # if there's no overlap between a lil_cube and this
            else                              # "off" cube, then we just keep it
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
      # with other taken away
      def -(other)
        return nil unless z.min <= other.z.max && z.max >= other.z.min &&
                          y.min <= other.y.max && y.max >= other.y.min && 
                          x.min <= other.x.max && x.max >= other.x.min
        new_cubes = []

        # starting dimension doesn't matter.
        # first, chop off the bits of self that are outside of other in the z-axis
        if z.min >= other.z.min && z.max > other.z.max
          new_cubes << Cuboid.new(x, y, (other.z.max + 1)..z.max)
          remaining_z = z.min..other.z.max
        elsif z.min >= other.z.min && z.max <= other.z.max
          remaining_z = z.min..z.max
        elsif z.min < other.z.min && z.max <= other.z.max
          new_cubes << Cuboid.new(x, y, z.min..(other.z.min - 1))
          remaining_z = other.z.min..z.max
        else
          new_cubes << Cuboid.new(x, y, (other.z.max + 1)..z.max)
          new_cubes << Cuboid.new(x, y, z.min..(other.z.min - 1))
          remaining_z = other.z.min..other.z.max
        end

        # from here, what's left of the z-axis completely overlaps with the body of other
        # next, chop off the bits of self that are outside of other in the y-axis
        if y.min >= other.y.min && y.max > other.y.max
          new_cubes << Cuboid.new(x, (other.y.max + 1)..y.max, remaining_z)
          remaining_y = y.min..other.y.max
        elsif y.min >= other.y.min && y.max <= other.y.max
          remaining_y = y.min..y.max
        elsif y.min < other.y.min && y.max <= other.y.max
          new_cubes << Cuboid.new(x, y.min..(other.y.min - 1), remaining_z)
          remaining_y = other.y.min..y.max
        else
          new_cubes << Cuboid.new(x, (other.y.max + 1)..y.max, remaining_z)
          new_cubes << Cuboid.new(x, y.min..(other.y.min - 1), remaining_z)
          remaining_y = other.y.min..other.y.max
        end

        # finally, cut off the remaining bits of self that are out in the z-axis
        if x.min >= other.x.min && x.max > other.x.max
          new_cubes << Cuboid.new((other.x.max + 1)..x.max, remaining_y, remaining_z)
        elsif x.min >= other.x.min && x.max <= other.x.max
          # don't care
        elsif x.min < other.x.min && x.max <= other.x.max
          new_cubes << Cuboid.new(x.min..(other.x.min - 1), remaining_y, remaining_z)
        else
          new_cubes << Cuboid.new((other.x.max + 1)..x.max, remaining_y, remaining_z)
          new_cubes << Cuboid.new(x.min..(other.x.min - 1), remaining_y, remaining_z)
        end

        return new_cubes
      end

      def &(other)
        x_int = intersection(x, other.x) or return nil
        y_int = intersection(y, other.y) or return nil
        z_int = intersection(z, other.z) or return nil
        Cuboid.new(x_int, y_int, z_int)
      end

      def intersection(a, b)
        if a.min <= b.max && a.max >= b.min
          [a.min, other.min].max..[a.max, b.max].min
        end
      end

      def to_s
        "cubeoid(#{size})[x=#{@x}, y=#{@y}, z=#{@z}]"
      end

    end

  end
end
