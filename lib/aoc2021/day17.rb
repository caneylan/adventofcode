module Aoc2021
  class Day17 < Solution

    def initialize(filename)
      super(filename)
      x_0, x_1, y_0, y_1 = input.first.sub(/.*x=/, '').sub(/, y=/, ' ').gsub(/\.\./, ' ').split.map(&:to_i)
      @x_range = Range.new(x_0, x_1)
      @y_range = Range.new(y_0, y_1)
    end

    # v_0=7
    # t=0    1      2         3           4             5                6                 7                 8
    # x=0 => 7 => (7+6) => (7+6+5) => (7+6+5+4) => (7+6+5+4+3) => (7+6+5+4+3+2) => (7+6+5+4+3+2+1) => (7+6+5+4+3+2+1+0)
    def x_at_t(v_0, t)
      t = v_0 if t > v_0
      t * (2 * v_0 + 1 - t) / 2
    end

    # same as x_at_t, but un-bounded
    def y_at_t(v_0, t)
      t * (2 * v_0 + 1 - t) / 2
    end

    def get_possible_hits
      possibilities = []

      # first, loop over all possible initial x velocities (v_x_0), starting at 0 (meaning we fall straight down)
      # and increasing by 1 each loop, for which there is at least one t step where we'd land in the target
      v_x_0 = 0
      loop do
        break if v_x_0 > @x_range.max               # done searching x velocities when we would overshoot at t=1
        next if x_at_t(v_x_0, v_x_0) < @x_range.min # skip an initial x veloctiy that would never reach the target

        # next, loop over all possible time steps, starting at 1 and increasing by 1 each loop,
        # for which this initial x velocity (v_x_0) still lands in the target at time=t
        t = 1
        loop do
          x_t = x_at_t(v_x_0, t)           # where we'd be at t given our initial velocity v_x_0
          next unless x_t >= @x_range.min  # skip if x doesn't hit the target yet at this t
          break if x_t > @x_range.max      # done if x overshoots at this t

          # at this point, we have an initial x velocity (v_x_0) that lands in the target at this t

          # so now we search for initial y velocities that will land in the target at this t, starting with
          # the downward y velocity that would land in the target at t=1 and then increasing by 1 each loop
          # when such y velocities exist, there will be one or more in a group.
          # we're done searching when our initial y velocity at this time ends up above us still
          v_y_0 = @y_range.min    
          v_y_0_max = 0          # track the greatest initial y velocity we've found
          loop do
            y_t = y_at_t(v_y_0, t) # where we'd be at t given our initial velocity v_y_0
            break if y_t > 0       # done when this initial y velocity at this t hasn't fallen down yet
            v_y_0_max = v_y_0 if v_y_0 > v_y_0_max
            possibilities << [v_x_0, v_y_0, t] if @y_range.include?(y_t)
            v_y_0 += 1
          end

          # the largest upward velocity we found is also the downard velocity the probe will have
          # when it comes back down past the initial point. if this would overshoot the target entirely,
          # then we're done searching for target hits for this particular t
          break if v_y_0_max > @y_range.min.abs
        ensure
          t += 1
        end
      ensure
        v_x_0 += 1
      end
      return possibilities
    end

    def part1!
      possibilities = get_possible_hits
      y_max = nil
      possibilities.each do |p|
        0.upto(p[2]) do |t|
          y = y_at_t(p[1], t)
          if y_max.nil? || y > y_max
            y_max = y
          end
        end
      end
      return y_max
    end

    def part2!
      return get_possible_hits.uniq { |p| "#{p[0]},#{p[1]}" }.length
    end

  end
end
