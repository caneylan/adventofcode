module Aoc2021
  class Day19 < Solution

    attr_reader :scanners

    class PointField

      def initialize(init_points = [], init_offset = [0, 0, 0], init_orientation = 0)
        @orientation = init_orientation
        @points = Array.new(24) { |i| Array.new }
        @offset = init_offset
        @mins = Array.new(24)
        @deltas = Array.new(24)
        if init_points
          init_points.each { |p| self << p }
        end
      end

      def rotate!
        @orientation = (@orientation + 1) % 24
      end
      def orientation
        @orientation
      end
      def orientation=(i)
        @orientation = i
      end
      def points
        @points[@orientation]
      end
      def offset
        @offset
      end
      def x_min
        @mins[@orientation][0]
      end
      def y_min
        @mins[@orientation][1]
      end
      def z_min
        @mins[@orientation][2]
      end

      def <<(point)
        # when we enqueue a point into this field, we keep every possible
        # orientation so that we can easily rotate through them later

        # there is absolutely a smart-person way to compute these
        # but i say these are just 24 little happy trees
        
        p = point.map(&:to_i)
        o = @orientation
        @points[(o +  0) % 24] << [ p[0],  p[1],  p[2]]
        @points[(o +  1) % 24] << [-p[1],  p[0],  p[2]]
        @points[(o +  2) % 24] << [-p[0], -p[1],  p[2]]
        @points[(o +  3) % 24] << [ p[1], -p[0],  p[2]]
        @points[(o +  4) % 24] << [-p[1], -p[0], -p[2]]
        @points[(o +  5) % 24] << [ p[0], -p[1], -p[2]]
        @points[(o +  6) % 24] << [ p[1],  p[0], -p[2]]
        @points[(o +  7) % 24] << [-p[0],  p[1], -p[2]]
        @points[(o +  8) % 24] << [-p[2],  p[1],  p[0]]
        @points[(o +  9) % 24] << [-p[1], -p[2],  p[0]]
        @points[(o + 10) % 24] << [ p[2], -p[1],  p[0]]
        @points[(o + 11) % 24] << [ p[1],  p[2],  p[0]]
        @points[(o + 12) % 24] << [-p[1],  p[2], -p[0]]
        @points[(o + 13) % 24] << [-p[2], -p[1], -p[0]]
        @points[(o + 14) % 24] << [ p[1], -p[2], -p[0]]
        @points[(o + 15) % 24] << [ p[2],  p[1], -p[0]]
        @points[(o + 16) % 24] << [-p[2], -p[0],  p[1]]
        @points[(o + 17) % 24] << [ p[0], -p[2],  p[1]]
        @points[(o + 18) % 24] << [ p[2],  p[0],  p[1]]
        @points[(o + 19) % 24] << [-p[0],  p[2],  p[1]]
        @points[(o + 20) % 24] << [ p[0],  p[2], -p[1]]
        @points[(o + 21) % 24] << [-p[2],  p[0], -p[1]]
        @points[(o + 22) % 24] << [-p[0], -p[2], -p[1]]
        @points[(o + 23) % 24] << [ p[2], -p[0], -p[1]]

        # calculate all the minimums so that we can use them to normalize fields later
        0.upto(23) do |o|
          x_min = y_min = z_min = nil
          @points[o].each do |point|
            x_min = point[0] if x_min.nil? or point[0] < x_min
            y_min = point[1] if y_min.nil? or point[1] < y_min
            z_min = point[2] if z_min.nil? or point[2] < z_min
          end
          @mins[o] = [ x_min, y_min, z_min ]
        end
      end

      # equality operators used by set comparisons/intersections
      def ==(other)
        eql?(other)
      end
      def eql?(other)
        points.length == other.points.length && (points & other.points).length == points.length
      end

      # maps the squared distance from each point to every other point
      def deltas
        @deltas[@orientation] ||= points.map do |p_a|
                                    points.map do |p_b|
                                      (p_a[0] - p_b[0]) * (p_a[0] - p_b[0]) \
                                      + (p_a[1] - p_b[1]) * (p_a[1] - p_b[1]) \
                                      + (p_a[2] - p_b[2]) * (p_a[2] - p_b[2])
                                    end
                                  end
      end

      def remove_offset
        PointField.new(points.map { |p| [ p[0] - offset[0], p[1] - offset[1], p[2] - offset[2] ] }, [0,0,0], orientation)
      end
      def normalize
        PointField.new(points.map { |p| [ p[0] - x_min, p[1] - y_min, p[2] - z_min ] }, [-x_min, -y_min, -z_min], orientation)
      end

      def normalize_combinations(n)
        combinations(n).map(&:normalize)
      end
      def combinations(n)
        points.combination(n).to_a.map { |combo| PointField.new(combo, offset, orientation) }
      end

      def intersect_combo_slow(other, n)
        # the location of common points is different between two fields, but if you subtract the min-coordinate
        #   from every point, the result will be the same set of points (indicating a match)
        # however, we currently have >= n potential matching points, so we will generate every possible
        #   combination of 'n' points that these fields can produce, and find the combinations that intersect fully
        # generating every possible combination of 'n' points is slow, however we entered this method after narrowing
        #   the possible points close to 'n', so there won't be many actual combinations
        my_combos = normalize_combinations(n)
        24.times do |i|
          other_combos = other.normalize_combinations(n)

          match = my_combos.intersection(other_combos).first
          next if match.nil?

          my_combo_match_index = my_combos.index(match)
          other_combo_match_index = other_combos.index(match)

          # we found an orientation of other that matches us exatly
          # return both PointFields of matching points, without the normalization offset
          return [
            my_combos[my_combo_match_index].remove_offset,
            other_combos[other_combo_match_index].remove_offset,
          ]
        ensure
          # this orientation didn't match; try the next one
          other.rotate!
        end
        return nil  # no match
      end

      def intersect(other, n)
        # to quickly determine whether or not this point field will match the other one, 
        #   we compare the square distances between both field's points.
        # regardless of the current orientation of the field observer, the relative distances between
        #   points will always be the same.
        my_deltas = deltas
        other_deltas = other.deltas

        pairs = []
        my_deltas.each_with_index do |my_delta, i|
          other_deltas.each_with_index do |other_delta, j|
            # the point at index i in this field has at least 'n' relative distances
            # that match the point at index j in the other field
            if (my_delta & other_delta).length >= n
              pairs << [i, j]
            end
          end
        end

        return unless pairs.length >= n

        # ok, we've found >= n points that cluster to each other in the same way in both fields
        # so these two fields have a matching orientation and share at least n common points
        
        # map down to the potential matching points
        my_potential_points = PointField.new(pairs.map { |p| points[p[0]] }.uniq)
        other_potential_points = PointField.new(pairs.map { |p| other.points[p[1]] }.uniq)

        # and step into the slow intersection method that uses combinations
        return my_potential_points.intersect_combo_slow(other_potential_points, n)
      end

      def to_s
        "PointField[#{@orientation}]<#{offset.inspect}>{#{points.sort.inspect}}"
      end
      def inspect
        to_s
      end
    end

    def initialize(filename)
      super(filename)
      @scanners = []
      input.each do |line|
        case line
        when /-- scanner \d+ ---/
          @scanners << PointField.new
        when /,/
          x, y, z = line.split(',')
          @scanners.last << [x, y, z || 0]
        end
      end
    end

    def normalize_scanners
      # wonky scanners
      scanner_map = Hash[@scanners.each_with_index.map { |s, i| [i, s] }]

      # scanners aligned to scanner 0
      normalized = [ scanner_map.delete(0) ]

      loop do
        normalized.each do |normal|
          scanner_map.keys.each do |i|
            other = scanner_map[i]
            match = normal.intersect(other, 12)
            # an aligned scanner matches a wonky scanner
            if match
              # remove it from the work queue, normalize it, and save it
              scanner_map.delete(i)
              x_diff = match[0].points.first[0] - match[1].points.first[0]
              y_diff = match[0].points.first[1] - match[1].points.first[1]
              z_diff = match[0].points.first[2] - match[1].points.first[2]
              other.orientation = match[1].orientation
              normalized << PointField.new(other.points.map { |p| [p[0] + x_diff, p[1] + y_diff, p[2] + z_diff] }, [x_diff, y_diff, z_diff])
            end
          end
          break if scanner_map.empty?
        end
        break if scanner_map.empty?
      end
      return normalized
    end

    def part1!
      return normalize_scanners.map { |s| s.points.map { |p| "#{p[0]},#{p[1]},#{p[2]}" } }.flatten.uniq.length
    end

    def part2!
      ns = normalize_scanners
      max = nil
      ns.each do |a|
        ns.each do |b|
          distance = (a.offset[0] - b.offset[0]).abs + (a.offset[1] - b.offset[1]).abs + (a.offset[2] - b.offset[2]).abs
          if max.nil? || distance > max
            max = distance
          end
        end
      end
      return max
    end

  end
end
