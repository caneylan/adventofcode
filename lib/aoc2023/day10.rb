
module Aoc2023
  class Day10 < Solution

    class Pipe
      attr_reader :north, :south, :east, :west
      attr_accessor :cool
      def initialize(c)
        @north = @south = @east = @west = @cool = false
        case c
        when '|'
          @north = @south = true
        when '-'
          @east = @west = true
        when 'L'
          @north = @east = true
        when 'J'
          @north = @west = true
        when '7'
          @south = @west = true
        when 'F'
          @south = @east = true
        end
      end

      def is_cool?
        @cool
      end

      def self.whos_that_pokemon(north, south, east, west)
        if north.south && south.north
          Pipe.new('|')
        elsif east.west && west.east
          Pipe.new('-')
        elsif north.south && east.west
          Pipe.new('L')
        elsif north.south && west.east
          Pipe.new('J')
        elsif south.north && west.east
          Pipe.new('7')
        elsif south.north && east.west
          Pipe.new('F')
        else
          raise 'panic'
        end
      end
    end

    def parse_input
      @graph = []
      @s_x = @s_y = nil
      @input.each_with_index do |line, y|
        row = []
        line.chars.each_with_index do |c, x|
          row << Pipe.new(c)
          if c == 'S'
            @s_x = x
            @s_y = y
          end
        end
        @graph << row
      end
      @graph[@s_y][@s_x] = Pipe.whos_that_pokemon(@graph[@s_y-1][@s_x], @graph[@s_y+1][@s_x], @graph[@s_y][@s_x+1], @graph[@s_y][@s_x-1])
    end

    def walk_pipe
      x = @s_x
      y = @s_y
      from = nil
      n = 0
      loop do
        pipe = @graph[y][x]
        pipe.cool = true
        if pipe.north && from != :north
          y = y - 1
          from = :south
        elsif pipe.south && from != :south
          y = y + 1
          from = :north
        elsif pipe.east && from != :east
          x = x + 1
          from = :west
        elsif pipe.west && from != :west
          x = x - 1
          from = :east
        end
        n = n + 1
        break if x == @s_x && y == @s_y
      end
      return n
    end

    def part1!
      walk_pipe / 2
    end

    def part2!
      walk_pipe

      # delete every node that's not part of the pipe
      @graph.each_with_index do |row, y|
        @graph[y] = row.map { |p| p.is_cool? ? p : nil }
      end

      # make the graph wider
      new_graph = []
      @graph.each do |row|
        new_row = [ nil ]
        row.each do |pipe|
          if pipe.nil?
            new_row << nil
            new_row << nil
          elsif pipe.east && pipe.west
            new_row << pipe.clone
            new_row << pipe.clone
          elsif pipe.east
            new_row << pipe.clone
            new_row << Pipe.new('-')
          else
            new_row << pipe.clone
            new_row << nil
          end
        end
        new_graph << new_row
      end
      @graph = new_graph

      # make the graph taller
      new_graph = []
      new_graph << @graph[0].map { |x| nil }
      @graph.each do |row|
        new_row_1 = []
        new_row_2 = []
        row.each do |pipe|
          if pipe.nil?
            new_row_1 << nil
            new_row_2 << nil
          elsif pipe.north && pipe.south
            new_row_1 << pipe.clone
            new_row_2 << pipe.clone
          elsif pipe.south
            new_row_1 << pipe.clone
            new_row_2 << Pipe.new('|')
          else
            new_row_1 << pipe.clone
            new_row_2 << nil
          end
        end
        new_graph << new_row_1
        new_graph << new_row_2
      end
      @graph = new_graph

      # flood fill the outside to a value that's not nil
      search_q = [ [0,0] ]
      until search_q.empty?
        y, x = search_q.pop
        @graph[y][x] = '*'
        search_q << [y-1, x] if y > 0 && @graph[y-1][x].nil?
        search_q << [y+1, x] if y < @graph.length - 1 && @graph[y+1][x].nil?
        search_q << [y, x-1] if x > 0 && @graph[y][x-1].nil?
        search_q << [y, x+1] if x < @graph[0].length - 1 && @graph[y][x+1].nil?
      end

      # un-make wider
      @graph = @graph.map { |row| row[1..-1].each_slice(2).map { |pipe, toss| pipe } }

      # un-make taller
      new_graph = []
      new_graph += @graph[1..-1].each_slice(2).map { |row, toss| row }
      @graph = new_graph

      # whatever is still nil was unfound by the flood and therefore enclosed by the pipe
      @graph.sum { |row| row.count(nil) }
    end

  end
end

