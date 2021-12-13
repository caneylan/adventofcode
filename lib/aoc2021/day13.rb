module Aoc2021
  class Day13 < Solution

    def initialize(filename)
      super(filename)
      @points = []  # [ [x, y], ... ]
      @folds = []   # [ [axis, fold_index], ... ]
      input.each do |line|
        case line
        when /^\d+,\d+$/
          @points << line.split(',').map(&:to_i)
        when /^fold along/
          along_s, n = line.split('=')
          @folds << [ along_s == 'fold along x' ? 0 : 1, n.to_i ]
        end
      end
    end

    def do_fold!(fold)
      fold_axis, fold_index = fold
      @points.each do |point|
        if point[fold_axis] > fold_index
          point[fold_axis] = fold_index - (point[fold_axis] - fold_index)
        end
      end
      @points.uniq!
    end

    def part1!
      do_fold!(@folds.first)
      return @points.length
    end

    def part2!
      @folds.each { |fold| do_fold!(fold) }

      column_count = @points.reduce(0) { |max, point| point[0] > max ? point[0] : max } + 1
      row_count = @points.reduce(0) { |max, point| point[1] > max ? point[1] : max } + 1

      grid = Array.new(row_count) { |i| Array.new(column_count, ' ') }
      @points.each do |point|
        x, y = point
        grid[y][x] = '#'
      end
      
      return grid.map { |row| row.join('') }
    end

  end
end
