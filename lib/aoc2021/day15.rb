module Aoc2021
  class Day15 < Solution

    class Node
      attr_accessor :value, :neighbors, :distance, :prev
      def initialize(value)
        @value = value.to_i
        @neighbors = []
        @distance = nil
        @prev = nil
      end
      def to_s
        "#{@x},#{@y}=#{@value.to_s}"
      end
      def inspect
        "#{@x},#{@y}=#{@value.to_s}"
      end
    end

    def initialize(filename, expand_input = false)
      super(filename)
      grid = input.map { |line| line.chars.map { |v| v.to_i } }
      if expand_input
        # copy right
        grid.each_with_index do |row, y|
          grid[y] += grid[y].map { |v| v + 1 > 9 ? v + 1 - 9 : v + 1 } + \
                     grid[y].map { |v| v + 2 > 9 ? v + 2 - 9 : v + 2 } + \
                     grid[y].map { |v| v + 3 > 9 ? v + 3 - 9 : v + 3 } + \
                     grid[y].map { |v| v + 4 > 9 ? v + 4 - 9 : v + 4}
        end
        # copy down
        og_grid_size = grid.length
        1.upto(4) do |i|
          0.upto(og_grid_size - 1) do |y|
            grid << grid[y].map { |v| v + i > 9 ? v + i - 9 : v + i }
          end
        end
      end
      @grid = grid.map { |row| row.map { |v| Node.new(v) } }
      0.upto(@grid.length - 1) do |y|
        0.upto(@grid[y].length - 1) do |x|
          @grid[y][x].neighbors << @grid[y - 1][x    ] if y > 0
          @grid[y][x].neighbors << @grid[y    ][x - 1] if x > 0
          @grid[y][x].neighbors << @grid[y    ][x + 1] if x < @grid[y].length - 1
          @grid[y][x].neighbors << @grid[y + 1][x    ] if y < @grid.length - 1
        end
      end
      @start_node = @grid[0][0]
      @start_node.distance = 0
      @target_node = @grid[@grid.length - 1][@grid.first.length - 1]
    end

    def do_search!
      queue = [ @start_node ]
      loop do
        min_node = queue.pop
        break if min_node == @target_node

        min_node.neighbors.each do |n|
          new_dist = min_node.distance + n.value
          if n.distance.nil?
            i = queue.bsearch_index { |x| x.distance <= new_dist } || queue.length
            queue.insert(i, n)
            n.distance = new_dist
            n.prev = min_node
          elsif new_dist < n.distance
            n.distance = new_dist
            n.prev = min_node
          end
        end
      end
      return @target_node.distance
    end

    def part1!(print_solution = false)
      do_search!
      if print_solution
        n = @target_node
        while n != @start_node
          p = n.prev
          n.prev = true    # overload this as a true-path marker
          n = p
        end
        @grid.each do |row|
          puts row.map { |n| n.prev == true ? '#' : '.' }.join('')
        end
      end
      return @target_node.distance
    end

    def part2!(print_solution = false)
      part1!(print_solution)
    end

  end
end
