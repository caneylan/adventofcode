module Aoc2021
  class Day11 < Solution

    class Octopus
      attr_accessor :luminosity, :best_friends
      def initialize(luminosity)
        @luminosity = luminosity.to_i
        @best_friends = []
      end
      def brighten!
        @luminosity += 1
      end
      def just_gave_hugs?
        @luminosity == 0
      end
      def best_friend_hugs!
        if @luminosity > 9
          @best_friends.each { |o| o.brighten! unless o.just_gave_hugs? }
          @luminosity = 0
          return true
        end
        return false
      end
    end

    def initialize(filename)
      super(filename)
      @grid = input.map { |line| line.chars.map { |v| Octopus.new(v) } }
      @grid_size = @grid.length * @grid.first.length
      0.upto(@grid.length - 1) do |y|
        0.upto(@grid[y].length - 1) do |x|
          @grid[y][x].best_friends << @grid[y - 1][x - 1] if y > 0 && x > 0
          @grid[y][x].best_friends << @grid[y - 1][x    ] if y > 0
          @grid[y][x].best_friends << @grid[y - 1][x + 1] if y > 0 && x < @grid[y].length - 1
          @grid[y][x].best_friends << @grid[y    ][x - 1] if x > 0
          @grid[y][x].best_friends << @grid[y    ][x + 1] if x < @grid[y].length - 1
          @grid[y][x].best_friends << @grid[y + 1][x - 1] if y < @grid.length - 1 && x > 0
          @grid[y][x].best_friends << @grid[y + 1][x    ] if y < @grid.length - 1
          @grid[y][x].best_friends << @grid[y + 1][x + 1] if y < @grid.length - 1 && x < @grid[y].length - 1
        end
      end
    end

    def grid
      return @grid.map { |row| row.map { |o| o.luminosity } }
    end

    def each_octopus
      @grid.each do |row|
        row.each do |octopus|
          yield(octopus)
        end
      end
    end

    def select_octopi
      matched = []
      each_octopus do |octopus|
        matched << octopus if yield(octopus)
      end
      return matched
    end
    
    def step!
      each_octopus { |o| o.brighten! }
      loop do
        break if select_octopi { |o| o.best_friend_hugs! }.length == 0
      end
      return select_octopi { |o| o.just_gave_hugs? }.length
    end

    def part1!(n_steps)
      return n_steps.times.inject(0) { |sum, n| sum += step! }
    end

    def part2!
      i = 0
      while i += 1 do
        return i if step! == @grid_size
      end  
    end
  end

end
