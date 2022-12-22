
module Aoc2022
  class Day22 < Solution

    class MapPoint
      attr_reader :value
      def initialize(value)
        @value = value
      end
      def is_blocked?
        @value == '#'
      end
      def to_s
        @value.to_s
      end
      def inspect
        to_s
      end
    end

    class Map

      def initialize(width, height)
        @width = width
        @height = height
        @map = Array.new(@height) { |row| Array.new(@width) }
        @frozen = false
      end

      def point(x, y)
        raise ArgumentError.new "x=#{x} out of bounds (0..#{@width - 1})" if x < 0 || x >= @width
        raise ArgumentError.new "y=#{y} out of bounds (0..#{@height - 1})" if y < 0 || y >= @height
        @map[y][x]
      end

      def add_point(x, y, value)
        raise RuntimeError.new "cannot add point to frozen map" if @frozen
        raise ArgumentError.new "x=#{x} out of bounds (0..#{@width - 1})" if x < 0 || x >= @width
        raise ArgumentError.new "y=#{y} out of bounds (0..#{@height - 1})" if y < 0 || y >= @height
        raise ArgumentError.new "cannot add nil to map" if value.nil?
        @map[y][x] = MapPoint.new(value)
      end

      def freeze(as_cube = false)
        @frozen = true
        @wraps = Array.new(@height) { |row| row = Array.new(@width) { |col| col = Hash.new } }
        if as_cube
          compute_cube_wraps
        else  
          compute_flat_wraps
        end
      end
      
      def compute_flat_wraps
        0.upto(@height - 1) do |y|
          0.upto(@width - 1) do |x|
            if y - 1 < 0 || @map[y - 1][x].nil?
              @wraps[y][x][:up] = [ x, @map.map { |row| row[x] }.rindex { |p| !p.nil? }, :up ]
            end
            if y + 1 >= @height || @map[y + 1][x].nil?
              @wraps[y][x][:down] = [ x, @map.map { |row| row[x] }.index { |p| !p.nil? }, :down ]
            end
            if x - 1 < 0 || @map[y][x - 1].nil?
              @wraps[y][x][:left] = [ @map[y].rindex { |p| !p.nil? }, y, :left ]
            end
            if x + 1 >= @width || @map[y][x + 1].nil?
              @wraps[y][x][:right] = [ @map[y].index { |p| !p.nil? }, y, :right ]
            end
          end
        end
      end

      # real
      # shape
      #   2 1
      #   3
      # 5 4
      # 6
      # this entire solutoin is generic except for this function, which i hard-coded to the
      # problem input's shape.
      def compute_cube_wraps
        @wraps = Array.new(@height) { |row| row = Array.new(@width) { |col| col = Hash.new } }
        raise NotImplementedError.new "i only hard-coded the real input" unless @height == 200 && @width == 150
        0.upto(@height - 1) do |y|
          0.upto(@width - 1) do |x|
            next if @map[y][x].nil?
            # 1, up
            if x >= 100 && x <= 149 && y == 0
              @wraps[y][x][:up] = [ x - 100, 199, :up ]
            end

            # 1, right
            if x == 149 && y >= 0 && y <= 49
              @wraps[y][x][:right] = [ 99, 149 - y, :left ]
            end

            # 1, down
            if x >= 100 && x <= 149 && y == 49
              @wraps[y][x][:down] = [ 99, 50 + (x - 100), :left ]
            end

            # 2, up
            if x >= 50 && x <= 99 && y == 0
              @wraps[y][x][:up] = [ 0, 150 + (x - 50), :right ]
            end

            # 2, left
            if x == 50 && y >= 0 && y <= 49
              @wraps[y][x][:left] = [ 0, 149 - y, :right ]
            end

            # 3, left
            if x == 50 && y >= 50 && y <= 99
              @wraps[y][x][:left] = [ y - 50, 100, :down ]
            end

            # 3, right
            if x == 99 && y >= 50 && y <= 99
              @wraps[y][x][:right] = [ 100 + (y - 50), 49, :up ]
            end

            # 4, right
            if x == 99 && y >= 100 && y <= 149
              @wraps[y][x][:right] = [ 149, 49 - (y - 100), :left ]
            end

            # 4, down
            if x >= 50 && x <= 99 && y == 149
              @wraps[y][x][:down] = [ 49, 150 + (x - 50), :left ]
            end

            # 5, up
            if x >= 0 && x <= 49 && y == 100
              @wraps[y][x][:up] = [ 50, 50 + x, :right ]
            end

            # 5, left
            if x == 0 && y >= 100 && y <= 149
              @wraps[y][x][:left] = [ 50, 49 - (y - 100), :right ]
            end

            # 6, left
            if x == 0 && y >= 150 && y <= 199
              @wraps[y][x][:left] = [ 50 + (y - 150), 0,  :down ]
            end

            # 6, down
            if x >= 0 && x <= 49 && y == 199
              @wraps[y][x][:down] = [ 100 + x, 0, :down ]
            end

            # 6, right
            if x == 49 && y >= 150 && y <= 199
              @wraps[y][x][:right] = [ 50 + (y - 150), 149, :up ]
            end
          end
        end
      end

      def next_step(x, y, direction)
        wrap = @wraps[y][x][direction]
        return wrap if wrap
        if direction == :right || direction == :left
          x += (direction == :right ? 1 : -1)
        elsif direction == :up || direction == :down
          y += (direction == :down ? 1 : -1)
        end
        return [x, y, direction]
      end

      def traverse(x, y, direction, distance)
        loop do
          x_next, y_next, direction_next = next_step(x, y, direction)
          return [x, y, direction] if point(x_next, y_next).is_blocked? || distance < 1
          distance -= 1
          x = x_next
          y = y_next
          direction = direction_next
        end
      end

      def to_s
        s = ""
        @map.each do |row|
          0.upto(@width - 1) do |x|
            if row[x]
              s << row[x].to_s
            else
              s << " "
            end
          end
          s << "\n"
        end
        s
      end

      def inspect
        s = ""
        @map.each do |row|
          s << row.inspect + "\n"
        end
        s
      end
    end

    def parse_input
      @instructions = input[-1].split(/(?<=[0-9][^0-9])/).map { |s| [s[0..-2].to_i, s[-1]] }.flatten[0..-2]
      map_lines = input[0..-3].map { |line| line[0..-2] }
      map_width = map_lines.max { |a, b| a.length <=> b.length }.length
      @map = Map.new(map_width, map_lines.length)
      map_lines.each_with_index do |line, y|
        chars = line.chars
        0.upto(map_width - 1) do |x|
          if chars[x] && chars[x] != ' '
            @map.add_point(x, y, chars[x])
            @start = [x, y] unless @start
          end
        end
      end
      @rota = { 'R' => { :right => :down, :down => :left, :left => :up, :up => :right },
                'L' => { :right => :up, :up => :left, :left => :down, :down => :right } }
      @direction_values = { :right => 0, :down => 1, :left => 2, :up => 3 }
    end

    def run_instructions!
      x = @start[0]
      y = @start[1]
      direction = :right
      @instructions.each do |instruction|
        if instruction == 'R' || instruction == 'L'
          direction = @rota[instruction][direction]
        else
          x, y, direction = @map.traverse(x, y, direction, instruction)
        end
      end
      1000 * (y + 1) + 4 * (x + 1) + @direction_values[direction]
    end

    def part1!
      @map.freeze
      run_instructions!
    end

    def part2!
      @map.freeze(true)
      run_instructions!
    end

  end
end

