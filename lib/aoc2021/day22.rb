module Aoc2021
  class Day22 < Solution

    # incredibly smart solution taken from https://github.com/ahorner/advent-of-code/blob/main/lib/2021/22.rb
    class Cuboid
      attr_reader :x, :y, :z

      def initialize(x:, y:, z:)
        @x = x
        @y = y
        @z = z
      end

      def size
        @x.size * @y.size * @z.size
      end

      def &(other)
        xint = intersection(x, other.x)
        yint = intersection(y, other.y)
        zint = intersection(z, other.z)

        return nil unless xint && yint && zint

        Cuboid.new(x: xint, y: yint, z: zint)
      end

      private

      def intersection(first, second)
        return nil if first.end < second.begin || second.end < first.begin

        [first.begin, second.begin].max..[first.end, second.end].min
      end
    end

    def unique_cubes(cuboid, overlays)
      overwrites = overlays.filter_map { |overlay| cuboid & overlay }
      overwritten = overwrites.each_index.sum { |i| unique_cubes(overwrites[i], overwrites.drop(i + 1)) }

      cuboid.size - overwritten
    end

    def active_cubes(steps)
      cuboids = steps.map(&:last)
      steps.each_with_index.sum do |(state, cuboid), i|
        next 0 unless state

        unique_cubes(cuboid, cuboids.drop(i + 1))
      end
    end

    def part2!
      steps = []
      input.each do |line|
        action, coords = line.split(' ')
        x_range, y_range, z_range = coords.split(',')
        x_min, x_max = x_range.sub('x=', '').split('..').map(&:to_i)
        y_min, y_max = y_range.sub('y=', '').split('..').map(&:to_i)
        z_min, z_max = z_range.sub('z=', '').split('..').map(&:to_i)
        steps << [ action == 'on', Cuboid.new(x: x_min..x_max, y: y_min..y_max, z: z_min..z_max) ]
      end
      return active_cubes(steps)
    end

    def part1!
      steps = []
      input.each do |line|
        action, coords = line.split(' ')
        x_range, y_range, z_range = coords.split(',')
        x_min, x_max = x_range.sub('x=', '').split('..').map(&:to_i)
        y_min, y_max = y_range.sub('y=', '').split('..').map(&:to_i)
        z_min, z_max = z_range.sub('z=', '').split('..').map(&:to_i)
        steps << [ action == 'on', Cuboid.new(x: [-50, x_min].max..[50, x_max].min, y: [-50, y_min].max..[50, y_max].min, z: [-50, z_min].max..[50, z_max].min) ]
      end
      return active_cubes(steps)
    end

    def part1lazy!
      map = Hash.new { |h0, x| h0[x] = Hash.new { |h1, y| h1[y] = Hash.new } }
      input.each do |line|
        action, coords = line.split(' ')
        x_range, y_range, z_range = coords.split(',')
        x_min, x_max = x_range.sub('x=', '').split('..').map(&:to_i)
        y_min, y_max = y_range.sub('y=', '').split('..').map(&:to_i)
        z_min, z_max = z_range.sub('z=', '').split('..').map(&:to_i)
        [-50, x_min].max.upto([50, x_max].min) do |x|
          [-50, y_min].max.upto([50, y_max].min) do |y|
            [-50, z_min].max.upto([50, z_max].min) do |z|
              if action == 'on'
                map[x][y][z] = true
              else
                map[x][y].delete(z)
              end
						end
					end
				end
      end
      count = 0
      map.each do |x, h1|
        h1.each do |y, h2|
          h2.each do |z, v|
            count += 1 if v
          end
        end
      end
      return count
    end
  end
end
